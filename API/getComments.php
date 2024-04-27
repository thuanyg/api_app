<?php
include "./Connect.php";
include "./header.php";
$db = new Database();
$num_row = 10;
$total_records = 0;
if (isset($_GET["postid"])) {
    $sql = "select * from comment_post where post_id=" . $_GET['postid'] ;
    $result = $db->query($sql);
    if ($result->num_rows == 0) {
        $response['status'] = false;
        $response['message']= "error data";
    } else {
    	$total_records = $result->num_rows;
        $num_of_page = ceil($total_records / $num_row);
        if (!isset($_GET['page'])) {
            $page = 1;
        } else {
            $page = $_GET['page'];
        }
        if ($page < 1) {
            $page = 1;
        }
        
        // Pagination
    	$pagination = array(
            "currentPage" => intval($page),
            "totalPage" =>  intval($num_of_page),
            "totalItem" => intval($total_records)
    	);
    
         if ($page > $num_of_page) {
        	$response['status'] = false;
        	$response['data'] = null;
        	$response['message'] = "Data not found in this page.";
        	$response["pagination"] = $pagination;
        	echo json_encode($response);
        	return;
    	}
    	
        $offset = ($page - 1) * $num_row; // Tính toán vị trí bắt đầu của kết quả
        $sql = "select u.avatar_image,u.fullName,c.* from users u join comment_post c on u.userid=c.userid where c.post_id=" . $_GET['postid'] ." order by c.date DESC limit " . $offset . "," . $num_row;
        $result1 = $db->query($sql);
    if ($result1->num_rows > 0) {
        // Tạo một mảng để lưu trữ các bài viết với thông tin món ăn và nhà hàng
        $postsWithDetails = array();
        while ($row = $result1->fetch_assoc()) {
            // Tạo một đối tượng mới để lưu trữ thông tin của mỗi bài viết
            $comment = array(
                "cmt_id" => $row["cmt_id"],
                "userid" => $row["userid"],
                "content" => $row["content"],
                "avatar_image" => $row["avatar_image"],
                "data" => $row["date"],
                "post_id" => $row["post_id"],
                "fullName" => $row["fullName"],
                "rating" => $row["rating"],
                "date" => $row["date"]
            );
            // Thêm bài viết vào mảng
            $commentsWithDetails[] = $comment;
        }
        // Chuyển đổi kết quả thành định dạng JSON
        $response['status']=true;
        $response['data']=$commentsWithDetails;
	$response['message'] = "Get data successfull.";
        $response["pagination"] = $pagination;
        // Trả về JSON như là kết quả của API
       
    } else {
        $response['status'] = false;
        $response['message']= "not comment";
        $response['message'] = 'No results found';
    	$response["pagination"] = $pagination;
    }
    }
}
echo json_encode($response);
$db->close();