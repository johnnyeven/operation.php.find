<?php
/**
 * Link Platform
 *
 * PHP Version 5.4
 *
 * @category  Foundation
 * @author    johnnyeven <liyiwen@huoyunren.com>
 * @copyright 2015 Chinaway ltd.
 * @version   Alpha: ${Id}
 * @link
 */

namespace Models;


class GitDiff
{
    public $files;
    private $raw_diff;

    function __construct($diffdata) {
        $this->raw_diff = $diffdata;
        $this->files = $this->get_files();
    }

    public function getRawDiff()
    {
        return $this->raw_diff;
    }

    private function get_files() {
        $files = array();
        $buffer = array();

        foreach(preg_split("/(\r?\n)/", $this->raw_diff) as $line){
            if (stripos($line, 'diff --git') === 0) {
                if (!empty($buffer)) {
                    $files[] = $buffer;
                    $buffer = array();
                }
            }
            $buffer[] = $line;
        }

        $files[] = $buffer;
        $obj_files = array();

        foreach($files as $file) {
            $obj_files[] = new GitDiffFile($file);
        }

        return $obj_files;
    }
}