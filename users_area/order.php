<?php
include('../includes/connect.php');
include('../functions/common_functions.php');
// session_start();
if(isset($_GET['user_id'])){
    $user_id = $_GET['user_id'];
}

// Fetch all shops for the dropdown
$shops_query = "SELECT * FROM `shops`";
$shops_result = mysqli_query($con, $shops_query);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selected_shop_id = $_POST['shop_id'];

    // getting total items and total price of all items
    $get_ip_address = getIPAddress();
    $total_price = 0;
    $cart_query = "SELECT * FROM `card_details` WHERE ip_address= '$get_ip_address'";
    $cart_result = mysqli_query($con, $cart_query);
    $invoice_number = mt_rand();
    $status = "pending";
    $count_products = mysqli_num_rows($cart_result);
    while ($row_price = mysqli_fetch_array($cart_result)) {
        $product_id = $row_price['product_id'];
        $product_quantity = $row_price['quantity']; // quantity of each product 
        $select_product = "SELECT * FROM `products` WHERE product_id= $product_id";
        $select_product_result = mysqli_query($con, $select_product);
        // getting total sum of all products
        while ($row_product_price = mysqli_fetch_array($select_product_result)) {
            $product_price = array($row_product_price['product_price']);
            $product_values = array_sum($product_price) * $product_quantity;
            $total_price += $product_values;
        }
        // Orders Pending
        $insert_pending_order_query = "INSERT INTO `orders_pending` (user_id, invoice_number, product_id, quantity, order_status) VALUES ($user_id, $invoice_number, $product_id, $product_quantity, '$status')";
        $insert_pending_order_result = mysqli_query($con, $insert_pending_order_query);
    }

    // Insert Orders 
    $insert_order_query = "INSERT INTO `user_orders` (user_id, amount_due, invoice_number, total_products, order_date, order_status, shop_id) VALUES ($user_id, $total_price, $invoice_number, $count_products, NOW(), '$status', $selected_shop_id)";
    $insert_order_result = mysqli_query($con, $insert_order_query);
    if ($insert_order_result) {
        echo "<script>window.alert('Orders are submitted successfully');</script>";
        echo "<script>window.open('profile.php','_self');</script>";
    }

    // Delete items from cart
    $empty_cart = "DELETE FROM `card_details` WHERE ip_address='$get_ip_address'";
    $empty_cart_result = mysqli_query($con, $empty_cart);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
</head>
<body>
    <div class="container">
        <h2 class="text-center my-4">Place Your Order</h2>
        <form action="" method="POST">
            <div class="form-group">
                <label for="shop_id">Select Shop</label>
                <select name="shop_id" id="shop_id" class="form-control" required>
                    <option value="" disabled selected>Select a Shop</option>
                    <?php
                    while ($row_shop = mysqli_fetch_assoc($shops_result)) {
                        echo "<option value='{$row_shop['shop_id']}'>{$row_shop['shop_name']}</option>";
                    }
                    ?>
                </select>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Place Order</button>
        </form>
    </div>
    <script src="../assets/js/bootstrap.bundle.js"></script>
</body>
</html>

