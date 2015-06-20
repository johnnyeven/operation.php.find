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

namespace Proxy;

use Foundation\Proxy;
use Models\Project;
use Models\ProjectMember;

class ProjectProxy extends Proxy
{
    public function createProject($args)
    {
        return [
            'identifier'    =>  'testttt'
        ];
    }

    public function getProjectByUid($uid)
    {
        $result = ProjectMember::where('uid', $uid)->get();
        if(empty($result))
        {
            return [
                'count'         =>  0,
                'otherProjects' =>  []
            ];
        }
        $projectIds = [];
        foreach($result as $value)
        {
            $projectIds[] = $value->project_id;
        }
        $result = Project::whereIn('id', $projectIds)
            ->where('uid !=', $uid)
            ->get();
        return [
            'count'         =>  count($projectIds),
            'otherProjects' =>  $result
        ];
    }
}