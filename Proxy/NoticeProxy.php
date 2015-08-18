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

namespace Proxy;


use Foundation\Proxy;
use Models\Notice;

class NoticeProxy extends Proxy
{
    public function getNoticeByProject($projectId, $limit, $offset)
    {
        return Notice::where('find_project_notice.project_id', $projectId)
            ->limit($limit)
            ->offset($offset)
            ->get();
    }

    public function getNoticeByUser($uid, $limit, $offset)
    {
        return Notice::where('find_project_notice.uid', $uid)
            ->limit($limit)
            ->offset($offset)
            ->get();
    }
}