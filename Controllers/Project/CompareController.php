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

    function __construct()
    {
        parent::__construct();
        $this->account = Request::getParameter('account');
        $this->project = Request::getParameter('project');
    }

    public function index($userName, $projectName)
    {

        View::render('project_repo_compare', array(
            'pageName'      =>  'project_repo_compare',
            'account'       =>  $this->account,
            'project'       =>  $this->project
        ));
    }
}