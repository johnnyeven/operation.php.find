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

namespace Extend\Hooks;


use Foundation\Http\Response;
use Foundation\Support\Facades\Loader;
use Foundation\Support\IHookable;

class CheckTurbolink implements IHookable
{
    public function handle(array $params = null)
    {
        $turbo = Loader::library('Turbolink');
        if ($turbo->isPjax())
        {
            $response = Response::getInstance();
            if (is_a($response, 'Foundation\Http\Response'))
            {
                $content = (string)$response->getOutput();
                $body    = $turbo->extract($content);
                $response->setOutput($body);
            }
        }
    }
}