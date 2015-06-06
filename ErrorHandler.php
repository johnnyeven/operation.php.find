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
        header('Content-type: application/json');
        echo json_encode(array(
            'code'  =>  $this->error->getCode(),
            'message'   =>  $this->error->getMessage()
        ));
    }
}