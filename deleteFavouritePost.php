<?php
include('./Connect.php');
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}
$db = new Database();
if(!isset($_REQUEST['favourite_id'])){
    $response['status']=false;
    $response['message']='error data';
}else{
    $favourite_id = $_REQUEST['favourite_id'];
    if(empty($favourite_id)){
        $response['status']=false;
        $response['message']='error data null';
    }else{
        // Kiểm tra xem cmt_id có tồn tại trong cơ sở dữ liệu không
        $sql_check = "SELECT * FROM favourite_post WHERE favourite_id = ".$favourite_id;
        $result_check = $db->query($sql_check);
        if($result_check->num_rows == 0){
            $response['status']=false;
            $response['message']='favourite_id not found';
        }else{
            // Nếu cmt_id tồn tại, thực hiện xóa
            $sql = "DELETE FROM favourite_post WHERE favourite_id = ".$favourite_id;
            $result = $db->query($sql);
            if(!$result){
                $response['status']=false;
                $response['message']='cannot delete';
            }else{
                $response['status']=true;
                $response['data']=array(
                    'favourite_id'=>$favourite_id,
                );
            }
        }
    }
}
echo json_encode($response);  //
$db->close();
?>
