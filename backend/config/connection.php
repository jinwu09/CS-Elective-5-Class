<?php
define("SERVER", "localhost");
define("DBASE", "cse_payroll");
define("USER", "payrolluser");
define("PWORD", "");

class Connection
{
    public function connect()
    {
        $conString = "mysql:host=" . SERVER . ";dbname=" . DBASE . "; charset=utf8mb4";
        $options = [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES => false
        ];
        return new \PDO($conString, USER, PWORD, $options);
    }
}
