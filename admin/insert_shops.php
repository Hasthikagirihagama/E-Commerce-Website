<?php 
    include('../includes/connect.php');
    if(isset($_POST['insert_shop'])){
        $shop_name = $_POST['shop_name'];
        $shop_description = $_POST['shop_description'];
        $shop_owner = $_POST['shop_owner'];

        // Check if the shop name already exists
        $select_query = "SELECT * FROM `shops` WHERE shop_name = '$shop_name'";
        $select_result = mysqli_query($con, $select_query);
        if (!$select_result) {
            die('Query Failed: ' . mysqli_error($con));
        }
        $numOfResults = mysqli_num_rows($select_result);
        if($numOfResults > 0){
            echo "<script>alert('This Shop is already in the Database');</script>";
        } else {
            // Insert the new shop
            $insert_query = "INSERT INTO `shops` (shop_name, shop_description, shop_owner) VALUES ('$shop_name', '$shop_description', '$shop_owner')";
            $insert_result = mysqli_query($con, $insert_query);
            if (!$insert_result) {
                die('Query Failed: ' . mysqli_error($con));
            }
            if ($insert_result){
                echo "<script>alert('Shop has been inserted successfully');</script>";
            }
        }
    }
?>
<div class="categ-header">
    <div class="sub-title">
        <span class="shape"></span>
        <h2>Insert Shops</h2>
    </div>
</div>
<form action="" method="POST" class="mb-2">
    <div class="input-group w-90 mb-3">
        <span class="input-group-text secondry-1" id="basic-addon1">
        <svg xmlns="http://www.w3.org/2000/svg" height="1em" fill="#ffffff" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
        </span>
        <input type="text" class="form-control" name="shop_name" placeholder="Insert Shop Name" aria-label="Shop Name" aria-describedby="basic-addon1" required>
    </div>
    <div class="input-group w-90 mb-3">
        <span class="input-group-text secondry-1" id="basic-addon1">
        <svg xmlns="http://www.w3.org/2000/svg" height="1em" fill="#ffffff" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
        </span>
        <input type="text" class="form-control" name="shop_description" placeholder="Insert Shop Description" aria-label="Shop Description" aria-describedby="basic-addon1" required>
    </div>
    <div class="input-group w-90 mb-3">
        <span class="input-group-text secondry-1" id="basic-addon1">
        <svg xmlns="http://www.w3.org/2000/svg" height="1em" fill="#ffffff" viewBox="0 0 384 512"><path d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8V488c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488V24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96zM80 352c0 8.8 7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16H288c8.8 0 16-7.2 16-16s-7.2-16-16-16H96z"/></svg>
        </span>
        <input type="text" class="form-control" name="shop_owner" placeholder="Insert Shop Owner" aria-label="Shop Owner" aria-describedby="basic-addon1" required>
    </div>
    <div class="input-group w-90 mb-3">
        <input type="submit" class="btn btn-primary" name="insert_shop" value="Insert Shop">
    </div>
</form>