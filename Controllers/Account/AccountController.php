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
use Models\Notice;

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
		$notices = Notice::where('find_project_notice.uid', $account->uid)
			->join('find_project', 'find_project.id = find_project_notice.project_id', 'left')
			->join('find_workflow', 'find_workflow.id = find_project_notice.workflow_id', 'left')
			->limit(15)
			->get([
				'find_project_notice.id',
				'find_project_notice.uid',
				'find_project_notice.account_realname',
				'find_project_notice.project_id',
				'find_project_notice.project_name',
				'find_project_notice.type',
				'find_project_notice.workflow_id',
				'find_project_notice.description',
				'find_project_notice.createtime',
				'find_project.`name`',
				'find_project.description as project_description',
				'find_project.is_public',
				'find_project.identifier',
				'find_project.wiki_start_page_id',
				'find_workflow.number',
				'find_workflow.title',
				'find_workflow.description as workflow_description',
				'find_workflow.track_id',
				'find_workflow.parrent_id',
				'find_workflow.createtime as workflow_createtime',
				'find_workflow.updatetime',
				'find_workflow.`status`',
				'find_workflow.priority',
				'find_workflow.assign_to_id',
				'find_workflow.release_id',
				'find_workflow.starttime',
				'find_workflow.endtime'
			]);

		Loader::library('NoticeAdapter/NoticeAdapter', null, FALSE);
		$noticeFormats = [];
		foreach($notices as $notice)
		{
			$noticeFormats[] = NoticeAdapter::newNotice($notice, $account);
		}

		View::render('panel_index', array(
			'pageName'  =>  'panel_index',
			'account'   =>  $account,
			'projects'  =>  $projects,
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
		View::render('create_project');
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
				$account = $account[0];
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
}