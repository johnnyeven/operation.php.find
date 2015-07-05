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

namespace ErrorHandler;


class GitErrorHandler extends ErrorHandler
{
    public function proceed()
    {
        $stderr = fopen('php://stderr', 'w');
        if($stderr)
        {
            fwrite($stderr, $this->error->getMessage() . "\n");
        }
        exit(0);
    }
}