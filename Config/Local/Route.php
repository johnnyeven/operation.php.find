<?php
use Foundation\Application;
use Foundation\Http\Request;
use Foundation\Http\Response;

$app =& Application::getInstance();
$router =& $app->router;

$router->get('/', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('index');
});

$router->get('login', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('login');
});

$router->get('register', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('register');
});

$router->get('create', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('create_project');
});

$router->get('([A-Za-z0-9]+)', 'Panel/PanelController.index');
$router->get('([A-Za-z0-9_-]+)/([A-Za-z0-9_\-\.]+)', 'Project/ProjectController.index');

