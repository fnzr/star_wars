<?php

return [
    'name' => 'Star Wars',
    'options' => [
        'app' => 'star_wars',
        'debug' => true,
        'charset' => 'UTF-8',
        'timezone' => "America/Sao_Paulo",
        'mode' => 'DEV',
        'dispatch' => 'index.php',
        'tmpPath' => sys_get_temp_dir(),
        'locale' => array("pt_BR.utf8", "ptb"), // linux: check installed locales - "locale -a"
//        'fetchStyle' => \FETCH_ASSOC,
        'language' => 'en',
        'db' => 'default',
    ],
    'logs' => [
        'channel' => 'orkester',
        'path' => sys_get_temp_dir(),
        'level' => 2,
        'handler' => "socket",
        'peer' => 'host.docker.internal',
        //'strict' => '127.0.0.1',
        'port' => 9999,
        'console' => 1,
        'errorCodes' => [
            E_ERROR,
            E_WARNING,
            E_PARSE,
            E_RECOVERABLE_ERROR,
            E_USER_ERROR,
            E_COMPILE_ERROR,
            E_CORE_ERROR
        ],
    ],
    'cache' => [
        'type' => "apcu", // php, java, apc, apcu, memcache
        'path' => __DIR__ . '/../var/cache',
        'memcache' => [
            'host' => "127.0.0.1",
            'port' => "11211",
            'default.ttl' => 0
        ],
        'apc' => [
            'default.ttl' => 0
        ]
    ],

];
