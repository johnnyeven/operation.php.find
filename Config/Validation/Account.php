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
	'process_login'  =>  [
		[
			'field'     =>  'username',
			'rules'     =>  'required|minLength[6]|maxLength[16]|alphaNumeric'
		],
		[
			'field'     =>  'password',
			'rules'     =>  'required|minLength[6]|maxLength[20]'
		]
	],
    'process_create_project'    =>  [
        [
            'field'     =>  'name',
            'rules'     =>  'required|minLength[6]|maxLength[32]'
        ],
        [
            'field'     =>  'identifier',
            'rules'     =>  'required|minLength[6]|maxLength[16]|alpha'
        ],
        [
            'field'     =>  'is_public',
            'rules'     =>  'required|number'
        ]
    ]
);