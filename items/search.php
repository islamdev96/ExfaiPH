<?php 

include "../include.php" ; 

$search = filterRequest("search") ; 

getAllData("items1view" , "items_name LIKE '%$search%' OR items_name_ar  LIKE '%$search%'  ") ; 

?>