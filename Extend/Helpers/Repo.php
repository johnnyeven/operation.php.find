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

if(!function_exists('fetchRepoIdentifier'))
{
    function fetchRepoIdentifier($repoPath)
    {
        $regex = '/^([A-Za-z0-9\-_]+)\/([A-Za-z0-9\-_]+)\.git$/';
        $matches = [];
        if(preg_match($regex, $repoPath, $matches) > 0)
        {
            if(count($matches) > 2)
            {
                return $matches[2];
            }
        }
        return null;
    }
}