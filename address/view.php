<?php 

include "../include.php" ; 

$usersid = filterRequest("usersid") ; 

getAllData("address" , "address_usersid = $usersid ") ; 