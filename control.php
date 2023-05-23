<?php
session_start();
if (isset($_SESSION['username'])){
   $username = $_SESSION['username'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="logout.php">logout</a>
    <a href="add_emp.php">add_emp</a>
    <a href="show_emp.php">show_emp</a>
    <a href="add_permission.php">add_permission</a>
    <a href="show_permission.php">show_permission</a>
    <a href="add_position.php">add_position</a>
</body>
</html>