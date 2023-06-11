<?php 

include "../include.php" ; 

$ordersid = filterRequest("id")  ;

getAllData("ordersdetailsview" , "cart_orders = $ordersid "); 

?>