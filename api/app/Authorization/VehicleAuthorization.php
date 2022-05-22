<?php

namespace App\Authorization;

use Orkester\MVC\MModel;
use Orkester\Persistence\Criteria\RetrieveCriteria;
use Orkester\Authorization\IAuthorization;

class VehicleAuthorization implements IAuthorization
{

    function before(): ?bool
    {
        // TODO: Implement before() method.
    }

    function readAttribute(string $attribute): bool
    {
        // TODO: Implement readAttribute() method.
    }

    function insertAttribute(string $attribute): bool
    {
        // TODO: Implement insertAttribute() method.
    }

    function updateAttribute(string $attribute): bool
    {
        // TODO: Implement updateAttribute() method.
    }

    function updateEntity(int $pk): bool
    {
        // TODO: Implement updateEntity() method.
    }

    function deleteEntity(int $pk): bool
    {
        // TODO: Implement deleteEntity() method.
    }

    function criteria(MModel $model): RetrieveCriteria
    {
        // TODO: Implement criteria() method.
    }
}
