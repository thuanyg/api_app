<?php
include('./Connect.php');
include "./header.php";
$db = new Database();
$sql = "SELECT * FROM sliders";
$result = $db->query($sql);
if($result->num_rows > 0){
    $sliders = array();
    while ($row = $result->fetch_assoc()) {
        $slider_row = array(
            "id" => $row["sid"],
            "name" => $row["sname"],
            "image" => $row["simage"],
            "link" => $row["slink"],
            "date" => $row["sdate"]
        );
        $sliders[] = $slider_row;
    }
    $response['status'] = true;
    $response['data'] = $sliders;
} else {
    $response['status'] = false; 
    $response['message'] = 'No results found'; 
}
echo json_encode($response);
$db->close();