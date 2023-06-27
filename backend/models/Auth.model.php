<?php
class Auth
{
    protected $pdo, $gm;
    public function __construct(\PDO $pdo, $gm)
    {
        $this->pdo = $pdo;
        $this->gm = $gm;
    }
}
