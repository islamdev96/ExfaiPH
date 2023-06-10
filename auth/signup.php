<?php

include "../connect.php";

$username = filterRequest("username");
$password = sha1($_POST['password']);
$email = filterRequest("email");
// $phone = filterRequest("phone");
$verfiycode = rand(10000 , 99999);

$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();
if ($count > 0) {
    printFailure("PHONE OR EMAIL EXIST");
} else {
    $data = array(
        "users_name" => $username,
        "users_password" =>  $password,
        "users_email" => $email,
        // "users_phone" => $phone,
        "users_verifycode" => $verfiycode,
    );
    sendEmail($email , "Verify Code Ecommerce" , "Verify Code $verfiycode"); 
    insertData("users", $data);

    // Retrieve the inserted data
    $stmt = $con->prepare("SELECT * FROM users WHERE users_email = ?");
    $stmt->execute(array($email));
    $userData = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $response = array("status" => "success", "data" => $userData);
    echo json_encode($response);
}
?>
