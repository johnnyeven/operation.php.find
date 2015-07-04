<?php

/**
 * Find Git Shell
 *
 * PHP Version 5.4
 *
 * @category  Foundation/Find
 * @author    johnnyeven <johnnyeven@gmail.com>
 * @copyright 2015 operation.php
 * @license   http://opensource.org/licenses/gpl-2.0.php GNU General Public License
 * @version   Alpha: 0.2
 * @link
 */

namespace Commands;

use Foundation\Command;
use Foundation\Support\Facades\Loader;

class GitShellCommand extends Command
{

    /**
     * 抽象方法，触发命令执行
     *
     * @return mixed
     */
    public function fire()
    {
        $key = $this->args[0];
        $originCommand = getenv('SSH_ORIGINAL_COMMAND');

        $shell = Loader::library('FindShell', [
            'keyId'     =>  $key,
            'command'   =>  $originCommand
        ]);

        if($shell->execute())
        {
            exit(0);
        }
        else
        {
            exit(1);
        }
    }
}