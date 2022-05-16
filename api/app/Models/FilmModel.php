<?php

namespace App\Models;

class FilmModel extends \Orkester\MVC\MModel
{

    public static array $map = [
        'table' => 'film',
        'attributes' => [
            'idFilm' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'releaseDate' => ['type' => 'datetime'],
            'producer' => ['type' => 'string'],
            'episodeId' => ['type' => 'string'],
            'director' => ['type' => 'string'],
            'openingCrawl' => ['type' => 'string'],
            'createdAt' => ['type' => 'datetime'],
            'updatedAt' => ['type' => 'datetime']
        ],
        'associations' => [
            'characters' => ['model' => CharacterModel::class, 'type' => 'associative', 'table' => 'film_character'],
            'planets' => ['model' => PlanetModel::class, 'type' => 'associative', 'table' => 'film_planet'],
            'species' => ['model' => SpecieModel::class, 'type' => 'associative', 'table' => 'film_specie'],
            'starships' => ['model' => StarshipModel::class, 'type' => 'associative', 'table' => 'film_starship'],
            'vehicles' => ['model' => VehicleModel::class, 'type' => 'associative', 'table' => 'film_vehicle'],
        ]
    ];
}
