<?php

class MutationTest extends \PHPUnit\Framework\TestCase
{
    protected \Orkester\Persistence\PersistenceTransaction $transaction;

    public function setUp(): void
    {
        $this->transaction = \Orkester\MVC\MModel::beginTransaction();
    }

    public function tearDown(): void
    {
        $this->transaction->rollback();
    }

    public function testInsertSingle()
    {
        $query = <<<EOT
mutation {
    char:insertCharacter(object: {objectId: "grievous" name: "General Grievous", height: 216 mass: 159 idPlanet: 685}) {
        objectId
        name
        height
        mass
        homeworld {
            name
        }
    }
}
EOT;
        $this->assertEquals([
            'objectId' => 'grievous',
            'name' => 'General Grievous',
            'height' => 216, 'mass' => 159,
            'homeworld' => ['name' => 'Kalee']
        ], \Orkester\GraphQL\Executor::run($query)['char']);
    }

    public function testUpdateSingle()
    {
        $query = <<<EOT
mutation {
    char:updateCharacter(id: 83 set: {name: "Ben Kenobi"}) {
        name
    }
}
EOT;
        $this->assertEquals([
            'name' => 'Ben Kenobi',
        ], \Orkester\GraphQL\Executor::run($query)['char']);
    }

    public function testUpsertSingleUpdate()
    {
        $query = <<<EOT
mutation {
    char:upsertCharacter(object: {idCharacter: 83 name: "Ben Kenobi"}) {
        idCharacter
        name
    }
}
EOT;
        $this->assertEquals([
            'idCharacter' => 83,
            'name' => 'Ben Kenobi',
        ], \Orkester\GraphQL\Executor::run($query)['char']);
    }

    public function testUpsertSingleInsert()
    {
        $query = <<<EOT
mutation {
    char:upsertCharacter(object: {name: "General Grievous" idPlanet: 685}) {
        name
    }
}
EOT;
        $this->assertEquals([
            'name' => 'General Grievous',
        ], \Orkester\GraphQL\Executor::run($query)['char']);
    }

    public function testDeleteSingle()
    {
        $query = <<<EOT
mutation { deletePlanet(id: 687) }
EOT;
        $this->assertEmpty(\Orkester\GraphQL\Executor::run($query));
    }

    public function testService()
    {
        $query = <<<EOT
mutation { service:serviceSample_Echo(a: 1 b: "abc") }
EOT;
        $this->assertEquals([
            'a' => 1,
            'b' => 'abc'
        ], \Orkester\GraphQL\Executor::run($query)['service']);
    }


//    public function testInsertSingleAssociationSubQuery()
//    {
//        $query = <<<EOT
//query {
//    planet(where: {name: {eq: "Kalee"}}) {
//        id
//    }
//}
//mutation {
//    char:insertCharacter(object: {objectId: "grievous" name: "General Grievous", height: 216 mass: 159 idPlanet: {__subquery: "planet" field: "id"}}) {
//        objectId
//        name
//        height
//        mass
//        homeworld {
//            name
//        }
//    }
//}
//EOT;
//        $this->assertEquals([
//            'objectId' => 'grievous',
//            'name' => 'General Grievous',
//            'height' => 216, 'mass' => 159,
//            'homeworld' => ['name' => 'Kalee']
//        ], \Orkester\GraphQL\Executor::run($query)['char']);
//    }
}
