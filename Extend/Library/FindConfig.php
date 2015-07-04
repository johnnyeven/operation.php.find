<?php
/**
 * Find Git Shell
 *
 * PHP Version 5.4
 *
 * @category  Foundation/Find
 * @author    johnnyeven <johnnyeven@gmail.com>
 * @copyright 2015 operation.php
 * @license   http://opensource.org/licenses/gpl-2.0.php GNU General Public License
 * @version   Alpha: 0.2
 * @link
 */

namespace Extend\Library;

use Foundation\Application;
use Foundation\Support\Facades\Exception;

class FindConfig
{
    private static $_instance;
    private static $_allowInstance = FALSE;
    private $_config;

    public static function &getInstance()
    {
        if(!self::$_instance)
        {
            self::$_allowInstance = TRUE;
            self::$_instance = new FindConfig();
            self::$_allowInstance = FALSE;
        }
        return self::$_instance;
    }

    function __construct()
    {
        if(self::$_allowInstance)
        {
            Application::getInstance()->config->load('ShellConfig');
            $this->_config = Application::getInstance()->config->get('ShellConfig');
        }
        else
        {
            Exception::throwException(101, ['FindConfig']);
        }
    }

    public function home()
    {
        return getenv('HOME');
    }

    public function commonLogFile()
    {
        return !empty($this->_config['common_log_file']) ?
            $this->_config['common_log_file'] : 'shell_common';
    }

    public function errorLogFile()
    {
        return !empty($this->_config['error_log_file']) ?
            $this->_config['error_log_file'] : 'shell_error';
    }

    public function reposPath()
    {
        return !empty($this->_config['repo_path']) ?
            $this->_config['repo_path'] : realpath($this->home() . DIRECTORY_SEPARATOR . 'repos');
    }

    public function pubkeyPath()
    {
        return !empty($this->_config['pubkey_path']) ?
            $this->_config['pubkey_path'] : realpath($this->home() . DIRECTORY_SEPARATOR . '.ssh/authorized_keys');
    }

    public function gitAnnexEnabled()
    {
        return isset($this->_config['git_annex_enabled']) ?
            $this->_config['git_annex_enabled'] : false;
    }
}