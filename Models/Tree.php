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


class Tree
{
    private $_hash;
    private $_branch;
    private $_path;
    private $_mode;
    private $_name;
    private $_lastCommitId;

    /**
     * @var Commit
     */
    private $_lastCommit;

    /**
     * @var \Models\Repository
     */
    private $_repo;

    private $_data;

    private $_position = 0;

    function __construct($branch, $path, $hash, Repository $repo)
    {
        $this->_branch = $branch;
        $this->_path = $path;
        $this->_hash = $hash ? $hash : $path;
        $this->_repo = $repo;
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
    public function getHash()
    {
        return $this->_hash;
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
     * @return Tree
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
     * @return Tree
     */
    public function setName($name)
    {
        $this->_name = $name;
        return $this;
    }

    public function parse()
    {
        $params = $this->_branch;
        if(!empty($this->_path))
        {
            $params .= ":{$this->_path}";
        }
        $data = $this->_repo->getTree($params);
        $lines = explode("\n", $data);
        $files = array();
        $root = array();

        foreach ($lines as $key => $line) {
            if (empty($line)) {
                unset($lines[$key]);
                continue;
            }

            $files[] = preg_split("/[\s]+/", $line, 5);
        }

        foreach ($files as $file) {
            if ($file[1] == 'commit') {
                // submodule
                continue;
            }

            if ($file[0] == '120000') {
                $this->_repo->getBlob($file[2]);
                $show = $this->_repo->getBlob($file[2]);
                $tree = new Symlink();
                $tree->setMode($file[0]);
                $tree->setName($file[4]);
                $tree->setPath($show);
                $root[] = $tree;
                continue;
            }

            if ($file[1] == 'blob') {
                $blob = new Blob($this->_branch, !empty($this->_path) ? $this->_path . '/' . $file[4] : $file[4], $file[2], $this->_repo);
                $blob->setMode($file[0]);
                $blob->setName($file[4]);
                $blob->setSize($file[3]);
                $root[] = $blob;
                continue;
            }

            $tree = new Tree($this->_branch, !empty($this->_path) ? $this->_path . '/' . $file[4] : $file[4], $file[2], $this->_repo);
            $tree->setMode($file[0]);
            $tree->setName($file[4]);
            $root[] = $tree;
        }

        $this->_data = $root;
    }

    public function output()
    {
        $files = $folders = array();

        foreach ($this->_data as $node) {
            if ($node instanceof Blob) {
                $file['type'] = 'blob';
                $file['name'] = $node->getName();
                $file['size'] = $node->getSize();
                $file['mode'] = $node->getMode();
                $file['hash'] = $node->getHash();
                $file['path'] = $node->getPath();
                $commit = $node->getLastCommit();
                $author = $commit->getAuthor();
                $date = $commit->getDate();
                $file['commit'] = [
                    'hash'      =>  $commit->getHash(),
                    'shorthash' =>  $commit->getShortHash(),
                    'author'    =>  [
                        'name'  =>  $author->getName(),
                        'email' =>  $author->getEmail()
                    ],
                    'message'   =>  $node->getLastCommit()->getMessage(),
                    'time'      =>  $date->getTimestamp()
                ];
                $files[] = $file;
                continue;
            }

            if ($node instanceof Tree) {
                $folder['type'] = 'folder';
                $folder['name'] = $node->getName();
                $folder['size'] = '';
                $folder['mode'] = $node->getMode();
                $folder['hash'] = $node->getHash();
                $folder['path'] = $node->getPath();
                $commit = $node->getLastCommit();
                $author = $commit->getAuthor();
                $date = $commit->getDate();
                $folder['commit'] = [
                    'hash'      =>  $commit->getHash(),
                    'shorthash' =>  $commit->getShortHash(),
                    'author'    =>  [
                        'name'  =>  $author->getName(),
                        'email' =>  $author->getEmail()
                    ],
                    'message'   =>  $node->getLastCommit()->getMessage(),
                    'time'      =>  $date->getTimestamp()
                ];
                $folders[] = $folder;
                continue;
            }

            if ($node instanceof Symlink) {
                $folder['type'] = 'symlink';
                $folder['name'] = $node->getName();
                $folder['size'] = '';
                $folder['mode'] = $node->getMode();
                $folder['hash'] = '';
                $folder['path'] = $node->getPath();
                $commit = $node->getLastCommit();
                $author = $commit->getAuthor();
                $date = $commit->getDate();
                $folder['commit'] = [
                    'hash'      =>  $commit->getHash(),
                    'shorthash' =>  $commit->getShortHash(),
                    'author'    =>  [
                        'name'  =>  $author->getName(),
                        'email' =>  $author->getEmail()
                    ],
                    'message'   =>  $node->getLastCommit()->getMessage(),
                    'time'      =>  $date->getTimestamp()
                ];
                $folders[] = $folder;
            }
        }

        // Little hack to make folders appear before files
        $files = array_merge($folders, $files);

        $folder['type'] = 'folder';
        $folder['name'] = $node->getName();
        $folder['size'] = '';
        $folder['mode'] = $node->getMode();
        $folder['hash'] = $node->getHash();
        $commit = $node->getLastCommit();
        $author = $commit->getAuthor();
        $date = $commit->getDate();
        $folder['commit'] = [
            'hash'      =>  $commit->getHash(),
            'shorthash' =>  $commit->getShortHash(),
            'author'    =>  [
                'name'  =>  $author->getName(),
                'email' =>  $author->getEmail()
            ],
            'message'   =>  $node->getLastCommit()->getMessage(),
            'time'      =>  $date->getTimestamp()
        ];

        return [
            'current'   =>  $folder,
            'children'  =>  $files
        ];
    }

    public function valid()
    {
        return isset($this->_data[$this->_position]);
    }

    public function hasChildren()
    {
        return is_array($this->_data[$this->_position]);
    }

    public function next()
    {
        $this->_position++;
    }

    public function current()
    {
        return $this->_data[$this->_position];
    }

    public function getChildren()
    {
        return $this->_data[$this->_position];
    }

    public function rewind()
    {
        $this->_position = 0;
    }

    public function key()
    {
        return $this->_position;
    }

    public function parseLastCommit()
    {
        $branch = $this->_repo->getCurrentBranch();
        if(!empty($branch))
        {
            $this->setLastCommitId(trim($this->_repo->getLastCommit($branch, $this->getPath()), "\n"));
            $this->setLastCommit($this->_repo->getCommit($this->getLastCommitId()));
            foreach($this->_data as $node)
            {
                if($node instanceof Tree || $node instanceof Blob)
                {
                    $node->setLastCommitId(trim($this->_repo->getLastCommit($branch, $node->getPath()), "\n"));
                    $node->setLastCommit($this->_repo->getCommit($node->getLastCommitId()));
                }
            }
        }
        return null;
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
     * @return Tree
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

}