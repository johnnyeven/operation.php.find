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
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\View;
use Models\Account;
use Models\Project;
use Proxy\RepositoryProxy;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class RepoController extends Controller
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
        Loader::helper('Url');
        View::registerFunction('baseUrl', 'baseUrl');
        $this->account = Request::getParameter('account');
        $this->project = Request::getParameter('project');
    }

    public function tree($userName, $projectName, $treePath = null)
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

        $tree = $repoProxy->getTree($branch, $path);
        $files = $tree->output();

        View::render('project_repo_tree', array(
            'pageName'      =>  'project_repo_tree',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'branch'        =>  $branch,
            'files'         =>  $files
        ));
    }
}