<?php
error_reporting(0);
header('Content-Type: text/html; charset=utf-8');
include_once('lib/base.php');
if(isset($_GET['act'])=='install'){
	install();
}
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
<script type="text/javascript">
function ifreme_methei(){
	var l = $("#jsheit").height()+10;
	$(window.parent.document).find("#index").height(l);
}
function metfocus(intext){
        intext.focus(function(){
		    $(this).addClass('metfocus');
		});
        intext.focusout(function(){
		    $(this).removeClass('metfocus');
		});
}
$(document).ready(function(){
	var inputps = $("input[type='text'],input[type='password']");
		if(inputps)metfocus(inputps);
		ifreme_methei();
});
</script>
</head>
<!---->
<script language="javascript">
parent.document.getElementById("license").className='stepnowno';
parent.document.getElementById("inspect").className='stepnowno';
parent.document.getElementById("databasesetup").className='stepnow';
</script>
<body>
<div id="jsheit">
<div class="contenttext databasesetup round">
<p style="font-size:14px;">检查您的数据库设置情况，请在相应栏目仔细输入配置内容。</p>
    <form method="post" action="set3.php?act=install">
	  <fieldset style="padding-bottom:0px;">
	  <legend><strong>数据库信息</strong></legend>
		
        <div class="section1">
		  <p>数据库主机</p>
		  <input type="text" class="text" name="dbhost" value="localhost" size="18" />
		  <span>数据库主机地址，一般不需要更改</span>
		</div>
		<div class="section1">
		  <p>数据库名 </p>
		 <input type="text" name="dbname" class="text" size="18" />
		  <span>例如'met'或'my_met',请确保用字母开头</span>
		</div>
		<div class="section1">
		  <p>数据库用户名</p>
		  <input type="text" class="text" name="dbuser" value="root" size="18" />
		</div>
		<div class="section1" style="margin-bottom:0px;">
		  <p>数据库密码</p>
		  <input type="password" class="text" name="dbpwd" />
		</div>
		<div class="section1" style="margin-bottom:0px;">
		  
		</div>
		<div style="padding:8px 0px 8px 80px;">
		     <span style="color:#FF0000">系统默认登陆账号:admin  密码:istheme.com   登陆系统后您可以自行改密码 </span>
		</div>
		
		<div class="section1">
		  <p>登陆用户</p>
		  <input type="text" class="text"  readonly="" value="admin" size="18" />
		</div>
		<div class="section1" style="margin-bottom:0px;">
		  <p>登陆密码</p>
		  <input type="text" class="text" readonly="" value="istheme.com" />
		</div>
      </fieldset>
	  
	  <div style="text-align:center; margin-top:5px;">
	  <input type="submit" name="submit" class="submit" tabindex="15" value="保存数据库设置并继续" />
	 </div>
    </form>
</div>
</div>
</body>
</html>
<!---->