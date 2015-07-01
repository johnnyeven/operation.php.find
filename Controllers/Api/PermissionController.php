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

namespace Controllers\Api;

use Foundation\Controller;
use Foundation\Support\ErrorManager;
use Foundation\Support\Facades\Exception;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Foundation\Support\Facades\Response;
use Models\Key;
use Models\Project;

if(!defined('OPERATIONPHP')) ErrorManager::getInstance()->throwException(10001);

class PermissionController extends Controller
{
    /**
     * @var \Foundation\Library\Validation
     */
    private $validation;

    function __construct()
    {
        parent::__construct();

        $this->validation = Loader::library('Validation');
        $this->validation->load('Api');

        if(!$this->validation->run())
        {
            $errors = $this->validation->error();
            foreach($errors as $key => $value) {
                if(!empty($value)) {
                    ErrorManager::throwCustomException(500, $value);
                }
            }
        }
    }

    public function checkAccess()
    {
        Loader::helper('Repo');

        $command = Input::request('command');
        $keyId = Input::request('key_id');
        $repo = fetchRepoIdentifier(Input::request('repo'));

        $result = false;
        if(!empty($repo))
        {
            $key = Key::findOne([
                'id'    =>  $keyId
            ]);
            $project = Project::findOne([
                'identifier'    =>  $repo
            ]);
            if(empty($key))
            {
                Exception::throwException(20001);
            }
            if(empty($project))
            {
                Exception::throwException(20002);
            }
            if($key->uid == $project->uid)
            {
                $result = true;
            }

            Response::json([
                'code'  =>  0,
                'data'  =>  $result
            ]);
        }
    }
}