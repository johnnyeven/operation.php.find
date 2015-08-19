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

namespace Extend\Library\NoticeAdapter;

use Foundation\Application;
use Models\Account;
use Models\Notice;

class NoticeAdapter
{
    private static $_config = null;

    public static function newNotice(Notice $notice)
    {
        self::_loadConfig();
        if(isset(self::$_config[$notice->type]))
        {
            return new self::$_config[$notice->type]($notice);
        }
        return null;
    }

    private static function _loadConfig()
    {
        if(!self::$_config)
        {
            Application::getInstance()->config->load('NoticeAdapter');
            self::$_config = Application::getInstance()->config->get('NoticeAdapter');
        }
    }
}