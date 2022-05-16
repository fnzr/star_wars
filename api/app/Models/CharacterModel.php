<?php

namespace App\Models;

class CharacterModel extends \Orkester\MVC\MModel
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
}
