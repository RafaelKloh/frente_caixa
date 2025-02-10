<?php
$host = "localhost";
$user = "root";
$password = "";
$db = "frente_caixa";

$conn = mysqli_connect($host, $user, $password, $db);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
else{
    echo "Connected successfully";
}
mysqli_close($conn);
?>