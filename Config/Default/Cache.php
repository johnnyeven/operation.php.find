<?php
/**
 * Created by PhpStorm.
 * User: johnnyeven
 * Date: 2015/4/6
 * Time: 16:34
 */

return array(
//    'cache_driver'      =>  'redis',
//    'cache_host'        =>  '127.0.0.1',
//    'cache_port'        =>  6379,
//    'cache_password'    =>  '',
//    'cache_timeout'     =>  60

//    'cache_driver'      =>  'file',
//    'cache_host'        =>  '127.0.0.1',
//    'cache_port'        =>  6379,
//    'cache_password'    =>  '',
//    'cache_timeout'     =>  60,
//    'cache_path'        =>  'Tmp/Cache'

    'cache_driver'      =>  'mongo',
    'cache_host'        =>  '127.0.0.1',
    'cache_port'        =>  27017,
    'cache_username'    =>  '',
    'cache_password'    =>  '',
    'cache_timeout'     =>  86400,
    'cache_database'    =>  'default'
);