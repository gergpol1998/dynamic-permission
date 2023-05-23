<?php
require_once "condb.php";
session_start();
if (!isset($_SESSION['username'])){
    echo "<script>alert('go to login')</script>";
    echo "<script>window.location.href = 'index.php'</script>";
}
if (isset($_POST['submit'])){
    $postion = $_POST['postion'];
    $perid = $_POST['perid'];

    
        $sqlins_position = "insert into tb_position (position_name) values ('$postion')";
        $result = $conn->query($sqlins_position);
        if (!$result){
            die(mysqli_error($conn));
        }
        else{
            $sqlposition_id = "select MAX(position_id) as lastid from tb_position";
            $ex_sqlposition_id = $conn->query($sqlposition_id);
            if ($ex_sqlposition_id->num_rows > 0){
                $row = $ex_sqlposition_id->fetch_assoc();
                $postion_id = $row['lastid'];
                foreach($perid as $pers){
                    $sqlins_pos_per = "insert into tb_pos_per (pos_id,per_id) values ('$postion_id','$pers')";
                    $result2 = $conn->query($sqlins_pos_per);
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