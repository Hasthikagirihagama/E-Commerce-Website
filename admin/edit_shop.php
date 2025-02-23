<?php
    // fetch all data
    if(isset($_GET['edit_shop'])){
        $edit_id = $_GET['edit_shop'];
        $get_data_query = "SELECT * FROM `shops` WHERE shop_id = $edit_id";
        $get_data_result = mysqli_query($con,$get_data_query);
        $row_fetch_data = mysqli_fetch_array($get_data_result);
        $shop_id = $row_fetch_data['shop_id'];
        $shop_name = $row_fetch_data['shop_name'];
    }
    // edit shop
    if(isset($_POST['update_shop'])){
        $shop_name = $_POST['shop_name'];
        // check empty fields 
        if(empty($shop_name)){
            echo "<script>window.alert('Please fill the field');</script>";
        }else{
            // update query 
            $update_shop_query = "UPDATE `shops` SET shop_name='$shop_name' WHERE shop_id = $edit_id";
            $update_shop_result = mysqli_query($con,$update_shop_query);
            if($update_shop_result){
                echo "<script>window.alert('Shop updated successfully');</script>";
                echo "<script>window.open('./index.php?view_shops','_self');</script>";
            }
        }
    }
    ?>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center mb-4">Edit Shop</h1>
            <form action="" method="post" enctype="multipart/form-data" class="d-flex flex-column gap-3 mb-3">
                <div class="form-outline">
                    <label for="shop_name" class="form-label">Shop Name</label>
                    <input type="text" name="shop_name" id="shop_name" class="form-control" required value="<?php echo $shop_name;?>">
                </div>
                <div class="form-outline text-center">
                    <input type="submit" value="Update Shop" class="btn btn-primary" name="update_shop">
                </div>
            </form>
        </div>
    </div>
</div>