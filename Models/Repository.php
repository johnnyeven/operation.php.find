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

use Foundation\Support\Facades\Loader;

class Repository
{
    /**
     * @var \Extend\Library\ShellAdapter $projectShell
     */
    private $_shell;
    private $_path;
    private $_defaultBranch;
    private $_currentBranch;
    private $_branches = [];
    private $_tags = [];

    function __construct($accountIdentifier, $projectIdentifier, $currentBranch = null)
    {
        $this->_shell = Loader::library('ShellAdapter');
        $repoHome = $this->_shell->getRepoHome();
        $this->_path = $repoHome . DS . $accountIdentifier . DS . $projectIdentifier . '.git';
        $this->_defaultBranch = $this->_shell->getCurrentBranch($this);
        $this->_currentBranch = $currentBranch;
    }

    public function setCurrentBranch($currentBranch)
    {
        $this->_currentBranch = $currentBranch;
    }

    public function getCurrentBranch()
    {
        return $this->_currentBranch;
    }

    public function getBlob($hash)
    {
        return $this->_shell->getBlob($this, $hash);
    }

    public function getPath()
    {
        return $this->_path;
    }

    public function hasCommit($hash)
    {
        return $this->_shell->hasCommit($this, $hash);
    }

    public function getTags()
    {
        if(empty($this->_tags))
        {
            $this->_tags = $this->_shell->getTags($this);
        }
        return $this->_tags;
    }

    public function getBranches()
    {
        if(empty($this->_branches))
        {
            $this->_branches = $this->_shell->getBranches($this);
        }
        return $this->_branches;
    }

    public function getTree($hash)
    {
        return $this->_shell->getTree($this, $hash);
    }

    public function getCommit($commitHash)
    {
        $logs = $this->_shell->getCommit($this, $commitHash);

        $xmlEnd = strpos($logs, '</item>') + 7;
        $commitInfo = substr($logs, 0, $xmlEnd);
        $commitData = substr($logs, $xmlEnd);
        $logs = explode("\n", $commitData);

        // Read commit metadata
        $format = Loader::library('PrettyFormat');
        $data = $format->parse($commitInfo);
        $commit = new Commit();
        $commit->importData($data[0]);

//        if ($commit->getParentsHash()) {
//            $command = 'diff ' . $commitHash . '~1..' . $commitHash;
//            $logs = explode("\n", $this->getClient()->run($this, $command));
//        }
//
//        $commit->setDiffs($this->readDiffLogs($logs));

        return $commit;
    }

    public function getLastCommit($branch, $hash)
    {
        return $this->_shell->getLastCommit($this, $branch, $hash);
    }

    public function readme()
    {
        $result = $this->_shell->getBlob($this, $this->_defaultBranch . ':README.md');
        $parsedown = new \Parsedown();
        $result = $parsedown->text($result);
        return str_replace('<pre>', '<pre class="prettyprint linenums">', $result);
    }
}