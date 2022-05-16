<?php

use Orkester\GraphQL\Executor;
use PHPUnit\Framework\TestCase;

class QueryWhereTest extends TestCase
{
    public function testEq()
    {
        $query = <<<EOT
query {
    planets(where: {name: {eq: "Mon Cala"}}) {
        name
        objectId
    }
}
EOT;
        $data = Executor::run($query)['planets'];
        $this->assertCount(1, $data);
        $this->assertEquals([
            'name' => 'Mon Cala',
            'objectId' => 'EY3gbE2taR'
        ], $data[0]);
    }

    public function testLike()
    {
        $query = <<<EOT
query {
    characters(where: {name: {like: "%Skywalker%"}}) {
        name
    }
}
EOT;
        $this->assertCount(3, Executor::run($query)['characters']);
    }

    public function testContains()
    {
        $query = <<<EOT
query {
    characters(where: {name: {contains: "Skywalker"}}) {
        name
    }
}
EOT;
        $this->assertCount(3, Executor::run($query)['characters']);
    }

    public function testAssociatedWhere()
    {
        $query = <<<EOT
query {
    planets(
        order_by: [{asc: "name"}]    
        where: {or: {name: [{eq: "Tatooine"}, {eq: "Alderaan"}]}}) 
        {
        name
        natives(where: {gender: {eq: "female"}}) {
            name
        }
    }
}
EOT;
        $this->assertEquals([
            [
                'name' => 'Alderaan',
                'natives' => [['name' => 'Leia Organa']]
            ],
            [
                'name' => 'Tatooine',
                'natives' => [
                    ['name' => 'Beru Whitesun lars'],
                    ['name' => 'Shmi Skywalker']
                ]
            ]
        ], Executor::run($query)['planets']);
    }

    public function testNotEquals()
    {
        $query = <<<EOT
query {
    planets(where: {name: {neq: "Tatooine"}}) 
    {
        name
    }
}
EOT;
        $names = array_map(fn($d) => $d['name'], Executor::run($query)['planets']);
        $this->assertNotContains('Tatooine', $names);
    }

    public function testLessThan()
    {
        $query = <<<EOT
query {
    planets(where: {rotationPeriod: {lt: 18}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(3, Executor::run($query)['planets']);
    }

    public function testLessEqualsThan()
    {
        $query = <<<EOT
query {
    planets(where: {rotationPeriod: {lte: 18}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(4, Executor::run($query)['planets']);
    }

    public function testGreaterThan()
    {
        $query = <<<EOT
query {
    planets(where: {rotationPeriod: {gt: 48}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(1, Executor::run($query)['planets']);
    }

    public function testGreaterEqualsThan()
    {
        $query = <<<EOT
query {
    planets(where: {rotationPeriod: {gte: 48}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(2, Executor::run($query)['planets']);
    }

    public function testIn()
    {
        $query = <<<EOT
query {
    planets(where: {name: {in: ["Tatooine", "Coruscant"]}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(2, Executor::run($query)['planets']);
    }

    public function testNotIn()
    {
        $query = <<<EOT
query {
    planets(where: {name: {nin: ["Tatooine", "Coruscant"]}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(57, Executor::run($query)['planets']);
    }

    public function testIsNull()
    {
        $query1 = <<<EOT
query {
    planets(where: {surfaceWater: {is_null: true}}) 
    {
        name
    }
}
EOT;
        $query2 = <<<EOT
query {
    planets(where: {surfaceWater: {is_null: false}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(35, Executor::run($query1)['planets']);
        $this->assertCount(26, Executor::run($query2)['planets']);
    }

    public function testRegex()
    {
        $query = <<<EOT
query {
    planets(where: {name: {regex: "(Tatooine)|(Coruscant)"}}) 
    {
        name
    }
}
EOT;
        $this->assertCount(2, Executor::run($query)['planets']);
    }
}
