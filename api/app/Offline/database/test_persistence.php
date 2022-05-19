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
            ->where('name','like','C%')
            ->orWhere('name','like','D%')
            ->union(CharacterModel::getCriteria()
                    ->select('name')
                    ->where('name','like', 'C%')
            )
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name')
            ->where('name','like','C%')
            ->orWhere('name','like','D%')
            ->unionAll(CharacterModel::getCriteria()
                ->select('name')
                ->where('name','like', 'C%')
            )
            ->get();

        // where

        $list = CharacterModel::getCriteria()
            ->select('name,films.director')
            ->whereColumn('name','films.director')
            ->get();

        $list = CharacterModel::getCriteria()
            ->select('name,films.director')
            ->whereIn('substr(name,1,1)',['A','C'])
            ->get();

        // forced join

        $list = CharacterModel::getCriteria()
            ->joinClass(PlanetModel::class,'p','idPlanet','=','p.idPlanet')
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
            ->when($condition, function($criteria, $condition) {
                $criteria->where('name', 'like', 'A%');
            }, function ($criteria, $condition) {
                $criteria->where('name', 'like', 'B%');
            });
        $list = $criteria->get();

        print_r($list);


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
        print_r(PHP_EOL. $id . PHP_EOL);
        CharacterModel::delete($id);




        /*
                $frame = FrameModel::getById(1);
                $frame->active = 0;
                FrameModel::save($frame);
                $frame = FrameModel::getById(1);

                $object = (object)[
                    'idEntity' => null,
                    'type' => 'FR',
                    'alias' => 'fr_para_teste5',
                    'timeline' => ''
                ];
                EntityModel::save($object);

                EntityModel::delete($object->idEntity);
        */
        /*
        $list = FrameModel::getCriteria()
            ->asResult();

        $list = FrameModel::getCriteria()
            ->where('name', '=', 'Causation')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->where('name', 'like', 'Causat%')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->where('name', 'in', ['Causation', 'Process'])
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('entries.name,entries.idLanguage')
            ->where('name', 'in', ['Causation', 'Process'])
            ->asResult();

        $list = FrameModel::getCriteria()
            ->select('name,entries.name,entries.language.language')
            ->where('name', 'in', ['Causation', 'Process'])
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('idFrame,entry, entries.name, entries.language.language as lang')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->where('lang', '=', 'pt')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('idFrame,entry, lus.name, lus.lemma.name as lemmaName, lus.lemma.pos.POS as lemmaPos')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->where('lemmaPos', '=', 'N')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('name, relations.relationType, relations.entity2Type')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->asResult();

        $list = FrameModel::getCriteria()
            ->select('name, relations.relationType, relations.entity2Type, relations.entity2.frame.name')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->asResult();

        $list = FrameModel::getCriteria()
            ->associationAlias('relations.entity2.frame', 'f2')
            ->select('name, relations.relationType, relations.entity2Type, f2.entry')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->asResult();

        $list = FrameModel::getCriteria()
            ->associationAlias('relations.entity2.frame', 'f2')
            ->select('name, relations.relationType, relations.entity2Type, f2.name')
            ->where('entry', 'IN', ['frm_causation', 'frm_event'])
            ->asResult();


        $list = FrameModel::getCriteria()
            ->select('name, count(lus.idLU) as quant')
            ->groupBy('name')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('name, count(lus.idLU) as quant')
            ->groupBy('name')
            ->having('quant', '>', 50)
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select('substr(name,1,1) as first', 'count(lus.idLU)')
            ->groupBy('first')
            ->asResult();
        $list = FrameModel::getCriteria()
            ->select("concat(name,'-',entrylanguage.language.language)")
            ->asResult();


        $subcriteria = LUModel::getCriteria()
            ->select('idFrame')
            ->where('name', 'LIKE', 'ab%')
            ->asResult();

        $subcriteria = LUModel::getCriteria()
            ->alias('L')
            ->select('idFrame')
            ->where('name', 'LIKE', 'ab%');

        $list = FrameModel::getCriteria()
            ->select('L.idFrame')
            ->distinct(true)
            ->from($subcriteria)
            ->asResult();

        $list = FrameModel::getCriteria()
            ->select('idFrame')
            ->where('idFrame', 'IN', $subcriteria)
            ->asResult();


        $forced = LUModel::getCriteria()
            ->select('lu.idFrame, lu.name, lm.name as lemmaName')
            ->join(LUModel::class . ' lu', LemmaModel::class . ' lm', "lu.idLemma = lm.idLemma", "INNER")
            ->asResult();

        $list = FrameModel::getCriteria()
            ->range(3, 40)
            ->asResult();

        $list = FrameModel::getCriteria()
            ->select('name')
            ->where('name', 'like', 'A%')
            ->union(
                LUModel::getCriteria()
                    ->select('name')
                    ->where('name', 'like', 'a%')
            )->asResult();


        $e = EntityModel::getById(1);

        $e1 = FrameModel::getAssociationOne('entity', 1);

        $list = FrameModel::getCriteria()
            ->select('entity.*')
            ->where('idFrame', '=', 1)
            ->asResult();

        $e2 = FrameModel::getAssociation('entries', 1);

        $e3 = FrameModel::getAssociation('entries.language', 1);

        $e4 = FrameModel::getAssociation('entrylanguage', 1);

        $e5 = FrameModel::getAssociation('lus', 1);

        $criteria = FrameModel::getCriteria()
            ->select('entity.*')
            ->where('idFrame', '=', ':id');

        for ($i = 1; $i < 10; $i++) {
            $list = $criteria->parameters(['id' => $i])->asResult();
        }

        $preparedStatement = FrameModel::getCriteria()
            ->select('name, entry')
            ->where('idFrame', '=', ':id')
            ->prepare();

        for ($i = 1; $i < 10; $i++) {
            $list = $preparedStatement->parameters(['id' => $i])->asResult();
        }

        $frame = FrameModel::getById(1);
        $frame->active = 1;
        FrameModel::save($frame);
        $frame = FrameModel::getById(1);
        $frame->active = 0;
        FrameModel::save($frame);
        $frame = FrameModel::getById(1);

        $object = (object)[
            'idEntity' => null,
            'type' => 'FR',
            'alias' => 'fr_para_teste5',
            'timeline' => ''
        ];
        EntityModel::save($object);

        EntityModel::delete($object->idEntity);

        $transaction = EntityModel::beginTransaction();
        try {
            $rows = [
                ['alias' => 'fr_para_teste_1', 'type' => 'FR'],
                ['alias' => 'fr_para_teste_2', 'type' => 'FR'],
                ['alias' => 'fr_para_teste_3', 'type' => 'FR'],
                ['alias' => 'fr_para_teste_4', 'type' => 'FR'],
                ['alias' => 'fr_para_teste_5', 'type' => 'FR'],
                ['alias' => 'fr_para_teste_6', 'type' => 'FR'],
            ];

            EntityModel::getInsertCriteria()
                ->rows($rows)
                ->execute();

            EntityModel::getUpdateCriteria()
                ->update(['type' => 'DO', 'timeline' => 'new'])
                ->where('alias', 'like', 'fr_para%')
                ->execute();

            EntityModel::getDeleteCriteria()
                ->where('alias', 'like', 'fr_para_test%')
                ->execute();
            $transaction->commit();
            print_r("done");
        } catch (EPersistenceException $e) {
            $transaction->rollback();
        }

        $list = UserModel::getCriteria()
            ->asResult();
        $list = GroupModel::getCriteria()
            ->asResult();
        $list = GroupModel::getCriteria()
            ->select('users.login')
            ->asResult();


        $criteria = LUQualiaModel::getCriteria()
            ->select('idLURelated')
            ->where('idLUBase', '=', ':idLUBase');
        $criteria1 = LUQualiaModel::getCriteria()
            ->select('idLURelated')
            ->where('idLUBase', '=', ':idLUBase');
        $criteria2 = LUQualiaModel::getCriteria()
            ->select('idLURelated')
            ->where('idLUBase', 'IN', $criteria1);
        $criteria3 = LUQualiaModel::getCriteria()
            ->select('idLURelated')
            ->where('idLUBase', 'IN', $criteria2);
        $union = $criteria
            ->union($criteria2)
            ->union($criteria3);
        $statement = LUQualiaModel::getCriteria()
            ->select('idLURelated')
            ->from($union)
            //->union($criteria2)
            //->union($criteria3)
            ->where('idLURelated', '=', ':idLURelated')
            ->prepare();
        $luqualia = $statement
            ->parameters(['idLUBase' => 16251, 'idLURelated' => 41377])
            ->asResult();

        print_r($luqualia);


        $list = Manager::getDatabase('fnbr')
            ->executeQuery('select * from Frame');
        print_r($list);


        $data = (object)[
            'json' => (object)[
                'a' => 1,
                'b' => 'teste'
            ]
        ];
        $cm = \App\Models\old\ZModel::getClassMap();
        $cm->setDatabaseName('dummy');
        //$z = \App\Models\ZModel::save($data, $cm);
        $data = (object)[];
        $z = \App\Models\old\ZModel::save($data, $cm);
        $x = ZModel::getCriteria()
            ->select('*')
            ->asResult();
        print_r($x);
        $y = ZModel::getById(671);
        print_r($y);
        */


    } catch (Exception $e) {
        print_r($e->getMessage());
    }

}


init();
test();
