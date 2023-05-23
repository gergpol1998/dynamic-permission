<?php
require_once "condb.php";
session_start();

if (isset($_POST['submit'])){
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sqlemp = "select * from tb_emp 
    where emp_username = '$username' and emp_password = '$password'";
    $ex_emp = $conn->query($sqlemp);
    if ($ex_emp->num_rows > 0){
        $_SESSION['username'] = $username;
        echo "<script>alert('login success')</script>";
        echo "<script>window.location.href = 'control.php'</script>";

    }
    else{
        echo "<script>alert('login fail')</script>";
        echo "<script>window.location.href = 'index.php'</script>";

    }
}
?>