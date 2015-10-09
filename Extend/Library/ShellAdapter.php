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


use Foundation\Application;
use Foundation\Support\Facades\Exception;
use Models\Repository;
use Symfony\Component\Process\Process;

class ShellAdapter
{
    private $_shellCmd;

    function __construct()
    {
        Application::getInstance()->config->load('ShellConfig');
        $config = Application::getInstance()->config->get('ShellConfig');
        if(!empty($config) && isset($config['shell_cmd']) && !empty($config['shell_cmd']))
        {
            $this->_shellCmd = $config['shell_cmd'];
        }
        else
        {
            Exception::throwException(10007);
        }
    }

    public function checkout(Repository $repo, $branch)
    {
        $command = 'checkout ' . $branch;
        return $this->run($command);
    }

    public function merge(Repository $repo, $branch)
    {
        $command = 'merge ' . $branch;
        return $this->run($command);
    }

    public function getRepoHome()
    {
        $command = 'get-repo-home';
        return $this->run($command);
    }

    public function createProject($identifier)
    {
        $command = 'create-project ' . $identifier;
        return $this->run($command);
    }

    public function getCommits(Repository $repo, $hash, $page, $limit)
    {
        $command = "get-commits {$limit} {$page} {$hash}";
        return $this->run($command, $repo);
    }

    public function hasCommit(Repository $repo, $hash)
    {
        $command = 'has-commit ' . $hash;
        return $this->run($command, $repo);
    }

    public function getBranches(Repository $repo)
    {
        $command = 'get-branches';
        return $this->run($command, $repo);
    }

    public function getTags(Repository $repo)
    {
        $command = 'get-tags';
        return $this->run($command, $repo);
    }

    public function getCurrentBranch(Repository $repo)
    {
        $command = 'current-branch';
        return $this->run($command, $repo);
    }

    public function getTree(Repository $repo, $hash)
    {
        $command = 'get-tree ' . $hash;
        $result = $this->run($command, $repo);
        return $result;
    }

    public function getBlob(Repository $repo, $hash)
    {
        $command = 'get-blob ' . $hash;
        $result = $this->run($command, $repo);
        return $result;
    }

    public function getCommit(Repository $repo, $commitHash)
    {
        $command = 'get-commit ' . $commitHash;
        $result = $this->run($command, $repo);
        return $result;
    }

    public function getLastCommit(Repository $repo, $branch, $hash)
    {
        $command = 'get-last-commit ' . $branch . ' ' . $hash;
        $result = $this->run($command, $repo);
        return $result;
    }

    public function getDiff(Repository $repo, $baseBranch, $sourceBranch)
    {
        $command = "get-diff {$baseBranch}...{$sourceBranch}";
        $result = $this->run($command, $repo);
        return $result;
    }

    public function run($command, Repository $repo = null)
    {
        $repoPath = '';
        if(!is_null($repo))
        {
            $repoPath = ' --repoPath "' . $repo->getPath() . '"';
        }
        logDebug($this->_shellCmd . ' ' . $command . $repoPath);
        $process = new Process($this->_shellCmd . ' ' . $command . $repoPath);
        $process->setTimeout(180);
        $process->run();

        if (!$process->isSuccessful()) {
            Exception::throwException(10008, $process->getErrorOutput());
        }

        return $process->getOutput();
    }
}