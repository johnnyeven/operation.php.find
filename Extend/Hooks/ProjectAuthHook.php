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
use Models\Project;

class ProjectAuthHook implements IHookable
{

	public function handle(array $params = null)
	{
		if(Request::hasParameter('account') && is_array($params) && isset($params[1]))
		{
			$account = Request::getParameter('account');
			$project = Project::findOne([
				'uid'           =>  $account->uid,
				'identifier'    =>  $params[1]
			]);
			if(!empty($project))
			{
				$project = $project[0];
				Request::addParameter('project', $project);
			}
			else
			{
				Exception::throwException(10003);
			}
		}
		else
		{
			Exception::throwException(10001);
		}
	}
}