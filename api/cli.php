#!/usr/bin/php
<?php
require './vendor/autoload.php';

Orkester\Manager::init();

use Symfony\Component\Console\Application;

$application = new Application();


$application->addCommands([
//    new GenerateSchemaCommand(),
    new \CLI\GenerateDatabaseCommand()
]);

$application->run();
