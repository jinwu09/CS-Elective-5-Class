<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTION");
header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Max-Age:86499");
ini_set('display_errors', 0);
date_default_timezone_set("Asia/Manila");
set_time_limit(1000);

$rootPath = $_SERVER["DOCUMENT_ROOT"];
$apiPath = $_SERVER["DOCUMENT_ROOT"] . "/CS-ELECTIVE-5-CLASS/backend";
require_once($apiPath . "/config/Connection.php");
require_once($apiPath . "/models/Auth.model.php");
require_once($apiPath . "/models/Global.model.php");
require_once($apiPath . "/models/Payroll.model.php");

$db = new Connection();
$pdo = $db->connect();
$gm = new GlobalMethods($pdo);
$auth = new Auth($pdo, $gm);
$payroll = new Payroll($pdo, $gm, $auth);

$req = [];
if (isset($_REQUEST['request']))
    $req = explode('/', rtrim($_REQUEST['request'], '/'));
else
    $req = array("errorcatcher");
$test = $_SERVER['REQUEST_METHOD'];
switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        $state = array(
            "rem" => "Failed",
            "msg" => "No available public API "
        );
        print_r(json_encode($state));
        http_response_code(403);
        break;
    case 'POST':
        require_once($apiPath . "/controller/Payroll.routes.php");
        # code...
        break;

    default:
        # code...
        break;
}