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
use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Response;
use Models\Key;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class PermissionController extends Controller
{
    public function checkAccess()
    {
        $command = Input::post('command');
        $keyId = Input::post('key_id');
        $repo = Input::post('repo');

        $key = Key::findOne([
            'id'    =>  $keyId
        ]);
        if(!empty($key))
        {

        }
        else
        {
            Exception::throwException(20001);
        }

        Response::json([
            'code'  =>  0,
            'data'  =>  true
        ]);
    }
}