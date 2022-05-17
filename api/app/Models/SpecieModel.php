<?php

namespace App\Models;

use Orkester\Persistence\Enum\Key;
use Orkester\Persistence\Enum\Type;

class SpecieModel extends \Orkester\Persistence\Model
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

    public static function map(): void
    {
        parent::map();
        self::table('specie');
        self::attribute('idSpecie', key: Key::PRIMARY);
        self::attribute('objectId');
        self::attribute('eyeColors');
        self::attribute('skinColors');
        self::attribute('hairColors');
        self::attribute('classification');
        self::attribute('name');
        self::attribute('designation');
        self::attribute('language');
        self::attribute('averageLifespan', type: Type::INTEGER);
        self::attribute('averageHeight', type: Type::INTEGER);
        self::attribute('createdAt', type: Type::DATETIME);
        self::attribute('updatedAt', type: Type::DATETIME);
    }

}
