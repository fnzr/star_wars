<?php

namespace App\Models;

class StarshipModel extends \Orkester\MVC\MModel
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
}
