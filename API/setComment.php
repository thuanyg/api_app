<?php
include('./Connect.php');
include "./header.php";
$db  = new Database();
if(!isset($_GET['userid']) || !isset($_GET['content']) || !isset($_GET['postid']) || !isset($_GET['rating'])){
    $response['status'] = false;
    $response['message']= "Error data. Lack of query paramater.";
    echo json_encode($response);
}else{
    $userid = $_GET['userid'];
    $post_id = $_GET['postid'];
    $content = $_GET['content'];
    $rating = $_GET['rating'];

        // Tạo câu lệnh SQL với dữ liệu đã được escape
    $sql = "INSERT INTO comment_post (userid, post_id, content, rating) VALUES ('$userid', '$post_id', '$content', $rating)";
    $result = $db->query($sql);
     $affected_rows = mysqli_affected_rows($db->conn);

    // Kiểm tra xem có bản ghi nào bị ảnh hưởng không
    if ($result && $affected_rows > 0) {
        $response['status'] = true;
        $response['message'] = "Thêm bình luận thành công.";
        echo json_encode($response);
    } else {
        $response['status'] = false;
        $response['message'] = "Không thể thêm bình luận.";
        echo json_encode($response);
    }
}

$db->close();
?>