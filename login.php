<?php
include("./Connect.php");
include "./header.php";
$db = new Database();
if (isset($_POST["email"]) && isset($_POST["password"])) {
    $email = $_POST["email"];
    $password = ($_POST['password']);
    if($email=="" || $password==""){
        $response['status'] = false; // Đánh dấu trạng thái lỗi
        $response['message'] = 'error data'; // Thêm thông điệp lỗi
    }else{
        $sql = "select * from users where email ='" . $email . "' and password ='" . $password ."'";
        $result = $db->query($sql);
    
        if ($row = $result->fetch_assoc()) {
            $user = array(
                'userid' => $row['userid'],
                'fullName' => $row['fullName'],
                'email' => $row['email'],
                'password' => $row['password'],
                'avatar_image' => $row['avatar_image']
            );
        }
        $response['status']  = true;
        $response['data'] = $user;
    }
    
} else {
    $response['status'] = false; // Đánh dấu trạng thái lỗi
    $response['message'] = 'No results found';
}
echo json_encode($response);
$db->close();
?>
