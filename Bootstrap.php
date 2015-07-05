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
use Foundation\Support\Hook;
use Foundation\Support\Language;
use Foundation\Support\Security;
use Foundation\Support\Facades\Router;

try
{
    $app = new Foundation\Application();
    if(defined('CLI_MODE') && CLI_MODE)
    {
        $app->setCliMode(TRUE);
    }
    $app->config = new Config();
    $app->config->init();

    Router::init();

    $app->hook = new Hook();
    $app->language = new Language();
    $app->security = new Security();
    $app->start();
}
catch (Exception $e)
{
    \Foundation\Support\ErrorManager::getInstance()->handleException($e);
}