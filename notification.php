<?php 

include "./include.php"  ;

$userid = filterRequest("id") ; 

getAllData("notification"  , "notification_userid = $userid") ; 


?>