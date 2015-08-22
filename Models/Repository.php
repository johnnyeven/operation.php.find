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
    private $_currentBranch;

    function __construct($accountIdentifier, $projectIdentifier)
    {
        $this->_shell = Loader::library('ShellAdapter');
        $repoHome = $this->_shell->getRepoHome();
        $this->_path = $repoHome . DS . $accountIdentifier . DS . $projectIdentifier . '.git';
        $this->_currentBranch = $this->_shell->getCurrentBranch($this);
    }

    public function getPath()
    {
        return $this->_path;
    }

    public function readme()
    {
        $result = $this->_shell->getBlob($this, $this->_currentBranch, 'README.md');
        $parsedown = new \Parsedown();
        $result = $parsedown->text($result);
        return str_replace('<pre>', '<pre class="prettyprint linenums">', $result);
    }
}