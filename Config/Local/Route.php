<?php
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Router;

Router::group([
    'beforeAction'  =>  [
        'apiCheckCode'
    ]
], function($router)
{
    Router::get('api/v3/get_user_by_key', 'Api/UserController.getUserByKey');
    Router::get('api/v3/check_access', 'Api/PermissionController.checkAccess');
});