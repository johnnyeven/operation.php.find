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

use Extend\Library\NoticeAdapter\NoticeAdapter;
use Foundation\Controller;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Request;
use Foundation\Support\Facades\Response;
use Foundation\Support\Facades\View;
use Models\Account;

class AccountController extends Controller
{
	/**
	 * @var \Foundation\Library\Validation
	 */
	private $validation;

	function __construct()
	{
		parent::__construct();
		Loader::helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');

		$this->validation = Loader::library('Validation');
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
		$account = Request::getParameter('account');
		$projects = $account->projects;

		/**
		 * @var \Proxy\ProjectProxy $projectProxy
		 */
		$projectProxy = Loader::proxy('ProjectProxy');
		$otherProjects = $projectProxy->getProjectByUid($account->uid);

		/**
		 * @var \Proxy\NoticeProxy $noticeProxy
		 */
		$noticeProxy = Loader::proxy('NoticeProxy');
		$notices = $noticeProxy->getNoticeByUser($account->uid, 15);

		Loader::library('NoticeAdapter/NoticeAdapter', null, FALSE);
		$noticeFormats = [];
		foreach($notices as $notice)
		{
			$noticeFormats[] = NoticeAdapter::newNotice($notice);
		}

		View::render('panel_index', array(
			'pageName'  =>  'panel_index',
			'account'   =>  $account,
			'projects'  =>  $projects,
            'projectsCount' =>  $otherProjects['count'],
			'otherProjects' =>  $otherProjects['otherProjects'],
			'notices'   =>  $noticeFormats
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
		$currentAccount = Request::getParameter('currentAccount');
		View::render('create_project', [
			'pageName'  =>  'create_project',
			'account'   =>  $currentAccount
		]);
	}

	public function processLogin()
	{
		$args = Input::post();

		/**
		 * @var \Foundation\Library\Connection\Connection $connection
		 */
		$connection = Loader::library('Connection/Connection');
		$remote = $connection->loadRemote('ucenter.User.UserController');
		$result = $remote->login(array(
			'username'  =>  $args['username'],
			'password'  =>  $args['password']
		), 'POST', 'json');

		if($result['code'] == '0')
		{
			$uid = $result['data']['id'];
			$account = Account::findOne(array(
				'uid'   =>  $uid
			));
			if(!empty($account))
			{
				$account->ucenter_token = $result['data']['authInfo']['token'];
				$account->token_expired = $result['data']['authInfo']['expired'];
				$account->save();
				$result['data']['account'] = $account->getOriginalData();
			}
			else
			{
				ErrorManager::getInstance()->throwException(10001);
			}
			$tokenName = $this->app->config->get('App.cookie_prefix') . $this->app->config->get('App.token_cookie_name');
			Input::setCookie($tokenName, $result['data']['authInfo']['token']);
		}
		Response::json($result);
	}

	public function processRegister()
	{

	}

    public function processCreateProject()
    {
        $args = Input::post();
		$currentAccount = Request::getParameter('currentAccount');

        /**
         * @var \Proxy\ProjectProxy $projectProxy
         */
        $projectProxy = Loader::proxy('ProjectProxy');
		//创建项目
        $project = $projectProxy->createProject($args);
		//创建初始角色
		$projectRole = $projectProxy->createProjectRole(config('App.project_role_init_name'), config('App.project_role_init_permission'), $project->id);
		//创建初始项目成员关系
		$projectProxy->createProjectMemberRelation($project->id, $projectRole->role_id, $currentAccount->uid);

	    /**
	     * @var \Extend\Library\ShellAdapter $projectShell
	     */
	    $projectShell = Loader::library('ShellAdapter');
		$projectShell->createProject($currentAccount->identifier . DIRECTORY_SEPARATOR . $project->identifier);

        Response::json([
            'code'  =>  0,
            'data'  =>  [
                'project'   =>  $project,
                'account'   =>  Request::getParameter('currentAccount')
            ]
        ]);
    }
}