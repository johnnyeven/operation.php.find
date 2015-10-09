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
use Models\Account;
use Models\Blob;
use Models\Commit;
use Models\GitDiff;
use Models\Project;
use Models\Repository;
use Models\Tree;

class RepositoryProxy extends Proxy
{
    /**
     * @var Account
     */
    private $_account;
    /**
     * @var Project
     */
    private $_project;

    /**
     * @var Repository
     */
    private $_repo;

    /**
     * @var \Foundation\Library\Cache
     */
    private $_cache;

    function __construct($param)
    {
        parent::__construct();

        if(isset($param['project']))
        {
            $this->_project = $param['project'];
            $this->_account = $this->_project->account;
            $this->_repo = $this->_project->repository();
            $this->_cache = Loader::library('Cache');
        }
        else
        {
            Exception::throwCustomException(500, 'The repository must contain by a project');
        }
    }

    public function checkout($branch)
    {
        return $this->_repo->checkout($branch);
    }

    public function merge($branch)
    {
        return $this->_repo->merge($branch);
    }

    public function getRepo()
    {
        return $this->_repo;
    }

    public function getCommits($hash, $page, $limit)
    {
        return $this->_repo->getCommits($hash, $page, $limit);
    }

    public function getCommitsOutput($hash, $page, $limit, $isSortByDate = TRUE)
    {
//        $commits = $this->_cache->get($this->_buildCommitCacheId($hash));
//        if(is_null($commits))
//        {
            $result = $this->getCommits($hash, $page, $limit);
            $commits = [];

            /**
             * @var \Models\Commit $commit
             */
            foreach($result as $commit)
            {
                $author = $commit->getAuthor();
                $date = $commit->getDate();
                if($isSortByDate)
                {
                    $key = $date->format('Y-m-d');
                    if(!isset($commits[$key]))
                    {
                        $commits[$key] = [];
                    }
                    $commits[$key][] = [
                        'hash'      =>  $commit->getHash(),
                        'shorthash' =>  $commit->getShortHash(),
                        'author'    =>  [
                            'name'  =>  $author->getName(),
                            'email' =>  $author->getEmail()
                        ],
                        'message'   =>  $commit->getMessage(),
                        'time'      =>  $date
                    ];
                }
                else
                {
                    $commits[] = [
                        'hash'      =>  $commit->getHash(),
                        'shorthash' =>  $commit->getShortHash(),
                        'author'    =>  [
                            'name'  =>  $author->getName(),
                            'email' =>  $author->getEmail()
                        ],
                        'message'   =>  $commit->getMessage(),
                        'time'      =>  $date
                    ];
                }
            }
//            $this->_cache->set($this->_buildCommitCacheId($hash), $commits);
//        }
        return $commits;
    }

    public function hasCommit($commitName)
    {
        return $this->_repo->hasCommit($commitName);
    }

    public function getBranches()
    {
        $repo = $this->_cache->get($this->_buildRepoCacheId());
        if(isset($repo['branches']))
        {
            $branches = $repo['branches'];
        }
        else
        {
            $branches = $this->_repo->getBranches();
            if(!is_null($repo))
            {
                $repo['branches'] = $branches;
            }
            else
            {
                $repo = [
                    'branches'    =>  $branches
                ];
            }
            $this->_cache->set($this->_buildRepoCacheId(), $repo);
        }
        return json_decode($branches);
    }

    public function getBranchesWithLastCommit()
    {
        $branches = $this->getBranches();
        $defaultBranch = $this->getDefaultBranch();
        $result = [];
        foreach($branches as $branch)
        {
            $lastCommitId = trim($this->_repo->getLastCommit($branch, './'), "\n");
            $lastCommit = $this->_repo->getCommit($lastCommitId);
            $date = $lastCommit->getDate();
            $author = $lastCommit->getAuthor();
            $result[] = [
                'name'      =>  $branch,
                'default'   =>  $branch == $defaultBranch ? 1 : 0,
                'protected' =>  1,
                'merged'    =>  1,
                'commit'    =>  [
                    'hash'          =>  $lastCommit->getHash(),
                    'shorthash'     =>  $lastCommit->getShortHash(),
                    'message'       =>  $lastCommit->getMessage(),
                    'author'        =>  [
                        'name'          =>  $author->getName(),
                        'email'         =>  $author->getEmail()
                    ],
                    'date'          =>  $date->diffFromNowHumanReadable()
                ]
            ];
        }
        return $result;
    }

    public function getTagsWithLastCommit()
    {
        $tags = $this->getTags();
        $result = [];
        foreach($tags as $tag)
        {
            $lastCommitId = trim($this->_repo->getLastCommit($tag, './'), "\n");
            $lastCommit = $this->_repo->getCommit($lastCommitId);
            $date = $lastCommit->getDate();
            $author = $lastCommit->getAuthor();
            $result[] = [
                'name'      =>  $tag,
                'commit'    =>  [
                    'hash'          =>  $lastCommit->getHash(),
                    'shorthash'     =>  $lastCommit->getShortHash(),
                    'message'       =>  $lastCommit->getMessage(),
                    'author'        =>  [
                        'name'          =>  $author->getName(),
                        'email'         =>  $author->getEmail()
                    ],
                    'date'          =>  $date->diffFromNowHumanReadable()
                ]
            ];
        }
        return $result;
    }

