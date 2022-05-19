<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class CharacterModel extends \Orkester\Persistence\Model
{

    public static array $map = [
        'table' => '`character`',
        'attributes' => [
            'idCharacter' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'name' => ['type' => 'string'],
            'gender' => ['type' => 'string'],
            'skinColor' => ['type' => 'string'],
            'hairColor' => ['type' => 'string'],
            'height' => ['type' => 'int'],
            'eyeColor' => ['type' => 'string'],
            'mass' => ['type' => 'int'],
            'birthYear' => ['type' => 'string'],
            'createdAt' => ['type' => 'datetime'],
            'updatedAt' => ['type' => 'datetime']
        ],
        'associations' => [
            'homeworld' => ['model' => PlanetModel::class, 'type' => 'one', 'key' => 'idPlanet'],
            'species' => ['model' => SpecieModel::class, 'type' => 'associative', 'table' => 'character_specie'],
            'starships' => ['model' => StarshipModel::class, 'type' => 'associative', 'table' => 'character_starship'],
            'vehicles' => ['model' => VehicleModel::class, 'type' => 'associative', 'table' => 'character_vehicle'],
            'films' => ['model' => FilmModel::class, 'type' => 'associative', 'table' => 'film_character'],
        ]
    ];

    public static function map(): void
    {
        parent::map();
        self::table('character');
        self::attribute('idCharacter', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('name');
        self::attribute('gender');
        self::attribute('skinColor');
        self::attribute('hairColor');
        self::attribute('height', type: Type::INTEGER);
        self::attribute('eyeColor');
        self::attribute('mass', type: Type::INTEGER);
        self::attribute('corporalMass',field:'mass', type: Type::INTEGER);
        self::attribute('birthYear');
//        self::attribute('modelVehicles',reference: 'vehicles.model');
        self::attribute('home',reference: 'homeworld.name');
        self::attribute('createdAt', type: Type::DATETIME);
        self::attribute('updatedAt', type: Type::DATETIME);
        self::associationOne('homeworld', model: PlanetModel::class);
        self::associationMany('species', model: SpecieModel::class, associativeTable: 'character_specie');
        self::associationMany('starships', model: StarshipModel::class, associativeTable: 'character_startship');
        self::associationMany('vehicles', model: VehicleModel::class, associativeTable: 'character_vehicle');
        self::associationMany('films', model: FilmModel::class, associativeTable: 'film_character');
    }
}
