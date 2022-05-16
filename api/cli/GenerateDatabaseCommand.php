<?php

namespace CLI;

use Orkester\Manager;
use Orkester\MVC\MModel;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

require_once __DIR__ . '/GenerateDatabase.php';

class GenerateDatabaseCommand extends \Symfony\Component\Console\Command\Command
{
    protected static $defaultName = 'generate_database';

    public function execute(InputInterface $input, OutputInterface $output)
    {
//        $transaction = MModel::beginTransaction();
//        insert_films();
//        insert_planets();
//        insert_species();
//        insert_starships();
//        insert_vehicles();
//        insert_characters();

//        insert_film_character();
//        insert_film_planet();
//        insert_film_specie();
//        insert_film_starship();
//        insert_film_vehicle();
//        insert_character_specie();
//        insert_character_starship();
//        insert_character_vehicle();
//        insert_character_planet();
//        insert_planet_specie();
//        $transaction->commit();
        return Command::SUCCESS;
    }
}
