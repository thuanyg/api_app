<?php
include('./Connect.php');
include "./header.php";
$db = new Database();
$sql = "SELECT t.*, d.dish_id AS dishID, d.dish_name AS dishName FROM trending t JOIN dish d ON t.dish_id = d.dish_id";
$result = $db->query($sql);
if($result->num_rows > 0){
    $trends = array();
    while ($row = $result->fetch_assoc()) {
        $trend_row = array(
            "id" => $row["id"],
            "dish_name" => $row["dishName"],
            "dish_id" => $row["dishID"],
            "image" => $row["image"],
            "date" => $row["date"]
        );
        $trends[] = $trend_row;
    }
    $response['status'] = true;
    $response['data'] = $trends;
} else {
    $response['status'] = false; 
    $response['message'] = 'No results found'; 
}
echo json_encode($response);
$db->close();