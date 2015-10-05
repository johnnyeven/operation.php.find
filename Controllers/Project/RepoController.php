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

    public function tree($userName, $projectName, $treePath = null)
    {
        list($branch, $path) = $this->_repoProxy->parseBranchAndPath($treePath);

        $repo = $this->_repoProxy->getRepo();
        list($branch, $path) = $this->_repoProxy->extractRef($repo, $branch, $path);

        $tree = $this->_repoProxy->getTreeOutput($branch, $path);

        $breadcrumb = $this->_repoProxy->getBreadcrumbs($path);


        View::render('project_repo_tree', array(
            'pageName'      =>  'project_repo_tree',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches,
            'branch'        =>  $branch,
            'breadcrumb'    =>  $breadcrumb,
            'files'         =>  $tree
        ));
    }

    public function branches($userName, $projectName)
    {
        $branches = $this->_repoProxy->getBranchesWithLastCommit();

        View::render('project_repo_branches', array(
            'pageName'      =>  'project_repo_branches',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches,
            'branches'      =>  $branches
        ));
    }

    public function tags($userName, $projectName)
    {
        $tags = $this->_repoProxy->getTagsWithLastCommit();

        View::render('project_repo_tags', array(
            'pageName'      =>  'project_repo_tags',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches,
            'tags'          =>  $tags
        ));
    }

    public function blob($userName, $projectName, $treePath = null)
    {
        list($branch, $path) = $this->_repoProxy->parseBranchAndPath($treePath);

        $repo = $this->_repoProxy->getRepo();
        list($branch, $path) = $this->_repoProxy->extractRef($repo, $branch, $path);

        $file = $this->_repoProxy->getBlobOutput($branch, $path);
        if($file['type'] == 'markdown')
        {
            $parsedown = new \Parsedown();
            $result = $parsedown->text($file['content']);
            $file['content'] = str_replace('<pre>', '<pre class="prettyprint linenums">', $result);
        }
        else
        {
            $file['content'] = htmlentities($file['content']);
        }

        $breadcrumb = $this->_repoProxy->getBreadcrumbs($path);

        View::render('project_repo_blob', array(
            'pageName'      =>  'project_repo_blob',
            'account'       =>  $this->account,
            'project'       =>  $this->project,
            'sltBranches'   =>  $this->_sltBranches,
            'branch'        =>  $branch,
            'breadcrumb'    =>  $breadcrumb,
            'file'          =>  $file
        ));
    }
}