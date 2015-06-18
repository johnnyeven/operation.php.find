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
    public function getProjectByUid($uid)
    {
        $result = ProjectMember::where('uid', $uid)->get();
        $projectIds = [];
        foreach($result as $value)
        {
            $projectIds[] = $value->project_id;
        }
        return Project::whereIn('id', $projectIds)
            ->where('uid !=', $uid)
            ->get();
    }
}