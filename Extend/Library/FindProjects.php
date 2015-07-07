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

namespace Extend\Library;


class FindProjects
{
    private $_args;

    private $_config;

    function __construct($args)
    {
        $this->_args = $args;
        $this->_config = FindConfig::getInstance();
    }

    public function execute()
    {
        if(!empty($this->_args) && !empty($this->_args[0]))
        {
            switch($this->_args[0])
            {
            case 'create-project':
                $this->_createProject();
                break;
            }
        }
    }

    public function getRepoPath($identifier)
    {
        return $this->_config->reposPath() . DIRECTORY_SEPARATOR . $identifier . '.git';
    }

    private function _createProject()
    {
        if (isset($this->_args[1]) && !empty($this->_args[1]))
        {
            $repoPath = $this->getRepoPath($this->_args[1]);
            mkdir($repoPath, 0777, true);
            $command = "git --git-dir={$repoPath} init --bare";
            shell_exec($command);
        }
    }
}