<?php
error_reporting(0);
header('Content-Type: text/html; charset=utf-8');
include_once('lib/base.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>进销存管理系统安装</title>
<link rel="stylesheet" type="text/css" href="css/metinfo.css" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript">
<!--
function popupWindow(url) {
  window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=450,height=280,screenX=150,screenY=150,top=150,left=150')
}
function popupWindowLrg(url) {
  window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=700,height=500,screenX=50,screenY=50,top=50,left=50')
}
//-->
</script>
<script language="javascript" src="js/install.js"></script>
<script language="javascript" src="js/jQuery1.7.2.js"></script>
<script language="javascript">
$(window.parent.document).find(".bodyleft li").removeClass('stepnow');
$(window.parent.document).find("#finished").addClass('stepnow');
</script>
<body>
<div id="jsheit">
<div class="contenttext round">
<h1 class="titleok">安装成功！</h1>
<p>欢迎使用模板俱乐部ERPV2版本进销存管理系统能够为您的企业带来工作效率！</p>

<p style="color:#666;">删除/install/目录，以防止再次安装而覆盖数据。</p>
<div style="margin-top:5px;">
<a class="getweburl" href="../index.php/login" target="_parent">登陆系统</a>
</div>
</div>
</div>
</body>
</html>
