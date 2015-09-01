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


class Symlink
{
    private $_mode;
    private $_name;
    private $_path;
    private $_branch;
    private $_lastCommitId;

    /**
     * @var Commit
     */
    private $_lastCommit;

    /**
     * @return mixed
     */
    public function getLastCommitId()
    {
        return $this->_lastCommitId;
    }

    /**
     * @param mixed $lastCommitId
     */
    public function setLastCommitId($lastCommitId)
    {
        $this->_lastCommitId = $lastCommitId;
    }

    /**
     * @return Commit
     */
    public function getLastCommit()
    {
        return $this->_lastCommit;
    }

    /**
     * @param Commit $lastCommit
     */
    public function setLastCommit($lastCommit)
    {
        $this->_lastCommit = $lastCommit;
    }

    /**
     * @return mixed
     */
    public function getBranch()
    {
        return $this->_branch;
    }

    /**
     * @param mixed $branch
     */
    public function setBranch($branch)
    {
        $this->_branch = $branch;
    }

    /**
     * @return mixed
     */
    public function getMode()
    {
        return $this->_mode;
    }

    /**
     * @param mixed $mode
     * @return Symlink
     */
    public function setMode($mode)
    {
        $this->_mode = $mode;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->_name;
    }

    /**
     * @param mixed $name
     * @return Symlink
     */
    public function setName($name)
    {
        $this->_name = $name;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getPath()
    {
        return $this->_path;
    }

    /**
     * @param mixed $path
     * @return Symlink
     */
    public function setPath($path)
    {
        $this->_path = $path;
        return $this;
    }
}