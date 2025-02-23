<?php
    if(isset($_GET['delete_shop'])){
        $delete_id = $_GET['delete_shop'];
        $delete_query = "DELETE FROM `shops` WHERE shop_id = $delete_id";
        $delete_result = mysqli_query($con, $delete_query);
        if($delete_result){
            echo "<script>window.alert('Shop deleted successfully');</script>";
            echo "<script>window.open('index.php?view_shops','_self');</script>";
        }
    }
?>