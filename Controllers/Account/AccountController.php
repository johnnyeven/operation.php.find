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

namespace Controllers\Account;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

use Foundation\Controller;
use Foundation\Http\Request;
use Foundation\Http\Response;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\View;

class AccountController extends Controller
{
	function __construct(Request $request, Response $response)
	{
		parent::__construct($request, $response);
		$this->app->loader->helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');
	}

	public function index($userName)
	{
		View::render('panel_index', array(
			'pageName'  =>  'panel_index'
		));
	}

	public function login()
	{
		View::render('login');
	}

	public function register()
	{
		View::render('register');
	}

	public function createProject()
	{
		View::render('create_project');
	}
}