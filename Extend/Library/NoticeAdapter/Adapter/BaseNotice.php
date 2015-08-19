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

namespace Extend\Library\NoticeAdapter\Adapter;

use Models\Account;
use Models\Notice;
use Models\Project;

abstract class BaseNotice implements INoticeAdapter
{
    /**
     * @var Notice
     */
    protected $_notice;

    function __construct(Notice $notice)
    {
        $this->_notice = $notice;
    }
}