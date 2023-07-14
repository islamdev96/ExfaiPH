<?php
$connect = "mysql:host=localhost;dbname=u700906284_exfai22";
$user = "u700906284_exfai22";
$pass = "Islam253";
$option = array(
   PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);

try {
   $con = new PDO($connect, $user, $pass, $option);
   $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   header("Access-Control-Allow-Origin: *");
   header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
   header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
   include "functions.php";
   // if (!isset($notAuth)) {
   //    checkAuthenticate();
   // }
} catch (PDOException $e) {
   echo $e->getMessage();
}
