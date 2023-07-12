<?php
ini_set("display_errors", "on");
include "../include.php";

$table = "orders";

$usersid = filterRequest("userid");
$addressid = filterRequest("addressid");
$orderstype = filterRequest("orderstype");
$ordersprice = filterRequest("ordersprice");
$deliveryprice = filterRequest("deliveryprice");
$coupontd = filterRequest("orderscoupon");
$paymentmethod = filterRequest("paymentmethod");
$coupondiscount = filterRequest("coupondiscount");

$totalprice = $ordersprice + $deliveryprice;

$datenow = date("Y-m-d H:i:s");
$checkcoupon = getData($table, "coupon_id = $coupontd AND coupon_expiredate > '$datenow' AND coupon_count > 0", null, false);

try {
    if ($checkcoupon > 0) {
        $totalprice = $ordersprice - ($ordersprice * $coupondiscount / 100);
    }

    $data = array(
        "orders_usersid" => $usersid,
        "orders_address" => $addressid,
        "orders_type" => $orderstype,
        "orders_price" => $ordersprice,
        "orders_deliveryprice" => $deliveryprice,
        "orders_coupon" => $coupontd,
        "orders_totalprice" => $totalprice,
        "orders_paymentmethod" => $paymentmethod
    );

    $count = insertData($table, $data, false);

    if ($count > 0) {
        $statement = $connect->prepare("SELECT MAX(orders_id) FROM orders");
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
?>
