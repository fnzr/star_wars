<?php
declare(strict_types=1);

use Orkester\Middleware\DataMiddleware;
use Slim\App;

return function (App $app) {
    $app->add(DataMiddleware::class);
};
