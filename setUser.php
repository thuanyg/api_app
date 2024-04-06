<?php
include("./Connect.php");
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}
$db = new Database();
if(!isset($_REQUEST['userid']) || !isset($_REQUEST['fullName']) || !isset($_REQUEST['password']) || !isset($_REQUEST['avatar_image'])){
    $response['status']=false;
    $response['message']='error';
}else{
    $userid = $_REQUEST['userid'];
    $fullName = $_REQUEST['fullName'];
    $password = $_REQUEST['password'];
    $avatar_image = $_REQUEST['avatar_image'];
    if($userid=='' || $fullName=='' || $password=='' || $avatar_image==''){
        $response['status']=false;
        $response['message']='error';
    }else{
        $sql = "update users set fullName = '".$fullName."', password = '".$password."', avatar_image = '".$avatar_image."' where userid = ".$userid;
        $result = $db->query($sql);
        if($result){
            $response['status']=true;
            $response['data']=array(
                'userid'=>$userid,
                'fullName'=>$fullName,
                'password'=>$password,
                'avatar_image'=>$avatar_image
            );
        }else{
            $response['status']=false;
            $response['message']='error';
        }
        
    }
}
echo json_encode( $response );
$db->close();

?>