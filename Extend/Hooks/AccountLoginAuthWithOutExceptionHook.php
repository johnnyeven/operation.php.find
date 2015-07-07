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

namespace Extend\Hooks;

use Foundation\Application;
use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Request;
use Foundation\Support\IHookable;
use Models\Account;

class AccountLoginAuthWithOutExceptionHook implements IHookable
{

    public function handle(array $params = null)
    {
        $tokenName = Application::getInstance()->config->get('App.cookie_prefix') . Application::getInstance()->config->get('App.token_cookie_name');
        $token = Input::cookie($tokenName);
        if(!empty($token))
        {
            $result = Account::where('ucenter_token', $token)->limit(1)->get();
            if(!empty($result))
            {
                $result = $result[0];
                if(time() < $result->token_expired)
                {
                    Request::addParameter('currentAccount', $result);
                }
            }
        }
    }
}