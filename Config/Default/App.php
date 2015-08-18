<?php
/**
 * Created by PhpStorm.
 * User: johnny
 * Date: 2015/3/4
 * Time: 14:26
 */

return array(
    'debug'             =>  false,
    'url'               =>  'http://find.profzone.net/',
    'ucenter_url'       =>  'http://ucenter.profzone.net/',
    'timezone'          =>  'PRC',
    'time_format'       =>  'Y-m-d H:i:s',
    'locale'            =>  'en',
    'uri_protocol'      =>  'AUTO',
    'allow_get_array'   =>  true,
    'hook_enabled'      =>  true,
    'compress_output'   =>  TRUE,
    'language'          =>  'zh_cn',

    'log_enabled'       =>  TRUE,
    'log_level'         =>  array('INFO', 'DEBUG', 'ERROR'),

    'token_cookie_name' =>  'token',
    'cookie_prefix'     =>  '',
    'cookie_domain'     =>  '.profzone.net',
    'cookie_path'       =>  '/',
    'cookie_secure'     =>  false,
    'cookie_expire'     =>  86400,

    'sess_driver'           =>  'redis',
    'sess_cookie_name'      =>  'op_session',
    'sess_encrypt_cookie'	=>  false,
    'sess_database_host'    =>  'localhost',
    'sess_database_user'    =>  '',
    'sess_database_pass'    =>  '',
    'sess_database_port'    =>  6379,
    'sess_database_table'   =>  '',

    'global_xss_filtering'  =>  TRUE,
    'csrf_protection'       =>  FALSE,
    'csrf_token_name'       =>  'csrf_token',
    'csrf_cookie_name'      =>  'csrf_cookie',
    'csrf_expire'           =>  7200,

    'proxy_ips'             =>  '',

    'project_role_init_name'          =>  '项目负责人',
    'project_role_init_permission'    =>  'all'
);