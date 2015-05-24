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

$router->get('panel', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('panel_index');
});


