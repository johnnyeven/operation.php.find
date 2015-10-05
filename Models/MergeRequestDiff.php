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

namespace Models;

use Foundation\Database\Model\Model;

class MergeRequestDiff extends Model
{
    protected $connection = 'default';
    protected $tableName = 'find_merge_request_diff';
    protected $autoIncrease = FALSE;
}