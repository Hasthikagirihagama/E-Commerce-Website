<?php
//making config as we need this everytime we can just use it through include_once
//1st step for database php connection
$serverName = "mysql";
$dBUsername = "root";
$dBPassword = "root";
$dBName = "nikitha_ecom_db";

//Before we can access data in the MySQL database, we need to be able to connect to the server
$con = new mysqli($serverName,$dBUsername,$dBPassword,$dBName);

// Check connection
if($con->connect_error){
    die("Connection failed: " . $con->connect_error);
}
?>