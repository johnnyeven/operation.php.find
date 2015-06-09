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
use Models\Account;

class AccountController extends Controller
{
	/**
	 * @var \Foundation\Library\Validation
	 */
	private $validation;

	function __construct(Request $request, Response $response)
	{
		parent::__construct($request, $response);
		$this->app->loader->helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');

		$this->validation = $this->app->loader->library('Validation');
		$this->validation->load('Account');

		if(!$this->validation->run())
		{
			$errors = $this->validation->error();
			foreach($errors as $key => $value) {
				if(!empty($value)) {
					ErrorManager::throwCustomException(500, $value);
				}
			}
		}
	}

	public function index($userName)
	{
		$account = Account::get([
			'identifier'    =>  $userName
		]);
		if(empty($account))
		{
			return;
		}
		$account = $account[0];
		$projects = $account->projects;

		View::render('panel_index', array(
			'pageName'  =>  'panel_index',
			'account'   =>  $account,
			'projects'  =>  $projects
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

	public function processLogin()
	{
		$args = $this->app->request->input()->post();

		/**
		 * @var \Foundation\Library\Connection\Connection $connection
		 */
		$connection = $this->app->loader->library('Connection/Connection');
		$remote = $connection->loadRemote('ucenter.User.UserController');
		$result = $remote->login(array(
			'username'  =>  $args['username'],
			'password'  =>  $args['password']
		), 'POST', 'json');

		if($result['code'] == '0')
		{
			$uid = $result['data']['id'];
			$account = Account::get(array(
				'uid'   =>  $uid
			));
			if(!empty($account))
			{
				$account = $account[0];
				$result['data']['account'] = $account->getOriginalData();
			}
			else
			{
				ErrorManager::getInstance()->throwException(10001);
			}
			$tokenName = $this->app->config->get('App.cookie_prefix') . $this->app->config->get('App.token_cookie_name');
			$this->app->request->input()->setCookie($tokenName, $result['data']['authInfo']['token']);
		}
		$this->app->response->json($result);
	}
}