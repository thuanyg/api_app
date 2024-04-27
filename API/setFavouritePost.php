<?php
include('./Connect.php');
include "./header.php";
$db  = new Database();
if (!isset($_REQUEST['userid']) || !isset($_REQUEST['post_id'])) {
    $response['status'] = false;
} else {
    $userid = $_REQUEST['userid'];
    $post_id = $_REQUEST['post_id'];
    
    if($userid=="" || $post_id=="" ){
        $response['status'] = false;
    }else{
        // Kiểm tra xem đã tồn tại bản ghi với post_id và userid được truyền vào hay không
        $sql_check = "SELECT * FROM favourite_post WHERE post_id = " . $post_id . " AND userid = " . $userid;
        $result_check = $db->query($sql_check);
        if ($result_check->num_rows > 0) {
            // Nếu đã tồn tại bản ghi, không thực hiện chèn dữ liệu mới
            $response['status'] = false;
        } else {
            // Nếu không tồn tại bản ghi, thực hiện chèn dữ liệu mới
            $sql_insert = "INSERT INTO favourite_post (post_id, userid) VALUES($post_id, $userid)";
            $result_insert = $db->query($sql_insert);
            if ($result_insert) {
                $response['status'] = true;
            } else {
                $response['status'] = false;
            }
        }
    }
}
echo json_encode($response);
$db->close();
?>