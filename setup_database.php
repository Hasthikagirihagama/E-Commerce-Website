<?php
include('./includes/connect.php');

$create_table_sql = "
CREATE TABLE IF NOT EXISTS `card_details` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `product_id` int(11) NOT NULL,
    `ip_address` varchar(255) NOT NULL,
    `quantity` int(11) NOT NULL DEFAULT 1,
    `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `card_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
)";

if(mysqli_query($con, $create_table_sql)) {
    echo "Table card_details created successfully";
} else {
    echo "Error creating table: " . mysqli_error($con);
}
?> 
