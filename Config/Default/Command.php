<?php
/**
 * Created by PhpStorm.
 * User: johnnyeven
 * Date: 2015/4/28
 * Time: 20:38
 */

return array(
    'git'     =>  array(
        'command'       =>  'Commands\\GitShellCommand',
        'description'   =>  '接管Git命令'
    ),
    'project'      =>  array(
        'command'       =>  'Commands\\FindProjectCommand',
        'description'   =>  '项目相关命令'
    )
);