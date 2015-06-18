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

namespace find\tests;

use Foundation\UnitTest\OperationUnitTestCase;

class UserControllerTest extends OperationUnitTestCase
{
    public function testLogin()
    {
        $this->setMethod('get');
        $this->setRequestURI('login');
        $this->setPostParameter([
            'username'  =>  'johnny',
            'password'  =>  '100200'
        ]);
        $result = $this->startApplication();
        $this->assertArrayHasKey('code', $result);
        $this->assertEquals(0, $result['code']);
        $this->assertArrayHasKey('data', $result);
        $this->assertArrayHasKey('id', $result['data']);
    }
}
