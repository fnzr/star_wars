<?php

namespace App\Models;

class SpecieModel extends \Orkester\MVC\MModel
{

    public static array $map = [
        'table' => 'specie',
        'attributes' => [
            'idSpecie' => ['key' => 'primary'],
            'objectId' => ['type' => 'string'],
            'eyeColors' => ['type' => 'string'],
            'skinColors' => ['type' => 'string'],
            'hairColors' => ['type' => 'string'],
            'classification' => ['type' => 'string'],
            'name' => ['type' => 'string'],
            'designation' => ['type' => 'string'],
            'language' => ['type' => 'string'],
            'averageLifespan' => ['type' => 'int'],
            'averageHeight' => ['type' => 'int'],
            'createdAt' => ['type' => 'datetime'],
            'updatedAt' => ['type' => 'datetime'],
        ]
    ];
}
