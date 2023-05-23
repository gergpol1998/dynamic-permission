<?php
require_once "condb.php";
session_start();
if (!isset($_SESSION['username'])){
    echo "<script>alert('go to login')</script>";
    echo "<script>window.location.href = 'index.php'</script>";
}
if (isset($_POST['submit'])){
    $pername = $_POST['pername'];
    $pageid = $_POST['page'];
        
    $sqlins_per = "insert into tb_permission (permission_name)
    values ('$pername')";
    $result = $conn->query($sqlins_per);
    if (!$result){
        die(mysqli_error($conn));
    }
    else{
        $sqlperid = "select MAX(permission_id) as lastid from tb_permission";
        $ex_perid = $conn->query($sqlperid);
        if ($ex_perid->num_rows > 0){
            $row = $ex_perid->fetch_assoc();
            $perid = $row['lastid'];
            foreach ($pageid as $pages){
                $sqlins_per_page = "insert into tb_page_per (pp_perid,pp_pageid)
                values ('$perid','$pages')";
                $result2 = $conn->query($sqlins_per_page);
                if (!$result2){
                    die(mysqli_error($conn));
                }
                else{
                    echo "<script>alert('insert success')</script>";
                    echo "<script>window.location.href = 'control.php'</script>";
                }
            }
            
        }
        
    }
}
?>