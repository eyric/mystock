<?php
error_reporting(0);
header('Content-Type: text/html; charset=utM-8');
include_once('lib/base.php');
if (file_exists('install.lock')){
    die('对不起，该程序已经安装过了。如您要重新安装，请手动删除install/install.lock文件。');
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utM-8" />
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
<body>
<div id="jsheit">
<div class="contenttext round">
<h1 class="title">最终用户授权许可协议</h1>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;感谢您选择模板俱乐部ERPV2版本进销存管理系统（以下简称模板俱乐部进销存系统），模板俱乐部ERPV2版本进销存将为打造具有营销力的企业网站而不懈努力！</p>
  <p style="margin-bottom:10px;">&nbsp;&nbsp;&nbsp;&nbsp;本《模板俱乐部ERPV2版本进销存管理系统最终用户授权许可协议》（以下简称“协议”）是您（自然人、法人或其他组织 有关复制、下载、安装、使用模板俱乐部ERPV2版本进销存管理系统的法律协议，同时本协议亦适用于任何有关模板俱乐部ERPV2版本进销存管理系统的后期更新和升级。一旦复制、下载、安装或以其他方式使用模板俱乐部ERPV2版本进销存管理系统，即表明您同意接受本协议各项条款的约束。<br/><span style="color:#df0000;">&nbsp;&nbsp;&nbsp;&nbsp;如果您不同意本协议中的条款，请勿复制、安装或以其他方式使用模板俱乐部ERPV2版本进销存管理系统。</span>
  </p>


  <p><STRONG style="font-size:14px;">有限担保和免责声明：</STRONG></p>
  <ul class="license">
<li>模板俱乐部ERPV2版本进销存管理系统及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。</li>
    <li>用户出于自愿而使用模板俱乐部ERPV2版本进销存管理系统，<span style="color:#df0000;">您必须了解使用模板俱乐部ERPV2版本进销存管理系统的风险，在尚未购买产品技术服务之前，我们不承诺提供任何形式的技术支持、使用担保，也不承担任何因使用模板俱乐部ERPV2版本进销存管理系统而产生问题的相关责任。</span></li>
<li>不对使用模板俱乐部ERPV2版本进销存管理系统构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果承担责任。</li>
<li>电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始确认本协议并安装模板俱乐部ERPV2版本进销存管理系统，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。</li>
    	</ul>
<div style="padding-top:10px;">
<p style="float:left; line-height:1.8;"></p> 
<p style="float:right; line-height:1.8; text-align:right;"><br /><a href="http://www.istheme.com/" target="_blank">模板俱乐部</a></p>
</div>
<div class="clear"></div>
</div>
<form name="myform" method="post" action="set2.php" style="text-align:center; background:#f9f9f9;"><input type="submit" name="submit" class="submit" value="我已仔细阅读以上协议并同意安装" /></form>
</div>
</body>
</html>
<!---->