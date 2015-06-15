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

class Account extends Model
{
	protected $connection = 'default';
	protected $tableName = 'find_account';
	protected $primaryKey = 'uid';
	protected $autoIncrease = FALSE;

	public function projects()
	{
		return $this->hasMany('Project', 'uid');
	}

	public function notices()
	{
		return $this->hasMany('Notice', 'uid');
	}
}