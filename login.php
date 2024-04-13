<?php
include("./Connect.php");
include "./header.php";
$db = new Database();
if (isset($_REQUEST["email"]) && isset($_REQUEST["password"])) {
    $email = $_REQUEST["email"];
    $password = ($_REQUEST['password']);
    if ($email == "" || $password == "") {
        $response['status'] = false; // Đánh dấu trạng thái lỗi
        $response['message'] = 'error data'; // Thêm thông điệp lỗi
    } else {
        $sql = "select userid from users where email ='" . $email . "' and password ='" . $password . "'";
        $result = $db->query($sql);

        if ($row = $result->fetch_assoc()) {

            $response['status']  = true;
            $response['data'] = $row['userid'];
            $response['message'] = "Login Successfully!";
        } else {
            $response['status']  = false;
            $response['message'] = "No results found";
        }
    }
} else {
    $response['status'] = false; // Đánh dấu trạng thái lỗi
    $response['message'] = 'No found param';
}
echo json_encode($response);
$db->close();
