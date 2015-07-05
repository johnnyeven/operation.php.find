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

use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Loader;
use Foundation\Support\FindException;

class FindShell
{
    /**
     * @var \Proxy\FindProxy
     */
    protected $proxy;

    protected $keyId;

    protected $user;

    protected $originCommand;

    protected $config;

    protected $reposPath;

    protected $repoName;

    protected $repoPath;

    protected $gitCommandPath = '/usr/bin/';

    protected $gitCommand;

    protected static $gitCommandList = array(
        'git-upload-pack',
        'git-receive-pack',
        'git-upload-archive',
        'git-annex-shell'
    );

    function __construct($params)
    {
        $this->keyId = $params['keyId'];
        $this->originCommand = $params['command'];
        $this->config = FindConfig::getInstance();
        $this->reposPath = $this->config->reposPath();

        $this->proxy = Loader::proxy('FindProxy');
        $this->user = $this->proxy->getUserByKey($this->keyId);

        if(empty($this->user))
        {
            Exception::throwException(30002, [
                $this->keyId
            ]);
        }
    }

    public function execute()
    {
        if(empty($this->originCommand))
        {
            echo 'Welcome to FindPlatform ' . $this->user['name'] . ".You've successfully authenticated, but FindPlatform does not provide shell access.\n";
            return true;
        }

        try
        {
            $this->_parseCommand();
            $this->_verifyAccess();
            $this->_processCommand();
        }
        catch(\Exception $e)
        {
            logError($e->getMessage(), $this->config->errorLogFile());
            throw $e;
        }

        return true;
    }

    protected function _parseCommand()
    {
        $args = Shellwords::split($this->originCommand);
        $this->gitCommand = $args[0];

        if(!in_array($this->gitCommand, self::$gitCommandList))
        {
            Exception::throwException(30002, [
                $this->gitCommand,
                $this->user['name']
            ]);
        }

        if($this->gitCommand == 'git-annex-shell')
        {
            if(!$this->config->gitAnnexEnabled())
            {
                Exception::throwException(30002, [
                    $this->gitCommand,
                    $this->user['name']
                ]);
            }
        }
        else
        {
            if(count($args) != 2)
            {
                Exception::throwException(30002, [
                    $this->gitCommand,
                    $this->user['name']
                ]);
            }

            $this->repoName = $args[1];
        }
    }

    protected function _verifyAccess()
    {
        if(!$this->proxy->checkAccess($this->gitCommand, $this->repoName, $this->keyId))
        {
            Exception::throwException(30003, [
                $this->gitCommand,
                $this->user['name']
            ]);
        }
    }

    protected function _processCommand()
    {
        $this->repoPath = $this->reposPath . DIRECTORY_SEPARATOR . $this->repoName;


        if($this->gitCommand == 'git-annex-shell')
        {
            if(!$this->config->gitAnnexEnabled())
            {
                Exception::throwException(30002, [
                    $this->gitCommand,
                    $this->user['name']
                ]);
            }
        }
        else
        {
            logInfo("find-shell: executing git command '{$this->gitCommand} {$this->repoPath} by " . $this->user['name'] . ".", $this->config->commonLogFile());
            $this->_runCommand($this->gitCommand, array($this->repoPath));
        }
    }

    protected function _runCommand($command, $args = array())
    {
        pcntl_exec($this->gitCommandPath . $command, $args, $_ENV);
    }
}