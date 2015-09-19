<?php
/**
 * Link Platform
 *
 * PHP Version 5.4
 *
 * @category  Foundation
 * @author    johnnyeven <liyiwen@huoyunren.com>
 * @copyright 2015 Chinaway ltd.
 * @version   Alpha: ${Id}
 * @link
 */

namespace Models;


class GitDiffLine
{
    function __construct($line, $lnum, $rnum, $mode)
    {
        $this->mode = $mode;
        $this->original_line = $line;
        $this->line_numbers = array('left' => $lnum, 'right' => $rnum);
        if ($s = substr($line, 1)) {
            $this->line = $s;
        } else {
            $this->line = '';
        }
    }

    public function __toString() {
        return $this->line;
    }

}