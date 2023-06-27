<?php
class Payroll
{
    protected $gm, $auth, $pdo;

    public function __construct(\PDO $pdo, $gm, $auth)
    {
        $this->pdo = $pdo;
        $this->gm = $gm;
        $this->auth = $auth;
    }
    public function getEmployees()
    {

        $data = null;
        $msg = "Unable to retrieve records";
        $code = 400;
        $remarks = "failed";

        $dt = array("fld1" => 1, "fld1" => 1);

        $sql = "Call getEmployees()";
        $stmt = $this->pdo->prepare($sql);
        try {
            $stmt->execute();
            if ($stmt->rowCount() > 0) {
                if ($res = $stmt->fetchAll()) {
                    $data = $res;
                    $msg = "success";
                    $code = 200;
                    $remarks = "Success";
                }
            }
        } catch (\PDOException $e) {
            return array("payload" => $data, "msg" => $msg, "code" => $code, "remarks" => $remarks);
        }
        return array("payload" => $data, "msg" => $msg, "code" => $code, "remarks" => $remarks);
    }
}
