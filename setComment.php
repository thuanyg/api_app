<?php
include('./Connect.php');
include "./header.php";
$db  = new Database();
if(!isset($_REQUEST['userid']) || !isset($_REQUEST['content']) || !isset($_REQUEST['post_id'])){
    $response['status'] = false;
    $response['message']= "error data";
}else{
    $userid = $_REQUEST['userid'];
    $post_id = $_REQUEST['post_id'];
    $content = $_REQUEST['content'];
    $date =  date("Y-m-d H:i:s");
    if($userid=="" || $post_id=="" || $content==""){
        $response['status'] = false;
        $response['message']= "error data";
    }else{
        $sql = "insert into comment_post (userid,post_id,content,date) values(".$userid.",".$post_id.",'".$content."','".$date."')";
        $result = $db->query($sql);
        if($result){
            $sql = "select u.fullName,u.avatar_image from users u where userid = ".$userid;
            $result1 = $db->query($sql);
            if($row = $result1->fetch_assoc()){
                $comment = array(
                'userid' => $userid,
                'fullName' => $row['fullName'],
                'content' => $content,
                'post_id' => $post_id,
                'avatar_image' => $row['avatar_image']
                );
            }
        
        }
        $response['status'] = true;
        $response['data'] = $comment;
    }
    
}
echo json_encode($response);
$db->close();
?>