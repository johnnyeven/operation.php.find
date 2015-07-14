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

namespace Extend\Library;


use Foundation\Application;
use Foundation\Support\Facades\Exception;

class ShellAdapter
{
    private $_shellCmd;

    function __construct()
    {
        Application::getInstance()->config->load('ShellConfig');
        $config = Application::getInstance()->config->get('ShellConfig');
        if(!empty($config) && isset($config['shell_cmd']) && !empty($config['shell_cmd']))
        {
            $this->_shellCmd = $config['shell_cmd'];
        }
        else
        {
            Exception::throwException(10007);
        }
    }

    public function createProject($identifier)
    {

    }
}