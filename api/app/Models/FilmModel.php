<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class FilmModel extends \Orkester\Persistence\Model
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

    public static function map(): void
    {
        parent::map();
        self::table('film');
        self::attribute('idFilm', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('releaseDate', type: Type::DATETIME);
        self::attribute('title');
        self::attribute('producer');
        self::attribute('episodeId');
        self::attribute('director');
        self::attribute('openingCrawl');
        self::attribute('createdAt', type: Type::DATETIME);
        self::attribute('updatedAt', type: Type::DATETIME);
        self::associationMany('characters', model: CharacterModel::class, associativeTable: 'film_character');
        self::associationMany('planets', model: PlanetModel::class, associativeTable: 'film_planet');
        self::associationMany('species', model: SpecieModel::class, associativeTable: 'film_specie');
        self::associationMany('starships', model: StarshipModel::class, associativeTable: 'film_starship');
        self::associationMany('vehicle', model: VehicleModel::class, associativeTable: 'film_vehicle');
    }


}
