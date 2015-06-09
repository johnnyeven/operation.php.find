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

use Foundation\Http\Request;
use Foundation\Http\Response;
use Foundation\Support\ErrorManager;
use Foundation\Support\IHookable;
use Models\Account;

class AccountAuthHook implements IHookable
{

	public function handle(Request $request, Response $response, array $params = null)
	{
		if(is_array($params) && isset($params[0]))
		{
			$accountIdentifier = $params[0];
			$account = Account::get([
				'identifier'    =>  $accountIdentifier
			]);
			if(!empty($account))
			{
				$account = $account[0];
				$request->addParameter('account', $account);
			}
			else
			{
				ErrorManager::getInstance()->throwException(10002);
			}
		}
		else
		{
			ErrorManager::getInstance()->throwException(10002);
		}
	}
}