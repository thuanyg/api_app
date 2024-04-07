<?php
include('./Connect.php');
include('./header.php');
$db = new Database();
$sql = "SELECT * FROM category_dish";
$result = $db->query($sql);
if($result->num_rows > 0){
    $categories = array();
    while ($row = $result->fetch_assoc()) {
        $category = array(
            "cid" => $row["cid"],
            "cname" => $row["cname"],
            "cimage" => $row["cimage"]
        );
        $categories[] = $category;
    }
    $response['status'] = true;
    $response['data'] = $categories;
} else {
    $response['status'] = false; 
    $response['message'] = 'No results found'; 
}
echo json_encode($response);
$db->close();
?>