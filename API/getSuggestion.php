<?php
include("./Connect.php");
include "./header.php";

$response = array();
$db = new Database();
$sql = "SELECT p.title as 'suggest_value' FROM `posts` as p
        UNION SELECT d.dish_name as 'suggest_value' FROM `dish` as d";
$result = $db->query($sql);

if ($result && $result->num_rows > 0) {
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            "suggest_value" => $row['suggest_value']
        );
    }
    $response['status']  = true;
    $response['data'] = $data;
} else {
    $response['status']  = false;
    $response['data'] = null;
}
echo json_encode($response);
$db->close();
?>
