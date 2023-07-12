<?php

ini_set("display_errors", "on");
include "../include.php";

$ordersTable = "orders";

$usersid = filterRequest("userid");
$addressid = filterRequest("addressid");
$orderstype = filterRequest("orderstype");
$ordersprice = filterRequest("ordersprice");
$deliveryprice = filterRequest("deliveryprice");
$coupontd = filterRequest("coupontd"); // Updated variable name to match the column name
$paymentmethod = filterRequest("paymentmethod");
$coupondiscount = filterRequest("coupondiscount");

$totalprice = $ordersprice + $deliveryprice;

$datenow = date("Y-m-d H:i:s");
$checkcoupon = getData("coupon", "coupon_id = $coupontd AND coupon_expiredate > '$datenow' AND coupon_count > 0", null, false);

try {
    if ($checkcoupon > 0) {
        $totalprice = $ordersprice - ($ordersprice * $coupondiscount / 100);
    }

    $data = array(
        "orders_usersid" => $usersid,
        "orders_address" => $addressid,
        "orders_type" => $orderstype,
        "orders_price" => $ordersprice,
        "orders_pricedelivery" => $deliveryprice, // Updated column name to match the table structure
        "orders_coupon" => $coupontd,
        "orders_price" => $totalprice, // Updated column name to match the table structure
        "orders_paymentmethod" => $paymentmethod,
        "orders_datetime" => $datenow // Added column name to match the table structure
    );

    $count = insertData($ordersTable, $data, false);

    if ($count > 0) {
        $statement = $connect->prepare("SELECT MAX(orders_id) FROM $ordersTable");
        $statement->execute();
        $maxid = $statement->fetchColumn();

        $data = array(
            "cart_orders" => $maxid
        );

        updateData("cart", $data, "cart_usersid = $usersid AND cart_orders = '@'");
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

// Remove the duplicate getData() function from functions.php

