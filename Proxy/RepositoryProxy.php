<?php
/**
 * Operation.PHP Find Platform
 *
 * PHP Version 5.4
 *
 * @category  Foundation
 * @author    johnnyeven <johnnyeven@gmail.com>
 * @copyright 2015 Chinaway ltd.
 * @version   Alpha: $Id
 * @link
 */

namespace Proxy;


use Foundation\Proxy;
use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Loader;
use Models\Commit;
use Models\Project;
use Models\Repository;
use Models\Tree;

class RepositoryProxy extends Proxy
{
    /**
     * @var Project
     */
    private $_project;

    private $_repo;

    function __construct($param)
    {
        parent::__construct();

        if(isset($param['project']))
        {
            $this->_project = $param['project'];
            $this->_repo = $this->_project->repository();
        }
        else
        {
            Exception::throwCustomException(500, 'The repository must contain by a project');
        }
    }

    public function getRepo()
    {
        return $this->_repo;
    }

    public function hasCommit($commitName)
    {
        return $this->_repo->hasCommit($commitName);
    }

    public function getBranches()
    {
        return json_decode($this->_repo->getBranches());
    }

    public function getTags()
    {
        return json_decode($this->_repo->getTags());
    }

    public function getCommit($commitHash)
    {
        return $this->_repo->getCommit($commitHash);
    }

    public function parseBranchAndPath($treePath)
    {
        if($treePath[0] == '/')
        {
            $treePath = ltrim($treePath, '/');
        }
        $commitish = null;
        $path = null;

        $slashPosition = strpos($treePath, '/');
        if (strlen($treePath) >= 40 &&
            ($slashPosition === false ||
                $slashPosition === 40))
        {
            // We may have a commit hash as our commitish.
            $hash = substr($treePath, 0, 40);
            if ($this->hasCommit($hash))
            {
                $commitish = $hash;
            }
        }

        if ($commitish === null)
        {
            $branches = $this->getBranches();
            $tags = $this->getTags();
            if ($tags !== null && count($tags) > 0)
            {
                $branches = array_merge($branches, $tags);
            }

            $matchedBranch = null;
            $matchedBranchLength = 0;
            foreach ($branches as $branch)
            {
                if (strpos($treePath, $branch) === 0 &&
                    strlen($branch) > $matchedBranchLength)
                {
                    $matchedBranch = $branch;
                    $matchedBranchLength = strlen($matchedBranch);
                }
            }

            if ($matchedBranch !== null)
            {
                $commitish = $matchedBranch;
            }
            else
            {
                $hash = $slashPosition === false ? $treePath : substr($treePath, 0, $slashPosition);
                if ($this->hasCommit($hash))
                {
//                    $commit = $this->getCommit($hash);
//                    $commitish = $commit->getHash();
                }
                else
                {
//                    throw new EmptyRepositoryException('This repository is currently empty. There are no commits.');
                }
            }
        }

        $commitishLength = strlen($commitish);
        $path = substr($treePath, $commitishLength);
        if (strpos($path, '/') === 0)
        {
            $path = substr($path, 1);
        }
        $this->_repo->setCurrentBranch($commitish);
        return array($commitish, $path);
    }

    public function extractRef(Repository $repository, $branch = '', $tree = '')
    {
        $branch = trim($branch, '/');
        $tree = trim($tree, '/');
        $input = $branch . '/' . $tree;

        // If the ref appears to be a SHA, just split the string
        if (preg_match("/^([[:alnum:]]{40})(.+)/", $input, $matches)) {
            $branch = $matches[1];
        } else {
            // Otherwise, attempt to detect the ref using a list of the project's branches and tags
            $validRefs = array_merge(json_decode($repository->getBranches(), TRUE), json_decode($repository->getTags(), TRUE));
            foreach ($validRefs as $key => $ref) {
                if (!preg_match(sprintf("#^%s/#", preg_quote($ref, '#')), $input)) {
                    unset($validRefs[$key]);
                }
            }

            // No exact ref match, so just try our best
            if (count($validRefs) > 1) {
                preg_match('/([^\/]+)(.*)/', $input, $matches);
                $branch = preg_replace('/^\/|\/$/', '', $matches[1]);
            } else {
                // Extract branch name
                $branch = array_shift($validRefs);
            }
        }

        return array($branch, $tree);
    }

    public function getTree($branch, $path)
    {
        $tree = new Tree($branch, $path, null, $this->_repo);
        $tree->parse();
        $tree->parseLastCommit();

        return $tree;
    }
}