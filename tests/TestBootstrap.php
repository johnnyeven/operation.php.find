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

ini_set('display_error', 1);
error_reporting(E_ALL);

define('OPERATIONPHP', true);
define('APP_NAME', 'find');

require_once __DIR__ . '/../../../Env.php';
require_once __DIR__ . '/../../../core/Foundation/Support/StartLoader.php';
use Foundation\Support\StartLoader;
StartLoader::addDirectories(array(
    __DIR__ . '/../../../app/' . APP_NAME,
    __DIR__ . '/../../../core'
));
StartLoader::registerAutoLoader();

require_once __DIR__ . '/../Config/Env.php';
require_once __DIR__ . '/../../../core/Foundation/Support/Helpers/Common.php';
