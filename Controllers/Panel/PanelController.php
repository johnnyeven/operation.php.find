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

namespace Controllers\Panel;

use Foundation\Controller;
use Foundation\Http\Request;
use Foundation\Http\Response;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\View;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class PanelController extends Controller
{
	function __construct(Request $request, Response $response)
	{
		parent::__construct($request, $response);
		$this->app->loader->helper('Url');
		View::registerFunction('baseUrl', 'baseUrl');
	}

	public function index($userName)
	{
		View::render('panel_index');
	}
}