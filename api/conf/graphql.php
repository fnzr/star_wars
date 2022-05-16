<?php

return array(
    'models' => array(
        'characters' => \App\Models\CharacterModel::class,
        'planets' => \App\Models\PlanetModel::class,
        'vehicles' => \App\Models\VehicleModel::class
    ),
    'singular' => [
        'character' => 'characters',
        'planet' => 'planets'
    ],
    'services' => [],
    'serviceResolver' => function ($name) {
        if (preg_match('/([A-Za-z0-9]+)_([A-Za-z0-9]+)/', $name, $matches)) {
            $serviceClass = "App\Services\\$matches[1]Service";
            $service = \Orkester\Manager::getContainer()->get($serviceClass);
            if (method_exists($service, $matches[2])) {
                return fn(...$args) => $service->{$matches[2]}(...$args);
            }
        }
        return null;
    }
);
