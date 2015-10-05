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

namespace Controllers\Project;


use Foundation\Controller;
use Foundation\Database\Model\Model;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\View;
use Models\DateTime;
use Models\GitDiff;
use Models\MergeRequest;
use Models\MergeRequestDiff;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class MergeController extends Controller
{
    /**
     * @var Account
     */
    private $account;

    /**
     * @var Project
     */
    private $project;

    /**
     * @var \Proxy\RepositoryProxy
     */
    private $_repoProxy;

    private $_sltBranches;

    function __construct()
    {
        parent::__construct();
        $this->account = Request::getParameter('account');
        $this->project = Request::getParameter('project');
        $this->_repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        $this->_sltBranches = [
            'branches'  =>  $this->_repoProxy->getBranches(),
            'tags'      =>  $this->_repoProxy->getTags()
        ];
    }

    public function index($userName, $projectName)
    {
        $status = Input::get('status');
        $result = MergeRequest::find([]);
        View::render('project_repo_merge_request', array(
            'pageName'      =>  'project_repo_merge_request',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches,
            'result'        =>  $result
        ));
    }

    public function compare($userName, $projectName)
    {
        View::render('project_repo_merge_request_compare', array(
            'pageName'      =>  'project_repo_merge_request_compare',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'targetBranch'  =>  'master',
            'sltBranches'   =>  $this->_sltBranches
        ));
    }

    public function add($userName, $projectName)
    {
        $sourceRepo = Input::get('sltSourceRepo');
        $targetRepo = Input::get('sltTargetRepo');
        $sourceBranch = Input::get('sltSourceBranch');
        $targetBranch = Input::get('sltTargetBranch');

        if(!empty($sourceBranch)
            && !empty($targetBranch))
        {
            try
            {
                $commitsResult = $this->_repoProxy->getCommitsOutput("{$targetBranch}...{$sourceBranch}", 1, 100, FALSE);
                $lastCommit = $commitsResult[count($commitsResult) - 1];

                $commits = [];
                foreach($commitsResult as $commit)
                {
                    $key = $commit['time']->format('Y-m-d');
                    $commits[$key][] = $commit;
                }

                $view = Input::get('view');
                $diff = $this->_repoProxy->getDiff($targetBranch, $sourceBranch);
                $diff = $view == 'parallel' ? parallelDiff($diff) : $diff;
            }
            catch(\Exception $e)
            {
                return;
            }

            View::render('project_repo_merge_request_add', [
                'pageName'      =>  'project_repo_merge_request_add',
                'account'       =>  $this->account,
                'project'       =>  $this->project,
                'sltBranches'   =>  $this->_sltBranches,
                'shorthash'     =>  isset($lastCommit['shorthash']) ? $lastCommit['shorthash'] : '',
                'hash'          =>  isset($lastCommit['hash']) ? $lastCommit['hash'] : '',
                'message'       =>  isset($lastCommit['message']) ? $lastCommit['message'] : '',
                'commits'       =>  $commits,
                'diff'          =>  $diff,
                'view'          =>  $view,
                'sourceRepo'    =>  $sourceRepo,
                'targetRepo'    =>  $targetRepo,
                'sourceBranch'  =>  $sourceBranch,
                'targetBranch'  =>  $targetBranch
            ]);
        }
    }

    public function addSubmit()
    {
        /**
         * @var \Foundation\Library\Validation $validation
         */
        $validation = Loader::library('Validation');
        $validation->load('MergeRequest');

        if(!$validation->run())
        {
            $errors = $validation->error();
            foreach($errors as $key => $value) {
                if(!empty($value)) {
                    ErrorManager::throwCustomException(500, $value);
                }
            }
        }

        $title = Input::post('iptTitle');
        $comment = Input::post('iptComment');
        $assignee = Input::post('sltAssignee');
        $release = Input::post('sltRelease');
        $tags = Input::post('sltTag');
        $sourceRepo = Input::post('sourceRepo');
        $targetRepo = Input::post('targetRepo');
        $sourceBranch = Input::post('sltSourceBranch');
        $targetBranch = Input::post('sltTargetBranch');

        try
        {
            $commits = $this->_repoProxy->getCommitsOutput("{$targetBranch}...{$sourceBranch}", 1, 100, FALSE);
            /**
             * @var \Models\GitDiff $diff
             */
            $diff = $this->_repoProxy->getDiff($targetBranch, $sourceBranch);
            $diff = $diff->getRawDiff();
        }
        catch(\Exception $e)
        {
            return;
        }

        MergeRequest::getDB()->transactionStart();
        $time = time();
        try
        {
            $mergeRequest = MergeRequest::create([
                'id'                =>  guid(),
                'title'             =>  $title,
                'description'       =>  $comment,
                'createtime'        =>  $time,
                'updatetime'        =>  date('Y-m-d H:i:s', $time),
                'comment_count'     =>  0,
                'assign_uid'        =>  !empty($assignee) ? $assignee : null,
                'author_uid'        =>  $this->account->uid,
                'release_id'        =>  !empty($release) ? $release : null,
                'tags'              =>  !empty($tags) ? $tags : null,
                'status'            =>  'open',
                'source_project_identifier' =>  $sourceRepo,
                'source_branch'             =>  $sourceBranch,
                'target_project_identifier' =>  $targetRepo,
                'target_branch'             =>  $targetBranch
            ]);

            MergeRequestDiff::create([
                'id'                =>  guid(),
                'merge_request_id'  =>  $mergeRequest->id,
                'commits'           =>  serialize($commits),
                'diffs'             =>  $diff,
                'createtime'        =>  $time,
                'updatetime'        =>  date('Y-m-d H:i:s', $time)
            ]);
            MergeRequest::getDB()->transactionCommit();

            redirect("{$this->account->identifier}/{$this->project->identifier}/merge_request/detail/{$mergeRequest->id}");
        }
        catch(\Exception $e)
        {
            MergeRequest::getDB()->transactionRollback();
        }
    }

    public function detail($userName, $projectName, $mergeId)
    {
        $result = MergeRequest::findOne([
            'id'    =>  $mergeId
        ]);

        if(!empty($result))
        {
            $result->createtime = new DateTime(date('Y-m-d H:i:s', $result->createtime));
            $result->updatetime = new DateTime($result->updatetime);
            $diff = MergeRequestDiff::findOne([
                'merge_request_id'  =>  $result->id
            ]);
            if(!empty($diff))
            {
                $diff->commits = unserialize($diff->commits);
                $lastCommit = $diff->commits[count($diff->commits) - 1];
                $commits = [];
                foreach($diff->commits as $commit)
                {
                    $key = $commit['time']->format('Y-m-d');
                    $commits[$key][] = $commit;
                }
                $view = Input::get('view');
                $diff->diffs = new GitDiff($diff->diffs);
                $diff->diffs = $view == 'parallel' ? parallelDiff($diff->diffs) : $diff->diffs;

                View::render('project_repo_merge_request_detail', [
                    'pageName'      =>  'project_repo_merge_request_detail',
                    'account'       =>  $this->account,
                    'project'       =>  $this->project,
                    'result'        =>  $result,
                    'commits'       =>  $commits,
                    'diff'          =>  $diff->diffs,
                    'shorthash'     =>  $lastCommit['shorthash'],
                    'hash'          =>  $lastCommit['hash'],
                    'view'          =>  $view
                ]);
            }
        }
    }
}