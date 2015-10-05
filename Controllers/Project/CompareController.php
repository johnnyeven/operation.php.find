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
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\View;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class CompareController extends Controller
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
        View::render('project_repo_compare', array(
            'pageName'      =>  'project_repo_compare',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches
        ));
    }

    public function compare($userName, $projectName, $sourceBranch, $targetBranch)
    {
        if(!empty($sourceBranch)
            && !empty($targetBranch))
        {
            try
            {
                $commits = $this->_repoProxy->getCommitsOutput("{$targetBranch}...{$sourceBranch}", 1, 100, FALSE);
                $lastCommit = $commits[count($commits) - 1];

                $view = Input::get('view');
                $diff = $this->_repoProxy->getDiff($targetBranch, $sourceBranch);
                $diff = $view == 'parallel' ? parallelDiff($diff) : $diff;
            }
            catch(\Exception $e)
            {
                return;
            }

            View::render('project_repo_compare_result', array(
                'pageName'      =>  'project_repo_compare_result',
                'account'       =>  $this->account,
                'project'       =>  $this->project,
                'sltBranches'   =>  $this->_sltBranches,
                'shorthash'     =>  $lastCommit['shorthash'],
                'hash'          =>  $lastCommit['hash'],
                'commits'       =>  $commits,
                'diff'          =>  $diff,
                'view'          =>  $view,
                'sourceBranch'  =>  $sourceBranch,
                'targetBranch'  =>  $targetBranch
            ));
        }
    }
}