<?php
require_once "condb.php";
session_start();
if (!isset($_SESSION['username'])) {
    echo "<script>alert('go to login')</script>";
    echo "<script>window.location.href = 'index.php'</script>";
} 
else {
    $page = basename($_SERVER['PHP_SELF']);
    $username = $_SESSION['username'];

    $sqlpage = "select * from tb_page
    where page_name = '$page'";
    $ex_page = $conn->query($sqlpage);
    if ($ex_page->num_rows === 0) {
        $sqlins_page = "insert into tb_page (page_name) values ('$page')";
        $ex_ins_page = $conn->query($sqlins_page);
    } 
    $sqlcheck = "select  permission_name from tb_emp inner join tb_position on emp_position_id = tb_position.position_id
    inner join tb_pos_per on pos_id = tb_position.position_id
    inner join tb_permission on permission_id = per_id
    inner join tb_page_per on pp_perid = permission_id
    inner join tb_page on page_id = pp_pageid
    where emp_username = '$username' and page_name = '$page'";
    $ex_check = $conn->query($sqlcheck);
    if ($ex_check->num_rows > 0) {
        echo "your have permission";
    } 
    else {
        echo "<script>alert('permission denied')</script>";
        echo "<script>window.location.href = 'control.php'</script>";
    }
        
    
    
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
    <form action="insert_emp.php" method="post">

        <label>name</label>
        <input type="text" name="name" required><br>

        <label>username</label>
        <input type="text" name="username" required><br>

        <label>password</label>
        <input type="password" name="password" required><br>

        <label>position</label>
        <select name="position" required>
            <option value="">Select position</option>
            <?php
            $sqlposition = "select * from tb_position";
            $ex_position = $conn->query($sqlposition);
            if ($ex_position->num_rows > 0) {
                while ($row = $ex_position->fetch_assoc()) {
            ?>
                    <option value="<?php echo $row['position_id'] ?>"><?php echo $row['position_name'] ?></option>
            <?php
                }
            }
            ?>
        </select><br>
        <input type="submit" name="submit" value="Add Employee">
    </form>
</body>

</html>