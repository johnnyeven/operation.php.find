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

namespace Commands;


use Foundation\Command;
use Foundation\Support\Facades\Loader;

class FindProjectCommand extends Command
{

    /**
     * 抽象方法，触发命令执行
     *
     * @return mixed
     */
    public function fire()
    {
        if(Loader::library('FindProjects', [
            'args'  =>  $this->args
        ])->execute())
        {
            exit(0);
        }
        else
        {
            exit(1);
        }
    }
}