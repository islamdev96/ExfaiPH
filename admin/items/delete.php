<?php

include "../../include.php" ;

$id = filterRequest("id") ; 

$imagename = filterRequest("imagename") ; 

deleteFile( "../../upload/items", $imagename) ; 

deleteData("items" , "items_id = $id ") ; 