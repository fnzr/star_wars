<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class VehicleModel extends \Orkester\Persistence\Model
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

    public static function map(): void
    {
        parent::map();
        self::table('vehicle');
        self::attribute('idVehicle', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('name');
        self::attribute('cargoCapacity', type: Type::INTEGER);
        self::attribute('maxAtmospheringSpeed', type: Type::INTEGER);
        self::attribute('crew', type: Type::INTEGER);
        self::attribute('length', type: Type::INTEGER);
        self::attribute('model');
        self::attribute('manufacturer');
        self::attribute('vehicleClass');
        self::associationMany('pilots', model: CharacterModel::class, associativeTable: 'character_vehicle');
        self::associationMany('films', model: FilmModel::class, associativeTable: 'film_vehicle');
    }

}
