<?php
/**
 * Created by PhpStorm.
 * User: johnny
 * Date: 2015/3/4
 * Time: 15:47
 */

require_once __DIR__ . '/Config/Env.php';
require_once __DIR__ . '/../../core/Foundation/Support/Helpers/Common.php';

use Foundation\Config;
use Foundation\Routing\Router;
use Foundation\Support\Hook;
use Foundation\Support\Language;
use Foundation\Support\Loader;
use Foundation\Support\Security;

try
{
    $app = new Foundation\Application();
    if(defined('CLI_MODE') && CLI_MODE)
    {
        $app->setCliMode(TRUE);
    }
    $app->config = new Config();
    $app->config->init();
    $app->loader = new Loader();
    $app->router = new Router();
    $app->router->init();
    $app->hook = new Hook();
    $app->language = new Language();
    $app->security = new Security();
    $app->start();
}
catch (Exception $e)
{
    $filepath = appPath() . DIRECTORY_SEPARATOR . 'ErrorHandler' . EXT;
    if(file_exists($filepath)) {
        require_once $filepath;
        $handler = new \ErrorHandler($e);
        $handler->proceed();
    } else {
        echo '未定义错误处理器';
    }
}