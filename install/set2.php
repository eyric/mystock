<?php
error_reporting(0);
header('Content-Type: text/html; charset=utf-8');
include_once('lib/base.php');
$array1 = array('../data/cache/','../data/upfile/','../data/logs/','../data/config/');
$array2 = array('mysql_connect','fsockopen','gethostbyname','file_get_contents','xml_parser_create','mb_strlen','curl_exec');
if(file_exists('install.lock')){
    die('对不起，该程序已经安装过了。如您要重新安装，请手动删除install/install.lock文件。');
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
$(window.parent.document).find(".bodyleft li").removeClass('stepnow');
$(window.parent.document).find("#inspect").addClass('stepnow');
</script>
<body>
<div id="jsheit">
<form method="post" action="set3.php">
<div class="contenttext round">
<p style="font-size:14px;">检查您的服务器是否支持安装模板俱乐部ERPV2版本进销存管理系统，请在继续安装前消除错误或警告信息。</p>
	<fieldset>
		<legend><strong>环境检测结果</strong></legend>
		<div class="section">
			<ul class="inspect-list aownbwef">
				<li class='OK'><span>PHP版本</span> <?php echo $_SERVER['SERVER_SOFTWARE'];?> </li>
<!---->	
				
		</ul>
		</div>
	</fieldset>

<fieldset>
<legend><strong>函数与目录权限</strong></legend>
<div class='section'>&nbsp;&nbsp;&nbsp;&nbsp;要能正常使用本网站管理系统，
需要将几个文件/目录设置为 "可写"。下面是需要设置为"可写" 的目录清单， 
以及建议的 CHMOD 设置。<br/>
某些主机不允许您设置 CHMOD 777，要用666。先试最高的值，不行的话，再逐步降低该值。
<ul class="inspect-list auwgph">
<!---->
   <?php foreach($array1 as $w){?> 
   <li class='<?php echo is_writable($w) ? 'OK' : 'WARN'?>'>
   <span><?php echo $w;?></span>
   </li>
   <!---->
   <?php }?>
   <?php foreach($array2 as $w){?>
   <!---->
   <li class='<?php echo function_exists($w) ? 'OK' : 'WARN'?>'>
   <span><?php echo $w;?></span>
   </li>
   <?php }?>
   <!---->
   

</ul>
<div class="clear"></div>
</div>
</fieldset>
</div>
<div style=" text-align:center; ">
<input type="button" name="refresh" class="submit" tabindex="11" value="重新检查" onClick="history.go(0)" />
<input type="submit" name="submit" class="submit" style="margin-right:5px;" value="下一步"  />
</div>
</form>
</div>
</body>
</html>
<!---->
