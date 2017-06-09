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
<script language="javascript" type="text/javascript">
function popupWindow(url) {
	window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=450,height=280,screenX=150,screenY=150,top=150,left=150');
}
function popupWindowLrg(url){
	window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=700,height=500,screenX=50,screenY=50,top=50,left=50');
}
</script>
<!--[if IE 6]>
<script src="js/IE6-png.js" type="text/javascript"></script>
<script type="text/javascript">DD_belatedPNG.fix('.bg,img');</script>
<![endif]-->
<script language="javascript" src="js/install.js"></script>
<script language="javascript" src="js/jQuery1.7.2.js"></script>
</head>
<body>
	<div class="top">
		<div class="topcont">
			<div class="logo">
				<a href="http://www.istheme.com/" target="_blank"><img src="images/logo.png?1" alt="进销存管理系统" /></a>
			</div>
			<div class="headright">进销存管理系统 <font>全新安装</font></div>
			<div class="clear"></div>
		</div>
	</div>
<!---->
	<div class="body">
		<div class="bodycont">
			<div class="bodyleft">
				<ul>
					<li id="license" class="stepnow"><span>1</span> 阅读使用协议</li>
					<li id="inspect" ><span>2</span> 系统环境检测</li>
					<li id="databasesetup"><span>3</span> 数据库用户设置</li>
					<li id="finished"><span>4</span> 安装完成</li>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="bodyright">
				<iframe id="index" src="set1.php" scrolling="no" frameborder="0"></iframe>
			</div>
			<div class="foot">系统采用模板俱乐部ERPV2版本 
			</div>
		</div>
	</div>
</body>
</html>
<!---->