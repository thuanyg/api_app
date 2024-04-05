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
        $sql = "insert into favourite_post (post_id,userid,date) values(" . $post_id . "," . $userid . ",'" . $date . "')";
        $result = $db->query($sql);
        if ($result) {
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
            where p.post_id = " . $post_id;
            $result1 = $db->query($sql);
            if ($row = $result1->fetch_assoc()) {
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
            }
            $response['status'] = true;
            $response['data'] = $post;
        } else {
            $response['status'] = false;
            $response['message'] = "error data";
        }
    }
    
}
echo json_encode($response);
$db->close();
