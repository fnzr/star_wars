<?php

use Orkester\GraphQL\Executor;
use PHPUnit\Framework\TestCase;

class QueryTest extends TestCase
{
    public function testSelectField()
    {
        $query = <<<EOT
query {
    characters {
        name
        objectId
    }
}
EOT;
        $data = Executor::run($query)['characters'];
        $this->assertEquals([
            'name' => 'Obi-Wan Kenobi',
            'objectId' => 'nxpAPnATEb'
        ], $data[0]);
    }

    public function testOperationAlias()
    {
        $query = <<<EOT
query {
    heroes:characters {
        name
    }
}
EOT;
        $this->assertIsArray(Executor::run($query)['heroes']);
    }

    public function testFieldAlias()
    {
        $query = <<<EOT
query {
    characters(limit: 1) {
        hero:name
    }
}
EOT;
        $this->assertIsString(Executor::run($query)['characters'][0]['hero']);
    }

    public function testExpression()
    {
        $query = <<<EOT
query {
    character(limit: 1) {
        nameGender(expr: "concat(name, ' ', gender)")
    }
}
EOT;
        $this->assertIsString(Executor::run($query)['character']['nameGender']);
    }

    public function testAssociationField()
    {
        $query = <<<EOT
query {
    character(id: 83) {
        name
        homeworld(field: "homeworld.name")
    }
}
EOT;
        $data = Executor::run($query)['character'];
        $this->assertEquals('Stewjon', $data['homeworld']);
    }

    public function testAssociationNested()
    {
        $query = <<<EOT
query {
    character(id: 83) {
        name
        homeworld {
            name
        }
    }
}
EOT;
        $data = Executor::run($query)['character'];
        $this->assertEquals([
            'name' => 'Obi-Wan Kenobi',
            'homeworld' => [
                'name' => 'Stewjon'
            ]
        ], $data);
    }

    public function testAssociationNestedMultiple()
    {
        $query = <<<EOT
query {
    character(id: 83) {
        name
        p1:homeworld {
            name
        }
        p2:homeworld {
            terrain
        }
    }
}
EOT;
        $data = Executor::run($query)['character'];
        $this->assertEquals([
            'name' => 'Obi-Wan Kenobi',
            'p1' => ['name' => 'Stewjon'],
            'p2' => ['terrain' => 'grass']
        ], $data);
    }

    public function testId()
    {
        $query = <<<EOT
{
    characters(id: 86) {
        name
    }
}
EOT;
        $data = Executor::run($query)['characters'][0];
        $this->assertEquals('C-3PO', $data['name']);
    }

    public function testSingular()
    {
        $query = <<<EOT
{
    character(id: 86) {
        name
    }
}
EOT;
        $data = Executor::run($query)['character'];
        $this->assertEquals('C-3PO', $data['name']);
    }

    public function testSingularMissing()
    {
        $query = <<<EOT
{
    character(id: 0) {
        name
    }
}
EOT;
        $data = Executor::run($query)['character'];
        $this->assertNull($data);
    }

    public function testLimit()
    {
        $query = <<<EOT
{
    characters(limit: 5) {
        name
    }
}

EOT;
        $this->assertCount(5, Executor::run($query)['characters']);
    }

    public function testOffset()
    {
        $query = <<<EOT
{
    character(offset: 4 limit: 1) {
        name
    }
}
EOT;
        $this->assertEquals(['name' => 'R2-D2'],
            Executor::run($query)['character']);
    }

    public function testOrderBy()
    {
        $query = <<<EOT
{
    characters(order_by: [{asc: "name"}] limit: 2) {
        name
    }
}
EOT;
        $this->assertEquals([
            ['name' => 'Ackbar'],
            ['name' => 'Adi Gallia']
        ], Executor::run($query)['characters']);
    }

    public function testGroupBy()
    {
        $query = <<<EOT
{
    characters(group_by: ["idPlanet"] limit: 2) {
        count (expr: "count(idCharacter)")
        homeworld (field: "homeworld.name")
    }
}
EOT;
        $this->assertEquals([
            [
                'count' => 10,
                'homeworld' => "Tatooine"
            ],
            [
                'count' => 3,
                'homeworld' => 'Alderaan'
            ]
        ], Executor::run($query)['characters']);
    }

    public function testJoin()
    {
        $query = <<<EOT
{
    character(id: 83 join: [{LEFT: "homeworld"}]) {
        name
        homeworld (field: "homeworld.name")
    }
}
EOT;;
        $this->assertEquals([
            'name' => 'Obi-Wan Kenobi',
            'homeworld' => 'Stewjon',
        ], Executor::run($query)['character']);

    }

    public function testTotal()
    {
        $query = <<<EOT
{
    character(limit: 10 offset: 5) {
        name
    }
    __total(query: "character")
}
EOT;
        $this->assertEquals(82, Executor::run($query)['__total']);
    }

    public function testFormatDate()
    {
        $query = <<<EOT
{
    character(id: 83) {
        createdAt(datetime: "H:i:s Y/m/d")
    }
}
EOT;
        $this->assertEquals("19:42:36 2019/12/13", Executor::run($query)['character']['createdAt']);
    }
}
