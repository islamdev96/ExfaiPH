<?php 

include "../include.php" ; 

$id = filterRequest("id") ;  

deleteData("favorite" , "favorite_id = $id"); 
