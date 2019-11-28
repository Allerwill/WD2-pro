<?php
include("class.phpmailer.php");
include("class.smtp.php");
$mail = new PHPMailer();
$body = '<strong>Xác nhận phản hồi</strong><br />';
$body .= '<strong>Họ tên: </strong>' . @$_POST['name'] . ' <br />';
$body .= '<strong>Email: </strong>' . @$_POST['mail'] . ' <br />';
$body .= '<strong>Tiêu đề: </strong>' . @$_POST['title'] . ' <br />';
$body .= '<strong>Nội dung: </strong>' . @$_POST['content'] . ' <br />';
$body = @eregi_replace("[\]", '', $body);
$mail->IsSMTP();
$mail->SMTPAuth = true; 
$mail->SMTPSecure = "ssl"; 
$mail->Host = "smtp.gmail.com";  
$mail->Port = 465;  
$mail->Username = "allerwill.lee@gmail.com";
$mail->Password = "12345678@X";
$mail->From = "allerwill.lee@gmail.com";
$mail->FromName = "Confirm infor";
$mail->Subject = "Confirm infor";
$mail->AltBody = "Confirm infor";
$mail->WordWrap = 50;
$mail->MsgHTML($body);
$mail->AddAddress(@$_POST['mail'], @$_POST['name']);
$mail->AddReplyTo("allerwill.lee@gmail.com", "Reply");
$mail->IsHTML(true);
if (!$mail->Send()) {
    header("Location: " . $_POST['url']);
} else {
    header("Location: " . $_POST['url']);
}
