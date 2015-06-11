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
use Models\Project;

class ProjectAuthHook implements IHookable
{

	public function handle(Request $request, Response $response, array $params = null)
	{
		if($request->hasParameter('account') && is_array($params) && isset($params[1]))
		{
			$account = $request->getParameter('account');
			$project = Project::findOne([
				'uid'           =>  $account->uid,
				'identifier'    =>  $params[1]
			]);
			if(!empty($project))
			{
				$project = $project[0];
				$request->addParameter('project', $project);
			}
			else
			{
				ErrorManager::getInstance()->throwException(10003);
			}
		}
		else
		{
			ErrorManager::getInstance()->throwException(10001);
		}
	}
}