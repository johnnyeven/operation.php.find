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
    public function format($light = FALSE)
    {
        $action = '';
        $extend = $this->_notice->workflow_extends;
        if(!empty($extend))
        {
            $extend = json_decode($extend, TRUE);
            if(isset($extend['status']))
            {
                $action .= '状态变更为 ' . $extend['status'];
            }
        }
        echo View::render('notice/notice_workflow' . ($light ? '_light' : ''), [
            'notice'    =>  $this->_notice,
            'action'    =>  $action
        ], TRUE);
    }
}