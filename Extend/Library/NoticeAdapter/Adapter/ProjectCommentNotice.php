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

class ProjectCommentNotice extends BaseNotice
{
    public function format()
    {
        $extend = $this->_notice->project_extends;
        $comment = '';
        if(!empty($extend))
        {
            $extend = json_decode($extend, TRUE);
            $comment = $extend['comment'];
        }
        echo View::render('notice/notice_project_comment', [
            'notice'    =>  $this->_notice,
            'account'   =>  $this->_account,
            'comment'   =>  $comment
        ], TRUE);
    }
}