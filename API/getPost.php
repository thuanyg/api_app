<?php
include "./Connect.php";
include "./header.php";
$db = new Database();

$response = array();

if(isset($_GET['postid'])){
    if($_GET['postid'] != ""){
        
        $postid = $_GET['postid'];
        
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
        WHERE post_id = $postid";

        $result = $db->query($sql);
        if ($result->num_rows > 0) {
            $postsWithDetails = array();
            while ($row = $result->fetch_assoc()) {
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
                // Add the post to the array
                $postsWithDetails[] = $post;
            }
            $response['status'] = true; 
            $response['data'] = $postsWithDetails; 
            $response['message'] = "Get data successfully.";
            $response["pagination"] = null;
        }
    }
}

// Return JSON response
echo json_encode($response);
?>
