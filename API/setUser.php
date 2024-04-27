<?php
include("./Connect.php");
include("./header.php");
$db = new Database();
$response = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userid = isset($_POST['userid']) ? $_POST['userid'] : null;
    $fullName = isset($_POST['fullName']) ? $_POST['fullName'] : null;

    if (!empty($userid) && !empty($fullName) && isset($_FILES['avatar_image'])) {
        // Handle image upload
        if ($_FILES['avatar_image']['size'] > 0 && $_FILES['avatar_image']['error'] === UPLOAD_ERR_OK) {
            $name = $_FILES['avatar_image']['name'];
            $temp = $_FILES['avatar_image']['tmp_name'];

            $target_dir = "../images/users/";
            $finalImage = $target_dir . basename($name);

            if (move_uploaded_file($temp, $finalImage)) {
                $image = "https://htthuan.id.vn/images/users/" . basename($name); // Update the image path if uploaded successfully
            } else {
                $response['status'] = false;
                $response['message'] = 'Failed to move uploaded file.';
                echo json_encode($response);
                exit;
            }
        }

        // Update user information
        $sql = "UPDATE users SET fullName = '".$fullName."'";
        if (isset($image)) {
            $sql .= ", avatar_image = '".$image."'";
        }
        $sql .= " WHERE userid = ".$userid;
        $result = $db->query($sql);

        if ($result) {
            $response['status'] = true;
            $response['data'] = array(
                'userid' => $userid,
                'fullName' => $fullName,
                'avatar_image' => isset($image) ? $image : null
            );
        } else {
            $response['status'] = false;
            $response['message'] = 'Failed to update user information.';
        }
    } else {
        $response['status'] = false;
        $response['message'] = 'Missing required parameters.';
    }
} else {
    $response['status'] = false;
    $response['message'] = 'Invalid request method.';
}

echo json_encode($response);
$db->close();
?>
