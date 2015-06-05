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
	'process_login'  =>  array(
		array(
			'field'     =>  'username',
			'rules'     =>  'required|minLength[6]|maxLength[16]|alphaNumeric'
		),
		array(
			'field'     =>  'password',
			'rules'     =>  'required|minLength[6]|maxLength[20]'
		)
	)
);