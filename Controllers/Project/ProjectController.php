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

namespace Controllers\Project;

use Foundation\Controller;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\View;
use Models\Account;
use Models\Project;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class ProjectController extends Controller
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

	public function index($userName, $projectName)
	{
		View::render('project_index', array(
			'pageName'      =>  'project_index',
			'account'       =>  $this->account,
			'project'       =>  $this->project
		));
	}

	public function bug($userName, $projectName)
	{
		View::render('project_bug', array(
			'pageName'      =>  'project_bug',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function module($userName, $projectName)
	{
		View::render('project_module', array(
			'pageName'      =>  'project_module',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function notice($userName, $projectName)
	{
		View::render('project_notice', array(
			'pageName'      =>  'project_notice',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function release($userName, $projectName)
	{
		View::render('project_release', array(
			'pageName'      =>  'project_release',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function requirement($userName, $projectName)
	{
		View::render('project_requirement', array(
			'pageName'      =>  'project_requirement',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function task($userName, $projectName)
	{
		View::render('project_task', array(
			'pageName'      =>  'project_task',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function wiki($userName, $projectName)
	{
		View::render('project_wiki', array(
			'pageName'      =>  'project_wiki',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}

	public function document($userName, $projectName)
	{
		View::render('project_document', array(
			'pageName'      =>  'project_document',
            'account'       =>  $this->account,
            'project'       =>  $this->project
		));
	}
}