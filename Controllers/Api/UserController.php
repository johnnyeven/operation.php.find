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
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Response;
use Models\Account;
use Models\Key;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class UserController extends Controller
{
    /**
     * @var \Foundation\Library\Validation
     */
    private $validation;

    function __construct()
    {
        parent::__construct();

        $this->validation = Loader::library('Validation');
        $this->validation->load('Api');

        if(!$this->validation->run())
        {
            $errors = $this->validation->error();
            foreach($errors as $key => $value) {
                if(!empty($value)) {
                    ErrorManager::throwCustomException(500, $value);
                }
            }
        }
    }

    public function getUserByKey()
    {
        $keyId = Input::post('key');
        $key = Key::findOne([
            'id'    =>  $keyId
        ]);
        if(!empty($key))
        {
            $account = Account::findOne([
                'uid'   =>  $key->uid
            ]);
            if(!empty($account))
            {
                Response::json([
                    'code'  =>  0,
                    'data'  =>  [
                        'key'   =>  $key,
                        'name'  =>  $account->identifier
                    ]
                ]);
                return;
            }
        }
        Response::json([
            'code'      =>  1,
            'message'   =>  '未获取帐号信息'
        ]);
    }
}