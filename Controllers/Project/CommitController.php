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
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\Response;
use Foundation\Support\Facades\View;

class CommitController extends Controller
{
    /**
     * @var Account
     */
    private $account;

    /**
     * @var Project
     */
    private $project;

    function __construct()
    {
        parent::__construct();
        $this->account = Request::getParameter('account');
        $this->project = Request::getParameter('project');
    }

    public function lists($userName, $projectName, $treePath = null)
    {
        /**
         * @var \Proxy\RepositoryProxy $repoProxy
         */
        $repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        list($branch, $path) = $repoProxy->parseBranchAndPath($treePath);

        $repo = $repoProxy->getRepo();
        list($branch, $path) = $repoProxy->extractRef($repo, $branch, $path);

        $commits = $repoProxy->getCommitsOutput($branch, 1, 10);

        View::render('project_repo_commits', array(
            'pageName'      =>  'project_repo_commits',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'branch'        =>  $branch,
            'commits'       =>  $commits
        ));
    }

    public function apiLists($userName, $projectName, $treePath = null)
    {
        $page = Request::input()->request('page');
        $limit = Request::input()->request('limit');

        /**
         * @var \Proxy\RepositoryProxy $repoProxy
         */
        $repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        list($branch, $path) = $repoProxy->parseBranchAndPath($treePath);

        $repo = $repoProxy->getRepo();
        list($branch, $path) = $repoProxy->extractRef($repo, $branch, $path);

        $commits = $repoProxy->getCommitsOutput("{$branch}", empty($page) ? 1 : intval($page), empty($limit) ? 10 : intval($limit));
        array_walk($commits, function(&$commit, $date)
        {
            array_walk($commit, function(&$c, $i)
            {
                $c['time'] = $c['time']->diffFromNowHumanReadable();
            });
        });

        Response::json([
            'code'  =>  0,
            'data'  =>  [
                'userIdentifier'    =>  $userName,
                'projectIdentifier' =>  $projectName,
                'commits'           =>  $commits
            ]
        ]);
    }

    public function show($userName, $projectName, $hash = null)
    {
        /**
         * @var \Proxy\RepositoryProxy $repoProxy
         */
        $repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        $commit = $repoProxy->getCommit($hash, TRUE);

        $view = Input::get('view');
        $diff = $view == 'parallel' ? parallelDiff($commit->getDiffs()) : $commit->getDiffs();

        View::render('project_repo_commit', array(
            'pageName'      =>  'project_repo_commit',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'commit'        =>  $commit,
            'author'        =>  $commit->getAuthor(),
            'date'          =>  $commit->getDate(),
            'shorthash'     =>  $commit->getShortHash(),
            'hash'          =>  $commit->getHash(),
            'diff'          =>  $diff,
            'view'          =>  $view
        ));
    }

    public function showDiffRaw($userName, $projectName, $hash = null)
    {
        /**
         * @var \Proxy\RepositoryProxy $repoProxy
         */
        $repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        $commit = $repoProxy->getCommit($hash, TRUE);
        Response::setContentType('text/plain');
        Response::setOutput($commit->getDiffs()->getRawDiff());
    }

    public function getDiffPatch($userName, $projectName, $hash = null)
    {
        /**
         * @var \Proxy\RepositoryProxy $repoProxy
         */
        $repoProxy = Loader::proxy('RepositoryProxy', [
            'project'   =>  $this->project
        ]);
        $commit = $repoProxy->getCommit($hash, TRUE);
        Response::setContentType('text/plain');
        Response::setOutput($commit->getDiffs()->getRawDiff());
    }
}