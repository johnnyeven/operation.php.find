<?php
use Foundation\Application;
use Foundation\Http\Request;
use Foundation\Http\Response;

$app =& Application::getInstance();
$router =& $app->router;

$router->get('/', function(Request $request, Response $response) {
	\Foundation\Support\Facades\View::render('index');
});

