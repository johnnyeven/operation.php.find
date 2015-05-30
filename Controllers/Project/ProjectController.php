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

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class ProjectController extends Controller
{
	function __construct(Request $request, Response $response)
	{
		parent::__construct($request, $response);
		$this->app->loader->helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');
	}

	public function index($userName, $projectName)
	{
		View::render('project_index', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function bug($userName, $projectName)
	{
		View::render('project_bug', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function module($userName, $projectName)
	{
		View::render('project_module', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function notice($userName, $projectName)
	{
		View::render('project_notice', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function release($userName, $projectName)
	{
		View::render('project_release', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function requirement($userName, $projectName)
	{
		View::render('project_requirement', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function task($userName, $projectName)
	{
		View::render('project_task', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function wiki($userName, $projectName)
	{
		View::render('project_wiki', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}

	public function document($userName, $projectName)
	{
		View::render('project_document', array(
			'userName'      =>  $userName,
			'projectName'   =>  $projectName
		));
	}
}