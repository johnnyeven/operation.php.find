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

namespace Extend\Library;

class Shellwords
{
    public static function split($cmd)
    {
        $cmds = explode(' ', $cmd);
        for($i = 0; $i < count($cmds); ++$i)
        {
            $cmds[$i] = str_replace("'", '', $cmds[$i]);
        }

        return $cmds;
    }
}