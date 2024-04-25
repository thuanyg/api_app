<?php
include("./Connect.php");
include "./header.php";
$db = new Database();
if(!isset($_GET['userid']) || !isset($_GET['fullName']) || !isset($_GET['password']) || !isset($_FILES['avatar_image'])){
    $response['status']=false;
    $response['message']='error';
}else{
    $userid = $_GET['userid'];
    $fullName = $_GET['fullName'];
    $password = $_GET['password'];
    $avatar_image = $_GET['existingImage'];
    if (isset($_FILES['avatar_image']) && $_FILES['avatar_image']['size'] > 0 ) {
        $name = $_FILES['avatar_image']['name'];
        $temp = $_FILES['avatar_image']['tmp_name'];

        $location="https://htthuan.id.vn/images/users/";
        $image=$location.$name;
        move_uploaded_file($temp,$location.$name);
    }
    else{
        $image=$_POST['existingImage'];
    }
        $sql = "update users set fullName = '".$fullName."', password = '".$password."', avatar_image = '".$image."' where userid = ".$userid;
        $result = $db->query($sql);
        if($result){
            $response['status']=true;
            $response['data']=array(
                'userid'=>$userid,
                'fullName'=>$fullName,
                'password'=>$password,
                'avatar_image'=>$image
            );
        }else{
            $response['status']=false;
            $response['message']='error';
        }
    }
echo json_encode( $response );
$db->close();

?>
