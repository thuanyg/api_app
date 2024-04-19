<?php
include "./Connect.php";
include "./header.php";
$db = new Database();
$num_row = 10; // Số bài viết trên mỗi trang

if (isset($_GET["keyword"])) {
    $keyword = $_GET['keyword'];

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
    WHERE d.Name LIKE '%" . $keyword;
    $result = $db->Query($sql);
    if ($result->num_rows == 0) {
        $response['status'] = false;
        $response['message'] = "not found";
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
        $pagination = array(
            "currentPage" => intval($page),
            "totalPage" =>  intval($num_of_page),
            "totalItem" => intval($total_records)
        );

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
     WHERE d.Name LIKE '%" . $keyword . "%'" . " 
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
                    "order_grab" => $row["order_grab"],
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
                        "res_image" => $row["RestaurantImage"]
                    )
                );
                // Chuyển đổi kết quả thành định dạng JSON
                $postsWithDetails[] = $post;
            }
            $response['status'] = true;
            $response['data'] = $postsWithDetails;
            $response['message'] = "Get data successfull.";
            $response["pagination"] = $pagination;
        } 
    }
}

echo json_encode($response);
$db->close(); // Thêm dòng này để đóng kết nối với cơ sở dữ liệu
?>
