<?php
include "./Connect.php";
include "./header.php";
$db = new Database();
$num_row = 10; // Số bài viết trên mỗi trang

if (isset($_REQUEST["categoryid"])) {
    $categoryId = $_REQUEST['categoryid'];
    if ($categoryId == "") {
        $response['status'] = false; // Đánh dấu trạng thái lỗi
        $response['message'] = 'No results found'; // Thêm thông điệp lỗi
    } else {
        $sql = "SELECT COUNT(*) as 'total' FROM posts p
        JOIN dish d ON p.dish_id = d.dish_id
        where d.cid = " . $categoryId;

        $result = $db->Query($sql);
        if ($result->num_rows == 0) {
            $response['status'] = false; // Đánh dấu trạng thái lỗi
            $response['message'] = 'No results found'; // Thêm thông điệp lỗi
        } else {
            $total_records = 0;
            $r = $result->fetch_assoc();
            $total_records = $r["total"];

            $num_of_page = ceil($total_records / $num_row); // Số trang cần thiết
            if (!isset($_REQUEST['page'])) {
                $page = 1;
            } else {
                $page = $_REQUEST['page'];
            }
            if ($page < 1) {
                $page = 1;
            }
            if ($page > $num_of_page) {
                $page = $num_of_page;
            }
            $offset = ($page - 1) * $num_row; // Tính toán vị trí bắt đầu của kết quả

            $sql = "SELECT p.*, d.dish_id as DishId,
            d.dish_name as DishName, 
            d.dish_desc as DishDescription,
            d.dish_image as DishImage,
            r.res_id as RestaurantId,
            r.res_name as RestaurantName,
            r.res_address as RestaurantAddress,
            r.res_image as RestaurantImage
            FROM posts p
            JOIN dish d ON p.dish_id = d.dish_id
            JOIN restaurant r ON d.res_id = r.res_id 
            where d.cid = " . $categoryId . " 
            ORDER BY p.date DESC
            LIMIT " . $offset . "," . $num_row;

            $result1 = $db->Query($sql);
            if ($result1->num_rows > 0) {
                // Tạo một mảng để lưu trữ các bài viết với thông tin món ăn và nhà hàng
                $postsWithDetails = array();
                while ($row = $result1->fetch_assoc()) {
                    // Tạo một đối tượng mới để lưu trữ thông tin của mỗi bài viết
                    $post = array(
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
                    // Thêm bài viết vào mảng
                    $postsWithDetails[] = $post;
                }
                // Chuyển đổi kết quả thành định dạng JSON
                $response['status'] = true;
                $response['data'] = $postsWithDetails;

                // Trả về JSON như là kết quả của API

            }
        }
    }
} else {
    $response['status'] = false; // Đánh dấu trạng thái lỗi
    $response['message'] = 'No results found'; // Thêm thông điệp lỗi
}
echo json_encode($response);
$db->close();
