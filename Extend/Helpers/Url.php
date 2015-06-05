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

if(!function_exists('ucenterUrl'))
{
	function ucenterUrl($uri = '')
	{
		global $app;
		return $app->config->get('App.ucenter_url') . ltrim($uri, '/');
	}
}