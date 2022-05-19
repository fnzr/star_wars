<?php

use App\Models\CharacterModel;
use App\Models\PlanetModel;
use App\Models\VehicleModel;

$baseDir = realpath(dirname(dirname(dirname(dirname(__FILE__)))));
print_r($baseDir);

//ini_set("error_reporting", "E_ALL & ~E_NOTICE & ~E_STRICT");
ini_set("display_errors", "1");
ini_set("log_errors", "1");
ini_set("error_log", "php_error.log");
//ini_set("session.save_path", "{$baseDir}/var/sessions");

require $baseDir . '/vendor/autoload.php';
set_error_handler('errorHandler');

function init()
{
    Orkester\Manager::init();
    //ini_set('apc.enable_cli', 1);
}

function test()
{
    try {
        init();
        // all
        $list = CharacterModel::getCriteria()
            ->get();
        print_r($list);


        // basic where
        $list = CharacterModel::getCriteria()
            ->where('name', 'like', '%Ken%')
            ->get();

        // basic select string
        $list = CharacterModel::getCriteria()
            ->select('idCharacter, name')
            ->where('name', 'like', '%Ken%')
            ->get();

        $list = CharacterModel::getCriteria()
            ->alias('c')
            ->select('c.name')
            ->get();

        // basic select list
        $list = CharacterModel::getCriteria()
            ->select('idCharacter', 'name')
            ->where('name', 'like', '%Ken%')
            ->get();

        // basic select array
        $list = CharacterModel::getCriteria()
            ->select(['idCharacter', 'name'])
            ->where('name', 'like', '%Ken%')
            ->get();

        // distinct
        $list = CharacterModel::getCriteria()
            ->select('gender')
            ->distinct()
            ->get();

        // select + implicit inner join
        $list = CharacterModel::getCriteria()
            ->select('idCharacter,name,homeworld.name as home')
            ->where('name', 'like', '%Ken%')
            ->get();

        // select - using associative table
        $list = CharacterModel::getCriteria()
            ->select('idCharacter,name,films.director')
            ->where('name', 'like', '%Ken%')
            ->get();

        // multiple where
        $list = CharacterModel::getCriteria()
            ->where('gender', 'IN', ['male', 'female'])
            ->where('name', 'like', '%as%')
            ->get();

        // reference field on where
        $list = CharacterModel::getCriteria()
            ->select('name,home')
            ->where('name', 'like', '%as%')
            ->get();


        // field alias on where
        $list = CharacterModel::getCriteria()
            ->select('name,home')
            ->where('home', '=', 'Naboo')
            ->get();

        // collection functions
        $list = CharacterModel::getCriteria()
            ->first();

        $list = CharacterModel::getCriteria()
            ->value('home');

        $list = CharacterModel::getCriteria()
            ->find(91);

        $list = CharacterModel::getCriteria()
            ->pluck('name');

        $list = CharacterModel::getCriteria()
            ->orderBy('idCharacter')
            ->chunk(10, function ($characters) {
                print_r(count($characters) . PHP_EOL);
                //return false;
            });

        $list = CharacterModel::getCriteria()
            ->where('idCharacter', '=', 100)
            ->exists();

        // aggregate
        $list = CharacterModel::getCriteria()
            ->count();

        $list = CharacterModel::getCriteria()
            ->where('home', '=', 'Tatooine')
            ->count();

        $list = PlanetModel::getCriteria()
            ->max('diameter');

        // order
        $list = CharacterModel::getCriteria()
            ->select('name')
            ->orderBy('name')
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->orderBy('name', 'desc')
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->latest('name')
            ->first();

        // groupBy

        $list = CharacterModel::getCriteria()
            ->select('gender,count(*) as quant')
            ->groupBy('gender')
            ->get();

        // groupBy + having
        $list = CharacterModel::getCriteria()
            ->select('gender,count(*) as quant')
            ->groupBy('gender')
            ->having('count(*)', '>', 1)
            ->get();

        // groupBy + having alias
        $list = CharacterModel::getCriteria()
            ->select('gender,count(*) as quant')
            ->groupBy('gender')
            ->having('quant', '>', 1)
            ->get();

        // groupBy + association aggregate function
        $list = CharacterModel::getCriteria()
            ->select('name, count(films.idFilm) as films')
            ->groupBy('name')
            ->get();

        // expressions

        $list = CharacterModel::getCriteria()
            ->select('substr(name,1,1) as first', 'count(films.idFilm) as quant')
            ->groupBy('first')
            ->get();

        $list = CharacterModel::getCriteria()
            ->select("concat(name,'-',vehicles.films.director) as d")
            ->orderBy('d')
            ->get()
            ->toArray();

        // whereExists - subquery

        $list = CharacterModel::getCriteria()
            ->alias('c')
            ->select('c.name')
            ->whereExistsCriteria(
                VehicleModel::getCriteria()
                    ->select('idVehicle')
                    ->whereColumn('c.name', 'name')
            )
            ->get();

        // subqueries

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->where('home', 'IN',
                PlanetModel::getCriteria()
                    ->select('name')
                    ->where('climate', '=', 'temperate')
            )
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name, p.name planet')
            ->joinSubCriteria(PlanetModel::getCriteria()
                ->select('name')
                ->where('climate', '=', 'temperate'),
                'p', 'home', '=', 'p.name'
            )
            ->get();

        // union

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->where('name', 'like', 'C%')
            ->orWhere('name', 'like', 'D%')
            ->union(CharacterModel::getCriteria()
                ->select('name')
                ->where('name', 'like', 'C%')
            )
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->where('name', 'like', 'C%')
            ->orWhere('name', 'like', 'D%')
            ->unionAll(CharacterModel::getCriteria()
                ->select('name')
                ->where('name', 'like', 'C%')
            )
            ->get();

        // where

        $list = CharacterModel::getCriteria()
            ->select('name,films.director')
            ->whereColumn('name', 'films.director')
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name,films.director')
            ->whereIn('substr(name,1,1)', ['A', 'C'])
            ->get();

        // forced join

        $list = CharacterModel::getCriteria()
            ->joinClass(PlanetModel::class, 'p', 'idPlanet', '=', 'p.idPlanet')
            ->select('name,p.name planet')
            ->get();

        // association

        $list = CharacterModel::getAssociation('films.*', 91);

        // binding

        $criteria = CharacterModel::getCriteria()
            ->select('name')
            ->where('idCharacter', '=', ':id');

        for ($i = 91; $i < 100; $i++) {
            $list = $criteria->parameters(['id' => $i])
                ->get()
                ->toArray();
        }

        // when

        $condition = false;
        $criteria = CharacterModel::getCriteria()
            ->select('name')
            ->when($condition, function ($criteria, $condition) {
                $criteria->where('name', 'like', 'A%');
            }, function ($criteria, $condition) {
                $criteria->where('name', 'like', 'B%');
            });
        $list = $criteria->get();

        print_r($list);

        // save - delete

        $character = CharacterModel::find(91);
        $character->skinColor = 'black';
        print_r($character);
        CharacterModel::save($character);
        $character = CharacterModel::find(91);
        print_r($character);
        $object = (object)[
            'idCharacter' => 91,
            'skinColor' => 'pale'
        ];
        CharacterModel::save($object);
        $character = CharacterModel::find(91);
        print_r($character);
        $object = (object)[
            'name' => 'new character',
            'skinColor' => 'pale'
        ];
        $id = CharacterModel::save($object);
        print_r(PHP_EOL . $id . PHP_EOL);
        CharacterModel::delete($id);

        // insert

        $object = (object)[
            'name' => 'new character',
            'skinColor' => 'pale',
            'corporalMass' => 100
        ];
        $id = CharacterModel::insert($object);
        CharacterModel::delete($id);

        $insertData = [
            ['name' => 'new character', 'skinColor' => 'pale'],
            ['name' => 'new character', 'skinColor' => 'pale'],
            ['name' => 'new character', 'skinColor' => 'pale'],
            ['name' => 'new character', 'skinColor' => 'pale'],
        ];

        CharacterModel::insert($insertData);

        CharacterModel::insertUsingCriteria(['name', 'skinColor'],
            CharacterModel::getCriteria()
                ->select("concat('new', name), skinColor")
                ->where('name', 'like', '%os%')
        );

        // update

        $object = (object)[
            'idCharacter' => 91,
            'name' => 'The new Bib Fortuna', // Bib Fortuna
            'skinColor' => 'green',
            'corporalMass' => 200
        ];
        // a pk deve estar no objeto
        CharacterModel::update($object);

        $object = (object)[
            'name' => 'Bib Fortuna',
            'skinColor' => 'pale'
        ];
        CharacterModel::updateCriteria()
            ->where('idCharacter', '=', 91)
            ->update($object);

        CharacterModel::updateCriteria()
            ->where('idCharacter', '=', 91)
            ->increment('height', 5);

        CharacterModel::updateCriteria()
            ->where('idCharacter', '=', 91)
            ->decrement('height', 5);

        // delete

        // CharacterModel::delete($id);

        $object = (object)[
            'name' => 'new character',
        ];
        CharacterModel::insert($object);
        CharacterModel::insert($object);

        CharacterModel::deleteCriteria()
            ->where('name', '=', 'new character')
            ->delete();

        // transactions

        Orkester\Manager::addDatabase('default');
        $conn = Orkester\Manager::getDatabase()->connection('default');

        $conn->transaction(function () {
            $object = (object)[
                'name' => 'new character',
            ];
            CharacterModel::insert($object);
            CharacterModel::insert($object);

            CharacterModel::deleteCriteria()
                ->where('name', '=', 'new character')
                ->delete();
        });

        $conn->beginTransaction();
        try {
            $object = (object)[
                'name' => 'new character',
            ];
            CharacterModel::insert($object);
            CharacterModel::insert($object);

            CharacterModel::deleteCriteria()
                ->where('name', '=', 'new character')
                ->delete();
            $conn->commit();
        } catch (\Exception $e) {
            $conn->rollback();
        }


    } catch (Exception $e) {
        print_r($e->getMessage());
    }

}


init();
test();
