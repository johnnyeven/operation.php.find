<?php
/**
 * Link Platform
 *
 * PHP Version 5.4
 *
 * @category  Foundation
 * @author    johnnyeven <liyiwen@huoyunren.com>
 * @copyright 2015 Chinaway ltd.
 * @version   Alpha: $Id
 * @link
 */

use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\View;

if(!function_exists('fetchRepoIdentifier'))
{
    function fetchRepoIdentifier($repoPath)
    {
        $regex = '/^([A-Za-z0-9\-_]+)\/([A-Za-z0-9\-_]+)\.git$/';
        $matches = [];
        if(preg_match($regex, $repoPath, $matches) > 0)
        {
            if(count($matches) > 2)
            {
                return $matches[2];
            }
        }
        return null;
    }
}

if(!function_exists('getDefaultBranch'))
{
    function getDefaultBranch()
    {
        /**
         * @var \Models\Project $project
         */
        $project = Request::getParameter('project');
        if(!empty($project))
        {
            /**
             * @var \Proxy\RepositoryProxy $repoProxy
             */
            $repoProxy = \Foundation\Support\Facades\Loader::proxy('RepositoryProxy', [
                'project'   =>  $project
            ]);
            return $repoProxy->getDefaultBranch();
        }
        return 'master';
    }
}
if(!function_exists('fileSizeHumanReadable'))
{
    function fileSizeHumanReadable($size, $unit = 'B', $decimals = 1, $targetUnit = 'auto') {
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB');
        $theUnit = array_search(strtoupper($unit), $units); //初始单位是哪个
        //判断是否自动计算，
        if ($targetUnit != 'auto')
            $targetUnit = array_search(strtoupper($targetUnit), $units);
        //循环计算
        while ($size >= 1024) {
            $size/=1024;
            $theUnit++;
            if ($theUnit == $targetUnit)//已符合给定则退出循环吧！
                break;
        }
        return sprintf("%1\$.{$decimals}f", $size) . $units[$theUnit];
    }
}
if(!function_exists('parallelDiff'))
{
    function parallelDiff(\Models\GitDiff $diff)
    {
        $files = $diff->files;
        $result = [];

        /**
         * @var \Models\GitDiffFile $file
         */
        foreach($files as $m => $file)
        {
            $result[$m] = [
                'header'    =>  $file->header,
                'name'      =>  $file->file_name,
                'meta'      =>  $file->meta,
                'action'    =>  $file->action,
                'sections'   =>  []
            ];

            /**
             * @var \Models\GitDiffSection $section
             */
            foreach($file->sections as $j => $section)
            {
                $result[$m]['sections'][$j] = [
                    'header'    =>  $section->header,
                    'lines'     =>  []
                ];

                /**
                 * @var \Models\GitDiffLine $line
                 */
                /**
                 * @var \Models\GitDiffLine $lineNext
                 */
                $skipNext = FALSE;
                foreach($section->lines as $i => $line)
                {
                    $currentMode = $line->mode;
                    $currentLine = $line->line;
                    $lineLeftNum = $line->line_numbers['left'];
                    $lineRightNum = $line->line_numbers['right'];

                    if($i < count($section->lines) - 1)
                    {
                        $lineNext = $section->lines[$i+1];
                    }
                    else
                    {
                        $lineNext = null;
                    }

                    $nextMode = null;
                    $nextLine = null;
                    $nextLineLeftNum = null;
                    $nextLineRightNum = null;
                    if(!empty($lineNext))
                    {
                        $nextMode = $lineNext->mode;
                        $nextLine = $lineNext->line;
                        $nextLineLeftNum = $lineNext->line_numbers['left'];
                        $nextLineRightNum = $lineNext->line_numbers['right'];
                    }

                    if(empty($currentMode))
                    {
                        //左右匹配
                        $result[$m]['sections'][$j]['lines'][] = [
                            'mode'          =>  $currentMode,
                            'left_number'   =>  $lineLeftNum,
                            'left_content'  =>  $currentLine,
                            'nextMode'      =>  $currentMode,
                            'right_number'  =>  $lineRightNum,
                            'right_content' =>  $currentLine
                        ];
                    }
                    elseif($currentMode == -1)
                    {
                        if($nextMode == 1)
                        {
                            //左删右增
                            $result[$m]['sections'][$j]['lines'][] = [
                                'mode'          =>  $currentMode,
                                'left_number'   =>  $lineLeftNum,
                                'left_content'  =>  $currentLine,
                                'nextMode'      =>  $nextMode,
                                'right_number'  =>  $nextLineRightNum,
                                'right_content' =>  $nextLine
                            ];
                            $skipNext = TRUE;
                        }
                        elseif($nextMode == -1)
                        {
                            //连续删除

                            //左删右增
                            $result[$m]['sections'][$j]['lines'][] = [
                                'mode'          =>  $currentMode,
                                'left_number'   =>  $lineLeftNum,
                                'left_content'  =>  $currentLine,
                                'nextMode'      =>  $nextMode,
                                'right_number'  =>  '',
                                'right_content' =>  ''
                            ];
                        }
                    }
                    elseif($currentMode == 1)
                    {
                        if($skipNext)
                        {
                            $skipNext = FALSE;
                            continue;
                        }
                        //右增
                        $result[$m]['sections'][$j]['lines'][] = [
                            'mode'          =>  0,
                            'left_number'   =>  '',
                            'left_content'  =>  '',
                            'nextMode'      =>  $currentMode,
                            'right_number'  =>  $lineRightNum,
                            'right_content' =>  $currentLine
                        ];
                    }
                }
            }
        }
        $tmp = new \stdClass();
        $tmp->files = $result;
        return $tmp;
    }
}