<?php
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Router;

Router::get('/', function() {
    registerFunction();
    \Foundation\Support\Facades\View::render('index');
});

Router::get('login', 'Account/AccountController.login');
Router::post('process_login', 'Account/AccountController.processLogin');
Router::get('register', 'Account/AccountController.register');
Router::get('process_register', 'Account/AccountController.processRegister');

Router::group([
    'beforeAction'  =>  'authAccountLoginWithException'
], function($router)
{
    Router::get('create', 'Account/AccountController.createProject');
    Router::post('process_create_project', 'Account/AccountController.processCreateProject');
});

Router::get('([A-Za-z0-9_\-]+)', [
    'beforeAction'  =>  'authAccount',
    'action'        =>  'Account/AccountController.index'
]);
Router::group([
    'beforeAction'  =>  [
        'authAccountLoginWithOutException',
        'authAccount',
        'authProject'
    ]
], function($router)
{
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)', [
        'beforeAction'  =>  'authAccount',
        'action'        =>  'Project/ProjectController.index'
    ]);
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/bug', 'Project/ProjectController.bug');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/module', 'Project/ProjectController.module');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/notice', 'Project/ProjectController.notice');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/release', 'Project/ProjectController.release');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/requirement', 'Project/ProjectController.requirement');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/task', 'Project/ProjectController.task');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/wiki', 'Project/ProjectController.wiki');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/document', 'Project/ProjectController.document');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/tree(/.*)?', 'Project/RepoController.tree');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/tree_logs', 'Project/RepoController.treeLogs');
    Router::get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/blob(/.*)?', 'Project/RepoController.blob');
});

Router::group([
    'beforeAction'  =>  [
        'apiCheckCode'
    ]
], function($router)
{
    Router::post('api/v3/get_user_by_key', 'Api/UserController.getUserByKey');
    Router::post('api/v3/check_access', 'Api/PermissionController.checkAccess');
});

function registerFunction()
{
    Loader::helper('Url');
    \Foundation\Support\Facades\View::registerFunction('baseUrl', 'baseUrl');
}