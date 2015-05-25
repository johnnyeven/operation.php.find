<?php
/**
 * Created by PhpStorm.
 * User: johnnyeven
 * Date: 2015/4/10
 * Time: 23:55
 */

class ErrorHandler {
    /**
     * @var Exception
     */
    private $error;

    function __construct(Exception $e) {
        $this->error = $e;
    }

    public function proceed() {
        echo $this->error->getMessage();
    }
}