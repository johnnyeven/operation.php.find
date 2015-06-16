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

use Foundation\Support\Facades\View;

class WorkflowNotice extends BaseNotice
{
    public function format()
    {
        echo View::render('notice/notice_workflow', [
            'notice'    =>  $this->_notice,
            'account'   =>  $this->_account
        ], TRUE);
    }
}