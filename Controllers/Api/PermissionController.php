<?php

/**
 * Find Git Shell
 *
 * PHP Version 5.4
 *
 * @category  Foundation/Find
 * @author    johnnyeven <johnnyeven@gmail.com>
 * @copyright 2015 operation.php
 * @license   http://opensource.org/licenses/gpl-2.0.php GNU General Public License
 * @version   Alpha: 0.2
 * @link
 */

namespace Controllers\Api;

use Foundation\Controller;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Response;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class PermissionController extends Controller
{
    public function checkAccess()
    {
        Response::json([
            'code'  =>  0,
            'data'  =>  true
        ]);
    }
}