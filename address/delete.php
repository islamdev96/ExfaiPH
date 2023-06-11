<?php 

include "../include.php" ; 

$addressid = filterRequest("addressid"); 

deleteData("address" , "address_id  = $addressid"); 
