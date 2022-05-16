<?php
declare(strict_types=1);

use Orkester\Manager;
use Orkester\MVC\MGraphQLController;
use Slim\App;

return function (App $app) {

    $app->map(['GET', 'POST'], '/graphql', function ($req, $res) {
        $controller = new MGraphQLController($req, $res);
        $content = $controller->execute();
        if (array_key_exists('errors', $content)) {
            $content['errors'] = [$content['errors']];
        }
        return $controller->send($content, 200);
    });
};
