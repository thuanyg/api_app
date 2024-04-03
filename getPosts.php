<?php
include "./Connect.php";
$db = new Database();
$num_row = 10;
$sql = "SELECT p.*, d.Id as DishId, d.Name as DishName, d.Description as DishDescription, d.Image as DishImage, r.Id as RestaurantId, r.Name as RestaurantName, r.Address as RestaurantAddress, r.Image as RestaurantImage
        FROM posts p
        JOIN dish d ON p.DishId = d.Id
        JOIN restaurant r ON d.resID = r.Id
        order by p.Time DESC";

$result = $db->Query($sql);

if ($result->num_rows == 0) {
    echo "0 results";
} else {
    $num_of_page = ceil($result->num_rows / $num_row); // Số trang cần thiết
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

    $sql = "SELECT p.*, d.Id as DishId,
d.Name as DishName, 
d.Description as DishDescription,
d.Image as DishImage,
r.Id as RestaurantId,
r.Name as RestaurantName,
r.Address as RestaurantAddress,
r.Image as RestaurantImage
FROM posts p 
JOIN dish d ON p.DishId = d.Id 
JOIN restaurant r ON d.resID = r.Id 
order by p.Time DESC
LIMIT " . $offset . "," . $num_row ;

    $result1 = $db->Query($sql);
    if ($result1->num_rows > 0) {
        // Tạo một mảng để lưu trữ các bài viết với thông tin món ăn và nhà hàng
        $postsWithDetails = array();
        while ($row = $result1->fetch_assoc()) {
            // Tạo một đối tượng mới để lưu trữ thông tin của mỗi bài viết
            $post = array(
                "Id" => $row["Id"],
                "UserId" => $row["UserId"],
                "Content" => $row["Content"],
                "Image" => $row["Image"],
                "Time" => $row["Time"],
                "Dish" => array(
                    "Id" => $row["DishId"],
                    "Name" => $row["DishName"],
                    "Description" => $row["DishDescription"],
                    "Image" => $row["DishImage"]
                ),
                "Restaurant" => array(
                    "Id" => $row["RestaurantId"],
                    "Name" => $row["RestaurantName"],
                    "Address" => $row["RestaurantAddress"],
                    "Image" => $row["RestaurantImage"]
                )
            );
            // Thêm bài viết vào mảng
            $postsWithDetails[] = $post;
        }
        // Chuyển đổi kết quả thành định dạng JSON
        $response = json_encode($postsWithDetails);

        // Trả về JSON như là kết quả của API
        header('Content-Type: application/json');
        echo $response;
    } else {
        echo "0 results";
    }
}

$db->closeConnect();
