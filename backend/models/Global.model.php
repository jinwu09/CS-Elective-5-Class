<?php
class GlobalMethods
{
    protected $pdo;
    public function __construct(\PDO $pdo)
    {
        $this->pdo = $pdo;
    }
    public function Call(string $procedure,  $args = null)
    {
    }
}
