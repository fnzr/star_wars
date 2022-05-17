<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class StarshipModel extends \Orkester\Persistence\Model
{

    public static array $map = [
        'table' => 'starship',
        'attributes' => [
            'idStarship' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'consumables' => ['type' => 'int'],
            'name' => ['type' => 'text'],
            'cargoCapacity' => ['type' => 'int'],
            'passengers' => ['type' => 'int'],
            'maxAtmospheringSpeed' => ['type' => 'int'],
            'crew' => ['type' => 'int'],
            'length' => ['type' => 'int'],
            'model' => ['type' => 'string'],
            'costInCredits' => ['type' => 'int'],
            'manufacturer' => ['type' => 'string'],
            'MGLT' => ['type' => 'int'],
            'starshipClass' => ['type' => 'string'],
            'hyperdriveRating' => ['type' => 'string'],
            'createdAt' => ['type' => 'datetime'],
            'updatedAt' => ['type' => 'datetime'],
        ],
        'associations' => [
            'pilots' => ['model' => CharacterModel::class, 'type' => 'associative', 'table' => 'character_starship'],
            'films' => ['model' => FilmModel::class, 'type' => 'associative', 'table' => 'film_starship'],

        ]
    ];

    public static function map(): void
    {
        parent::map();
        self::table('starship');
        self::attribute('idStarship', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('consumables', type: Type::INTEGER);
        self::attribute('name');
        self::attribute('cargoCapacity', type: Type::INTEGER);
        self::attribute('passengers', type: Type::INTEGER);
        self::attribute('maxAtmospheringSpeed', type: Type::INTEGER);
        self::attribute('crew', type: Type::INTEGER);
        self::attribute('length', type: Type::INTEGER);
        self::attribute('model');
        self::attribute('costInCredits', type: Type::INTEGER);
        self::attribute('manufacturer', type: Type::INTEGER);
        self::attribute('MGLT', type: Type::INTEGER);
        self::attribute('starshipClass');
        self::attribute('surfaceWater');
        self::attribute('hyperdriveRating');
        self::attribute('createdAt', type: Type::DATETIME);
        self::attribute('updatedAt', type: Type::DATETIME);
        self::associationMany('pilots', model: CharacterModel::class, associativeTable: 'character_starship');
        self::associationMany('films', model: FilmModel::class, associativeTable: 'film_starship');

    }

}