    public function getTags()
    {
        $repo = $this->_cache->get($this->_buildRepoCacheId());
        if(isset($repo['tags']))
        {
            $tags = $repo['tags'];
        }
        else
        {
            $tags = $this->_repo->getTags();
            if(!is_null($repo))
            {
                $repo['tags'] = $tags;
            }
            else
            {
                $repo = [
                    'tags'    =>  $tags
                ];
            }
            $this->_cache->set($this->_buildRepoCacheId(), $repo);
        }
        return json_decode($tags);
    }

    public function getCommit($commitHash, $parseDiff = FALSE)
    {
        return $this->_repo->getCommit($commitHash, $parseDiff);
    }

    public function getDefaultBranch()
    {
        $repo = $this->_cache->get($this->_buildRepoCacheId());
        if(isset($repo['default_branch']))
        {
            $default = $repo['default_branch'];
        }
        else
        {
            $default = $this->_repo->getDefaultBranch();
            if(!is_null($repo))
            {
                $repo['default_branch'] = $default;
            }
            else
            {
                $repo = [
                    'default_branch'    =>  $default
                ];
            }
            $this->_cache->set($this->_buildRepoCacheId(), $repo);
        }
        return $default;
    }

    public function getCurrentBranch()
    {
        return $this->_repo->getCurrentBranch();
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

    public function getReadme()
    {
        $repo = $this->_cache->get($this->_buildRepoCacheId());
        if(isset($repo['readme']))
        {
            $readme = $repo['readme'];
        }
        else
        {
            $readme = $this->_repo->readme();
            if(!is_null($repo))
            {
                $repo['readme'] = $readme;
            }
            else
            {
                $repo = [
                    'readme'    =>  $readme
                ];
            }
            $this->_cache->set($this->_buildRepoCacheId(), $repo);
        }
        return $readme;
    }

    public function getBlob($branch, $path)
    {
        return new Blob($branch, $path, null, $this->_repo);
    }

    public function getBlobOutput($branch, $path)
    {
        $json = $this->_cache->get($this->_buildTreeCacheId($branch, $path));
        if(is_null($json))
        {
            Loader::helper('File');
            $blob = $this->getBlob($branch, $path);
            $blob->parse();
            $blob->parseLastCommit();
            $output = $blob->output();

            /**
             * @var \Models\Commit $commit
             */
            $commit = $blob->getLastCommit();
            $author = $commit->getAuthor();
            $date = $commit->getDate();
            $json = [
                'name'      =>  $blob->getName(),
                'type'      =>  getFileType($blob->getName()),
                'path'      =>  $blob->getPath(),
                'hash'      =>  $blob->getHash(),
                'size'      =>  $blob->getSize(),
                'content'   =>  $output,
                'commit'    =>  [
                    'hash'      =>  $commit->getHash(),
                    'shorthash' =>  $commit->getShortHash(),
                    'author'    =>  [
                        'name'  =>  $author->getName(),
                        'email' =>  $author->getEmail()
                    ],
                    'message'   =>  $commit->getMessage(),
                    'time'      =>  $date
                ]
            ];
            $this->_cache->set($this->_buildTreeCacheId($branch, $path), $json);
        }

        return $json;
    }

    public function getTree($branch, $path)
    {
        $tree = new Tree($branch, $path, null, $this->_repo);
        $tree->parse();
        $tree->parseLastCommit();

        return $tree;
    }

    public function getTreeOutput($branch, $path)
    {
        $tree = $this->_cache->get($this->_buildTreeCacheId($branch, $path));
        if(is_null($tree))
        {
            $tree = $this->getTree($branch, $path)->output();
            $this->_cache->set($this->_buildTreeCacheId($branch, $path), $tree);
        }

        return $tree;
    }

    public function getBreadcrumbs($path)
    {
        if(empty($path))
        {
            return [];
        }
        $pathes = explode('/', $path);
        $result = [];
        array_walk($pathes, function($path, $i) use($pathes, &$result)
        {
            $tmp = array_slice($pathes, 0, $i + 1);
            $result[] = [
                'name'  =>  $path,
                'path'  =>  implode('/', $tmp)
            ];
        });
        return $result;
    }

    public function getDiff($baseBranch, $sourceBranch)
    {
        return $this->_repo->getDiff($baseBranch, $sourceBranch);
    }

    private function _buildCommitCacheId($branch, $path)
    {
        return 'commits.' . $this->_account->identifier . '/' . $this->_project->identifier . '/' . $branch . $path;
    }

    private function _buildRepoCacheId()
    {
        return 'repo.' . $this->_account->identifier . '/' . $this->_project->identifier;
    }

    private function _buildTreeCacheId($branch, $path)
    {
        return 'tree.' . $this->_account->identifier . '/' . $this->_project->identifier . '/' . $branch . '/' . $path;
    }
}