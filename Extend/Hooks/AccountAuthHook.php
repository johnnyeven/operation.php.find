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

use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Request;
use Foundation\Support\IHookable;
use Models\Account;

class AccountAuthHook implements IHookable
{

	public function handle(array $params = null)
	{
		if(is_array($params) && isset($params[0]))
		{
			$accountIdentifier = $params[0];
			$account = Account::findOne([
				'identifier'    =>  $accountIdentifier
			]);
			if(!empty($account))
			{
				$account = $account[0];
				Request::addParameter('account', $account);
			}
			else
			{
				Exception::throwException(10002);
			}
		}
		else
		{
			Exception::throwException(10002);
		}
	}
}