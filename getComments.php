<?php
include "./Connect.php";
include "./header.php";
$db = new Database();
$num_row = 10;
if (isset($_GET["post_id"])) {
    $sql = "select * from comment_post where posi_id=" . $_GET['post_pd'] ;
    $result = $db->Query($sql);
    if ($result->num_rows == 0) {
        $response['status'] = false;
        $response['message']= "error data";
    } else {
        $num_of_page = ceil($result->num_rows / $num_row); // Số trang cần thiết
        if (!isset($_GET['page'])) {
            $page = 1;
        } else {
            $page = $_GET['page'];
        }
        if ($page < 1) {
            $page = 1;
        }
        if ($page > $num_of_page) {
            $page = $num_of_page;
        }
        $offset = ($page - 1) * $num_row; // Tính toán vị trí bắt đầu của kết quả
        $sql = "select u.avatar_image,u.fullName,c.* from users u join comment_post c on u.userid=c.userid where c.post_id=" . $_GET['post_id'] ." order by c.date DESC limit " . $offset . "," . $num_row;
        $result1 = $db->Query($sql);
    if ($result1->num_rows > 0) {
        // Tạo một mảng để lưu trữ các bài viết với thông tin món ăn và nhà hàng
        $postsWithDetails = array();
        while ($row = $result1->fetch_assoc()) {
            // Tạo một đối tượng mới để lưu trữ thông tin của mỗi bài viết
            $comment = array(
                "cmt_id" => $row["cmt_id"],
                "userid" => $row["userid"],
                "content" => $row["content"],
                "avatar_image" => $row["avagter_image"],
                "data" => $row["date"],
                "post_id" => $row["post_id"],
                "fullName" => $row["fullName"],
            );
            // Thêm bài viết vào mảng
            $commentsWithDetails[] = $comment;
        }
        // Chuyển đổi kết quả thành định dạng JSON
        $response['status']=true;
        $response['data']=$commentsWithDetails;

        // Trả về JSON như là kết quả của API
       
    } else {
        $response['status'] = false;
        $response['message']= "not comment";
    }
    }
}
echo json_encode($response);
$db->close();
