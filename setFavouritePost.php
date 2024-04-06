<?php
include('./Connect.php');
$db  = new Database();
if (!isset($_REQUEST['userid']) || !isset($_REQUEST['post_id']) || !isset($_REQUEST['date'])) {
    $response['status'] = false;
    $response['message'] = "error data";
} else {
    $userid = $_REQUEST['userid'];
    $post_id = $_REQUEST['post_id'];
    $date = $_REQUEST['date'];
    if($userid=="" || $post_id=="" || $date==""){
        $response['status'] = false;
        $response['message'] = "error data";
    }else{
        // Kiểm tra xem đã tồn tại bản ghi với post_id và userid được truyền vào hay không
        $sql_check = "SELECT * FROM favourite_post WHERE post_id = " . $post_id . " AND userid = " . $userid;
        $result_check = $db->query($sql_check);
        if ($result_check->num_rows > 0) {
            // Nếu đã tồn tại bản ghi, không thực hiện chèn dữ liệu mới
            $response['status'] = false;
            $response['message'] = "Record already exists";
        } else {
            // Nếu không tồn tại bản ghi, thực hiện chèn dữ liệu mới
            $sql_insert = "INSERT INTO favourite_post (post_id, userid, date) VALUES(" . $post_id . "," . $userid . ",'" . $date . "')";
            $result_insert = $db->query($sql_insert);
            if ($result_insert) {
                // Truy vấn dữ liệu sau khi chèn
                $sql_select = "SELECT p.*, d.dish_id as DishId,
                d.dish_name as DishName, 
                d.dish_desc as DishDescription,
                d.dish_image as DishImage,
                r.res_id as RestaurantId,
                r.res_name as RestaurantName,
                r.res_address as RestaurantAddress,
                r.res_image as RestaurantImage,
                fp.favourite_id
                FROM posts p
                JOIN dish d ON p.dish_id = d.dish_id
                JOIN restaurant r ON d.res_id = r.res_id
                JOIN favourite_post fp ON fp.post_id = p.post_id
                WHERE fp.post_id = " . $post_id." AND fp.userid = ".$userid." ORDER BY fp.date DESC";
                $result_select = $db->query($sql_select);
                if ($row = $result_select->fetch_assoc()) {
                    $post = array(
                        "favourite_id"=>$row["favourite_id"],
                        "post_id" => $row["post_id"],
                        "title" => $row["title"],
                        "content" => $row["content"],
                        "thumbnail_image" => $row["thumbnail_image"],
                        "date" => $row["date"],
                        "dish" => array(
                            "dish_id" => $row["DishId"],
                            "dish_name" => $row["DishName"],
                            "dish_desc" => $row["DishDescription"],
                            "dish_image" => $row["DishImage"]
                        ),
                        "Restaurant" => array(
                            "res_id" => $row["RestaurantId"],
                            "res_name" => $row["RestaurantName"],
                            "res_address" => $row["RestaurantAddress"],
                            "res_address" => $row["RestaurantImage"]
                        )
                    );
                }
                $response['status'] = true;
                $response['data'] = $post;
            } else {
                $response['status'] = false;
                $response['message'] = "Failed to insert record";
            }
        }
    }
}
echo json_encode($response);
$db->close();
?>
