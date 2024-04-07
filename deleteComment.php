<?php
include('./Connect.php');
include "./header.php";
$db = new Database();
if(!isset($_REQUEST['cmt_id'])){
    $response['status']=false;
    $response['message']='error data';
}else{
    $cmt_id = $_REQUEST['cmt_id'];
    if(empty($cmt_id)){
        $response['status']=false;
        $response['message']='error data null';
    }else{
        // Kiểm tra xem cmt_id có tồn tại trong cơ sở dữ liệu không
        $sql_check = "SELECT * FROM comment_post WHERE cmt_id = ".$cmt_id;
        $result_check = $db->query($sql_check);
        if($result_check->num_rows == 0){
            $response['status']=false;
            $response['message']='cmt_id not found';
        }else{
            // Nếu cmt_id tồn tại, thực hiện xóa
            $sql = "DELETE FROM comment_post WHERE cmt_id = ".$cmt_id;
            $result = $db->query($sql);
            if(!$result){
                $response['status']=false;
                $response['message']='cannot delete ';
            }else{
                $response['status']=true;
                $response['data']=array(
                    'cmt_id'=>$cmt_id,
                );
            }
        }
    }
}
echo json_encode($response);  //
$db->close();
?>
