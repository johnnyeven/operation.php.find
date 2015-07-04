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

namespace Proxy;


use Foundation\Proxy;
use Foundation\Support\Facades\Input;
use Foundation\Support\Facades\Loader;
use Models\Account;
use Models\Key;

class FindProxy extends Proxy
{
    /**
     * @var \Foundation\Library\Connection\Drivers\HttpDriver
     */
    private $_c;

    function __construct()
    {
        parent::__construct();

        $connection = Loader::library('Connection/Connection');
        $this->_c = $connection->loadRemote('find');
    }

    public function getUserByKey($keyId)
    {
        $key = Key::findOne([
            'id'    =>  $keyId
        ]);
        if(!empty($key))
        {
            $account = Account::findOne([
                'uid'   =>  $key->uid
            ]);
            if(!empty($account))
            {
                return [
                    'key'   =>  $key,
                    'name'  =>  $account->identifier
                ];
            }
        }
        return null;
    }

    public function checkAccess($command, $repo, $key)
    {
        $result = $this->_c->callUrl('api/v3/check_access',
            [
                'command'   =>  $command,
                'repo'      =>  $repo,
                'key_id'    =>  $key
            ]
        );
        if($result['code'] == '0')
        {
            return $result['data'];
        }
        return false;
    }
}