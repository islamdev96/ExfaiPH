<?php

include "../connect.php";

$username = filterRequest("username");
$password = sha1($_POST['password']);
$email = filterRequest("email");
// $phone = filterRequest("phone");
$verfiycode     = rand(10000 , 99999);

getSignupData("users", "users_email = ? OR users_username = ? users_password = ?", array($email, $username , $password), false);
