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
use Models\ProjectRole;

class ProjectProxy extends Proxy
{
    /**
     * @param $args
     *
     * @return \Models\Project
     */
    public function createProject($args)
    {
        try
        {
            Project::getDB()->transactionStart();
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
            $guid->getGuid();
            $account = Request::getParameter('currentAccount');
            $project = Project::create([
                'id'            =>  $guid->toString(),
                'name'          =>  $name,
                'is_public'     =>  $isPublic,
                'identifier'    =>  $identifier,
                'uid'           =>  $account->uid
            ]);

            //创建初始角色
            $projectRole = $this->createProjectRole(config('App.project_role_init_name'), config('App.project_role_init_permission'), $project->id);
            //创建初始项目成员关系
            $this->createProjectMemberRelation($project->id, $projectRole->role_id, $account->uid);
            //创建版本库
            $this->createRepository($account->identifier, $project->identifier);

            Project::getDB()->transactionComplete();
            return $project;
        }
        catch(\Exception $e)
        {
            Project::getDB()->transactionRollback();
            throw $e;
        }
    }

    public function createProjectRole($roleName, $permission, $projectId)
    {
        if(!empty($roleName) && !empty($permission) && !empty($projectId))
        {
            $guid = Loader::library('Guid');
            $guid->getGuid();
            return ProjectRole::create([
                'role_id'       =>  $guid->toString(),
                'role_name'     =>  $roleName,
                'permission'    =>  $permission,
                'project_id'    =>  $projectId
            ]);
        }
        return null;
    }

    public function createProjectMemberRelation($projectId, $roleId, $uid)
    {
        if(!empty($projectId) && !empty($roleId) && !empty($uid))
        {
            return ProjectMember::create([
                'project_id'    =>  $projectId,
                'role_id'       =>  $roleId,
                'uid'           =>  $uid
            ]);
        }
        return null;
    }

    public function createRepository($accountIdentifer, $projectIdentifier)
    {
        /**
         * @var \Extend\Library\ShellAdapter $projectShell
         */
        $projectShell = Loader::library('ShellAdapter');
        $projectShell->createProject($accountIdentifer . DIRECTORY_SEPARATOR . $projectIdentifier);
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
            if(!in_array($value->project_id, $projectIds))
            {
                $projectIds[] = $value->project_id;
            }
        }
        $result = Project::whereIn('id', $projectIds)
            ->where('uid !=', $uid)
            ->get();
        return [
            'count'         =>  count($projectIds),
            'otherProjects' =>  $result
        ];
    }

    public function getProjectMemberCount($projectId)
    {
        return ProjectMember::where([
            'project_id'    =>  $projectId
        ])->countAllResults();
    }

    public function getProjectMemberWithRole($projectId)
    {
        $result = [];
        $roles = ProjectRole::where([
            'project_id'   =>  $projectId
        ])->limit(5)->get();
        array_walk($roles, function($role, $i) use(&$result)
        {
            $result[$role->role_name] = ProjectMember::where([
                'role_id'   =>  $role->role_id
            ])
                ->join('find_account', 'find_project_member.uid = find_account.uid')
                ->limit(5)
                ->get([
                    'find_account.uid',
                    'find_account.identifier',
                    'find_account.realname'
                ]);
        });

        return $result;
    }

    public function getReadme($projectId)
    {
        $project = Project::findOne([
            'id'    =>  $projectId
        ]);
        return $project->readme();
    }
}