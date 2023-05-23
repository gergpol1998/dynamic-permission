<?php
require_once "condb.php";
session_start();
if (!isset($_SESSION['username'])){
    echo "<script>alert('go to login')</script>";
    echo "<script>window.location.href = 'index.php'</script>";
}
if (isset($_POST['submit'])){
    $name = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $position = $_POST['position'];
    

    $sqlins_emp = "insert into tb_emp (emp_username,emp_password,emp_name,emp_position_id)
    values ('$username','$password','$name','$position')";
    $result = $conn->query($sqlins_emp);
    if (!$result){
        die(mysqli_error($conn));
    }
    else{
        echo "<script>alert('insert success')</script>";
        echo "<script>window.location.href = 'control.php'</script>";
    }
   
}
?>