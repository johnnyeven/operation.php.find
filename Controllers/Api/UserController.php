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

namespace Controllers\Api;

use Foundation\Controller;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Response;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class UserController extends Controller
{
    public function getUserByKey()
    {
        $key = Input::post('key');
        Response::json([
            'code'  =>  0,
            'data'  =>  [
                'key'   =>  $key,
                'name'  =>  'johnnyeven'
            ]
        ]);
    }
}