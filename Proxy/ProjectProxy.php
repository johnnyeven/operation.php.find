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
use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Models\Project;
use Models\ProjectMember;

class ProjectProxy extends Proxy
{
    /**
     * @param $args
     *
     * @return \Models\Project
     */
    public function createProject($args)
    {
        $name = $args['name'];
        $identifier = $args['identifier'];
        $isPublic = $args['is_public'];

        $project = Project::findOne([
            'identifier'    =>  $identifier
        ]);
        if(!empty($project))
        {
            Exception::throwException(10006);
        }

        $guid = Loader::library('Guid');
        $account = Request::getParameter('currentAccount');
        $project = Project::create([
            'id'            =>  $guid->toString(),
            'name'          =>  $name,
            'is_public'     =>  $isPublic,
            'identifier'    =>  $identifier,
            'uid'           =>  $account->uid
        ]);

        return $project;
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