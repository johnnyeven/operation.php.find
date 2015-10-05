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
	'([A-Za-z0-9_\-]+)/([A-Za-z0-9_\-]+)/merge_request/add'  =>  [
		[
			'field'     =>  'iptTitle',
			'rules'     =>  'required'
		],
		[
			'field'     =>  'sourceRepo',
			'rules'     =>  'required'
		],
		[
			'field'     =>  'targetRepo',
			'rules'     =>  'required'
		],
		[
			'field'     =>  'sltSourceBranch',
			'rules'     =>  'required'
		],
		[
			'field'     =>  'sltTargetBranch',
			'rules'     =>  'required'
		]
	]
);