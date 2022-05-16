<?php

function insert_films()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/Film.json"), true);
    foreach ($contents['results'] as $content) {
        $content['releaseDate'] = \Carbon\Carbon::parse($content['releaseDate']['iso']);
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        \App\Models\FilmModel::save((object)$content);
    }
}

function insert_characters()
{
    $contents = json_decode(file_get_contents("/db/e162f09e9d1e1b664c18a7d52b0e32d1_Character/Character.json"), true);
    foreach ($contents['results'] as $content) {
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['idPlanet'] = \App\Models\PlanetModel::one(['objectId', '=', $content['homeworld']['objectId']])->idPlanet;
        \App\Models\CharacterModel::save((object)$content);
    }
}

function insert_starships()
{
    $contents = json_decode(file_get_contents("/db/f12f1404582802654e8f343e9b4b4526_Starship/Starship.json"), true);
    foreach ($contents['results'] as $content) {
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        \App\Models\StarshipModel::save((object)$content);
    }
}

function insert_species()
{
    $contents = json_decode(file_get_contents("/db/b1b82719642b4f230d76452112264869_Specie/Specie.json"), true);
    foreach ($contents['results'] as $content) {
        $content['eyeColors'] = implode(',', $content['eyeColors'] ?? []);
        $content['skinColors'] = implode(',', $content['skinColors'] ?? []);
        $content['hairColors'] = implode(',', $content['hairColors'] ?? []);
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        \App\Models\SpecieModel::save((object)$content);
    }
}

function insert_vehicles()
{
    $contents = json_decode(file_get_contents("/db/bdd422c39c364376bce2b3abb0ff0e5a_Vehicle/Vehicle.json"), true);
    foreach ($contents['results'] as $content) {
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        \App\Models\VehicleModel::save((object)$content);
    }
}

function insert_planets()
{
    $contents = json_decode(file_get_contents("/db/c484355ddb2be54f4e47b5ff2476b9ae_Planet/Planet.json"), true);
    foreach ($contents['results'] as $content) {
        $content['climate'] = implode(',', $content['climate'] ?? []);
        $content['terrain'] = implode(',', $content['terrain'] ?? []);
        $content['updatedAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        $content['createdAt'] = \Carbon\Carbon::parse($content['updatedAt']);
        \App\Models\PlanetModel::save((object)$content);
    }
}

function insert_film_character()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/_Join꞉characters꞉Film.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\FilmModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\FilmModel::getKeyAttributeName();
        $e2 = \App\Models\CharacterModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\CharacterModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\FilmModel::addManyToMany($e1->$pk1, $e2->$pk2, 'characters');
        }
    }
}

function insert_film_planet()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/_Join꞉planets꞉Film.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\FilmModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\FilmModel::getKeyAttributeName();
        $e2 = \App\Models\PlanetModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\PlanetModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\FilmModel::addManyToMany($e1->$pk1, $e2->$pk2, 'planets');
        }
    }
}

function insert_film_specie()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/_Join꞉species꞉Film.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\FilmModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\FilmModel::getKeyAttributeName();
        $e2 = \App\Models\SpecieModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\SpecieModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\FilmModel::addManyToMany($e1->$pk1, $e2->$pk2, 'species');
        }
    }
}

function insert_film_starship()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/_Join꞉starships꞉Film.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\FilmModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\FilmModel::getKeyAttributeName();
        $e2 = \App\Models\StarshipModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\StarshipModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\FilmModel::addManyToMany($e1->$pk1, $e2->$pk2, 'starships');
        }
    }
}

function insert_film_vehicle()
{
    $contents = json_decode(file_get_contents("/db/60ff89cb4eed7b7faca057885d5ac111_Film/_Join꞉vehicles꞉Film.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\FilmModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\FilmModel::getKeyAttributeName();
        $e2 = \App\Models\VehicleModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\VehicleModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\FilmModel::addManyToMany($e1->$pk1, $e2->$pk2, 'vehicles');
        }
    }
}

function insert_character_specie()
{
    $contents = json_decode(file_get_contents("/db/e162f09e9d1e1b664c18a7d52b0e32d1_Character/_Join꞉species꞉Character.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\CharacterModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\CharacterModel::getKeyAttributeName();
        $e2 = \App\Models\SpecieModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\SpecieModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\CharacterModel::addManyToMany($e1->$pk1, $e2->$pk2, 'species');
        }
    }
}

function insert_character_starship()
{
    $contents = json_decode(file_get_contents("/db/e162f09e9d1e1b664c18a7d52b0e32d1_Character/_Join꞉starships꞉Character.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\CharacterModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\CharacterModel::getKeyAttributeName();
        $e2 = \App\Models\StarshipModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\StarshipModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\CharacterModel::addManyToMany($e1->$pk1, $e2->$pk2, 'starships');
        }
    }
}

function insert_character_vehicle()
{
    $contents = json_decode(file_get_contents("/db/e162f09e9d1e1b664c18a7d52b0e32d1_Character/_Join꞉vehicles꞉Character.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\CharacterModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\CharacterModel::getKeyAttributeName();
        $e2 = \App\Models\VehicleModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\VehicleModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\CharacterModel::addManyToMany($e1->$pk1, $e2->$pk2, 'vehicles');
        }
    }
}

function insert_character_planet()
{
    $contents = json_decode(file_get_contents("/db/c484355ddb2be54f4e47b5ff2476b9ae_Planet/_Join꞉films꞉Planet.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\PlanetModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\PlanetModel::getKeyAttributeName();
        $e2 = \App\Models\CharacterModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\CharacterModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\PlanetModel::addManyToMany($e1->$pk1, $e2->$pk2, 'residents');
        }
    }
}

function insert_planet_specie()
{
    $contents = json_decode(file_get_contents("/db/c484355ddb2be54f4e47b5ff2476b9ae_Planet/_Join꞉species꞉Planet.json"), true);
    foreach ($contents['results'] as $content) {

        $e1 = \App\Models\PlanetModel::one(['objectId', '=', $content['owningId']]);
        $pk1 = \App\Models\PlanetModel::getKeyAttributeName();
        $e2 = \App\Models\SpecieModel::one(['objectId', '=', $content['relatedId']]);
        $pk2 = \App\Models\SpecieModel::getKeyAttributeName();
        if ($e1 && $e2) {
            \App\Models\PlanetModel::addManyToMany($e1->$pk1, $e2->$pk2, 'species');
        }
    }
}
