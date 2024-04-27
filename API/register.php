<?php
include("./Connect.php");
include "./header.php";
$db = new Database();

if (isset($_REQUEST["email"]) && isset($_REQUEST["password"]) && isset($_REQUEST["fullname"])) {
    $email = $_REQUEST["email"];
    $password = ($_REQUEST['password']);
    $fullname = $_REQUEST["fullname"];
    if ($email == "" || $password == "" || $fullname == "") {
        $response['status'] = false; // Đánh dấu trạng thái lỗi
        $response['message'] = 'error data'; // Thêm thông điệp lỗi
    } else {
        $sql = "select * from users where email ='" . $email. "'";
        $result = $db->query($sql);

        if ($row = $result->fetch_assoc()) {
            $response['status']  = false;
            $response['message'] = "Email already exists";
        } else {
            $sql1 = "insert into users(fullname,email,password) values('" . $fullname . "','" . $email ."','". $password ."')";
            $result1 = $db->query($sql1);
            if($result1 === true){
                $response['status']  = true;
                $response['message'] = "Login Successfully!";
            }
            
        }
        
    }
} else {
    $response['status'] = false; // Đánh dấu trạng thái lỗi
    $response['message'] = 'No found param';
}
echo json_encode($response);
$db->close();
