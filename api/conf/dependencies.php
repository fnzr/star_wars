<?php

use DI\ContainerBuilder;

return function (ContainerBuilder $containerBuilder) {
    $containerBuilder->addDefinitions([
        "graphql_models" => [
            "characters" => \App\Models\CharacterModel::class
        ]
    ]);
};
