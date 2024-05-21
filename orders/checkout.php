<?php
ini_Set("display_errors", "on");

include "../include.php";

$table = "orders";

$usersid = filterRequest("usersid");
$addressid = filterRequest("addressid");
$orderstype = filterRequest("orderstype");
$ordersprice = filterRequest("ordersprice");
$deliveryprice = filterRequest("deliveryprice");
$couponid = filterRequest("orderscoupon");
$paymentmethod = filterRequest("paymentmethod");
$coupondiscount = filterRequest("coupondiscount");

// Establish database connection
$connect = new PDO("mysql:host=localhost;dbname=u699408021_exfai;charset=utf8mb4", "u699408021_exfai", "Islam253");
$connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if ($orderstype == '1') {
    $deliveryprice = 0;
}

$totalprice = $ordersprice + $deliveryprice;

// Check coupon:
$datenow = date("Y-m-d H:i:s");
$checkcoupon = getData("coupon", "coupon_id = '$couponid' AND coupon_expiredate > '$datenow' AND coupon_count > 0", null, false);

if ($checkcoupon > 0) {
    $totalprice = $totalprice - $coupondiscount;
    $statement = $connect->prepare("UPDATE coupon SET coupon_count = coupon_count - 1 WHERE coupon_id = '$couponid' ");
    $statement->execute();
}

$data = array(
    "orders_usersid" => $usersid,
    "orders_address" => $addressid,
    "orders_type" => $orderstype,
    "orders_price" => $ordersprice,
    "orders_deliveryprice" => $deliveryprice,
    "orders_coupon" => $couponid,
    "orders_totalprice" => $totalprice,
    "orders_paymentmethod" => $paymentmethod,
);

$count = insertData($table, $data, false);

if ($count > 0) {
    $statement = $connect->prepare("SELECT MAX(orders_id) FROM orders ");
    $statement->execute();
    $maxid = $statement->fetchColumn();

    $data = array("cart_orders" => $maxid);

    updateData("cart", $data, "cart_usersid = $usersid AND cart_orders = 0 ");
}