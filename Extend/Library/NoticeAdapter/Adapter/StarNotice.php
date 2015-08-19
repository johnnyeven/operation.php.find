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

class StarNotice extends BaseNotice
{

    public function format($light = FALSE)
    {
        echo View::render('notice/notice_star' . ($light ? '_light' : ''), [
            'notice'    =>  $this->_notice
        ], TRUE);
    }
}