<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class PlanetModel extends \Orkester\Persistence\Model
{

    public static array $map = [
        'table' => 'planet',
        'attributes' => [
            'idPlanet' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'climate' => ['type' => 'string'],
            'terrain' => ['type' => 'string'],
            'surfaceWater' => ['type' => 'string'],
            'name' => ['type' => 'string'],
            'diameter' => ['type' => 'int'],
            'rotationPeriod' => ['type' => 'int'],
            'gravity' => ['type' => 'string'],
            'orbitalPeriod' => ['type' => 'int'],
            'population' => ['type' => 'int'],
            'createdAt' => ['type' => 'datetime'],
            'updatedAt' => ['type' => 'datetime'],
        ],
        'associations' => [
            'natives' => ['model' => CharacterModel::class, 'type' => 'many', 'key' => 'idPlanet'],
            'residents' => ['model' => CharacterModel::class, 'type' => 'associative', 'table' => 'character_planet'],
            'species' => ['model' => SpecieModel::class, 'type' => 'associative', 'table' => 'planet_specie'],
        ]
    ];

    public static function map(): void
    {
        parent::map();
        self::table('planet');
        self::attribute('idPlanet', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('climate');
        self::attribute('terrain');
        self::attribute('surfaceWater');
        self::attribute('name');
        self::attribute('diameter', type: Type::INTEGER);
        self::attribute('rotationPeriod', type: Type::INTEGER);
        self::attribute('gravity');
        self::attribute('orbitalPeriod', type: Type::INTEGER);
        self::attribute('population', type: Type::INTEGER);
        self::attribute('createdAt', type: Type::DATETIME);
        self::attribute('updatedAt', type: Type::DATETIME);
        self::associationMany('natives', model: CharacterModel::class);
        self::associationMany('residents', model: CharacterModel::class, associativeTable: 'character_planet');
        self::associationMany('species', model: SpecieModel::class, associativeTable: 'planet_specie');
    }

}
