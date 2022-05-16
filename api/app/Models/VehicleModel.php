<?php

namespace App\Models;

class VehicleModel extends \Orkester\MVC\MModel
{

    public static array $map = [
        'table' => 'vehicle',
        'attributes' => [
            'idVehicle' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'name' => ['type' => 'string'],
            'cargoCapacity' => ['type' => 'int'],
            'maxAtmospheringSpeed' => ['type' => 'int'],
            'crew' => ['type' => 'int'],
            'length' => ['type' => 'int'],
            'model' => ['type' => 'string'],
            'manufacturer' => ['type' => 'string'],
            'vehicleClass' => ['type' => 'string'],
        ],
        'associations' => [
            'pilots' => ['model' => CharacterModel::class, 'type' => 'associative', 'table' => 'character_vehicle'],
            'films' => ['model' => FilmModel::class, 'type' => 'associative', 'table' => 'film_vehicle'],
        ]
    ];
}
