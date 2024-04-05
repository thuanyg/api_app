<?php
include("./Connect.php");
$db = new Database();
if (isset($_REQUEST["userid"])) {
    $userid = $_REQUEST["userid"];
    if($userid==""){
        $response['status'] = false; // Đánh dấu trạng thái lỗi
        $response['message'] = 'No results found'; // Thêm thông điệp lỗi
    }else{
        $sql = "select * from users where userid = " . $userid;
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
