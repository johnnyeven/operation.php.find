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

return array(
	'api/v3/check_access'  =>  [
		[
			'field'     =>  'command',
			'rules'     =>  'required'
		],
		[
			'field'     =>  'key_id',
			'rules'     =>  'required|minLength[1]|maxLength[20]|number'
		],
        [
            'field'     =>  'repo',
            'rules'     =>  'required'
        ]
	]
);