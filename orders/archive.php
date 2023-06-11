<?php 

include "../include.php" ; 


$userid = filterRequest("id") ; 


getAllData('ordersview' , "orders_usersid = '$userid' AND orders_status =  4"); 

 
    
?>