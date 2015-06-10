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
use Foundation\Http\Request;
use Foundation\Http\Response;
use Foundation\Support\ErrorManager;
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

	function __construct(Request $request, Response $response)
	{
		parent::__construct($request, $response);
		$this->app->loader->helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');
		$this->account = $this->request->getParameter('account');
		$this->project = $this->request->getParameter('project');
	}

	public function index($userName, $projectName)
	{
		View::render('project_index', array(
			'pageName'      =>  'project_index',
			'userName'      =>  $this->account->realname,
			'projectName'   =>  $this->project->name,
			'userIdentifier'      =>  $userName,
			'projectIdentifier'   =>  $projectName
		));
	}

	public function bug($userName, $projectName)
	{
		View::render('project_bug', array(
			'pageName'      =>  'project_bug',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function module($userName, $projectName)
	{
		View::render('project_module', array(
			'pageName'      =>  'project_module',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function notice($userName, $projectName)
	{
		View::render('project_notice', array(
			'pageName'      =>  'project_notice',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function release($userName, $projectName)
	{
		View::render('project_release', array(
			'pageName'      =>  'project_release',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function requirement($userName, $projectName)
	{
		View::render('project_requirement', array(
			'pageName'      =>  'project_requirement',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function task($userName, $projectName)
	{
		View::render('project_task', array(
			'pageName'      =>  'project_task',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function wiki($userName, $projectName)
	{
		View::render('project_wiki', array(
			'pageName'      =>  'project_wiki',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}

	public function document($userName, $projectName)
	{
		View::render('project_document', array(
			'pageName'      =>  'project_document',
            'userName'      =>  $this->account->realname,
            'projectName'   =>  $this->project->name,
            'userIdentifier'      =>  $userName,
            'projectIdentifier'   =>  $projectName
		));
	}
}