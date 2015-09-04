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


class Blob
{
    private $_hash;
    private $_path;
    private $_branch;

    /**
     * @var Repository
     */
    private $_repo;

    private $_mode;
    private $_name;
    private $_size;
    private $_lastCommitId;

    /**
     * @var Commit
     */
    private $_lastCommit;

    function __construct($branch, $path, $hash, Repository $repo)
    {
        $this->_branch = $branch;
        $this->_path = $path;
        $this->_hash = $hash ? $hash : $path;
        $this->_repo = $repo;
    }

    public function parse()
    {
        $params = $this->_branch;
        if(!empty($this->_path))
        {
            $params .= ':' . $this->_getParentPath();
        }
        $data = $this->_repo->getTree($params);
        $lines = explode("\n", $data);
        $files = array();
        $fileName = $this->getNameByPath();

        foreach ($lines as $key => $line) {
            if (empty($line)) {
                unset($lines[$key]);
                continue;
            }

            $files[] = preg_split("/[\s]+/", $line, 5);
        }

        foreach ($files as $file)
        {
            if ($file[1] == 'commit')
            {
                // submodule
                continue;
            }

            if ($file[1] == 'blob' && $file[4] == $fileName)
            {
                $this->setHash($file[2]);
                $this->setMode($file[0]);
                $this->setName($file[4]);
                $this->setSize($file[3]);
                break;
            }
        }
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
    public function getPath()
    {
        return $this->_path;
    }

    /**
     * @param mixed $path
     */
    public function setPath($path)
    {
        $this->_path = $path;
    }

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
    public function getHash()
    {
        return $this->_hash;
    }

    /**
     * @param mixed $hash
     */
    public function setHash($hash)
    {
        $this->_hash = $hash;
    }

    public function output()
    {
        $args = '';
        if(!empty($this->_hash) && $this->_hash != $this->_path)
        {
            $args = $this->_hash;
        }
        else
        {
            $args = "{$this->_branch}:{$this->_path}";
        }
        $data = $this->_repo->getBlob($args);
        return $data;
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
     * @return Blob
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
     * @return Blob
     */
    public function setName($name)
    {
        $this->_name = $name;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getSize()
    {
        return $this->_size;
    }

    /**
     * @param mixed $size
     * @return Blob
     */
    public function setSize($size)
    {
        $this->_size = $size;
        return $this;
    }

    public function getNameByPath()
    {
        if(empty($this->_path))
        {
            return '';
        }
        $paths = explode('/', $this->_path);
        return array_pop($paths);
    }

    public function parseLastCommit()
    {
        $branch = $this->_repo->getCurrentBranch();
        if(!empty($branch))
        {
            $this->setLastCommitId(trim($this->_repo->getLastCommit($branch, $this->getPath()), "\n"));
            $this->setLastCommit($this->_repo->getCommit($this->getLastCommitId()));
        }
    }

    private function _getParentPath()
    {
        if(empty($this->_path))
        {
            return '';
        }
        $paths = explode('/', $this->_path);
        array_pop($paths);
        return implode('/', $paths);
    }

}