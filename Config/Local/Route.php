<?php
use Foundation\Application;
use Foundation\Http\Request;
use Foundation\Http\Response;

$app =& Application::getInstance();
$app->loader->helper('Url');
$router =& $app->router;

$router->get('/', function(Request $request, Response $response) {
	registerFunction();
	\Foundation\Support\Facades\View::render('index');
});

$router->get('login', 'Account/AccountController.login');
$router->post('process_login', 'Account/AccountController.processLogin');
$router->get('register', 'Account/AccountController.register');
$router->get('create', 'Account/AccountController.createProject');
$router->get('([A-Za-z0-9]+)', 'Account/AccountController.index');

$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)', 'Project/ProjectController.index');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/bug', 'Project/ProjectController.bug');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/module', 'Project/ProjectController.module');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/notice', 'Project/ProjectController.notice');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/release', 'Project/ProjectController.release');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/requirement', 'Project/ProjectController.requirement');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/task', 'Project/ProjectController.task');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/wiki', 'Project/ProjectController.wiki');
$router->get('([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/document', 'Project/ProjectController.document');

function registerFunction()
{
	\Foundation\Support\Facades\View::registerFunction('baseUrl', 'baseUrl');
}