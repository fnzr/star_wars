<?php

namespace App\Models;

class PlanetModel extends \Orkester\MVC\MModel
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
}
