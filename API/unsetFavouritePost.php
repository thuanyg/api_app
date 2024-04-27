<?php
include('./Connect.php');
include "./header.php";

$db = new Database();
$response = array();

if (!isset($_REQUEST['userid']) || !isset($_REQUEST['post_id'])) {
    $response['status'] = false;
} else {
    $userid = $db->escapeString($_REQUEST['userid']);
    $post_id = $db->escapeString($_REQUEST['post_id']);
    
    if ($userid == "" || $post_id == "") {
        $response['status'] = false;
    } else {
        // Thực hiện truy vấn xóa
        $sql_delete = "DELETE FROM favourite_post WHERE userid = '$userid' AND post_id = '$post_id'";
        $result_delete = $db->query($sql_delete);

        // Lấy số lượng bản ghi bị ảnh hưởng bởi truy vấn xóa
        $affected_rows = mysqli_affected_rows($db->conn);

        if ($affected_rows > 0) {
            // Ít nhất một bản ghi đã được xóa thành công
            $response['status'] = true;
        } else {
            // Không có bản ghi nào bị xóa hoặc có lỗi xảy ra
            $response['status'] = false;
        }
    }
}

echo json_encode($response);
$db->close();
?>
