<?php if(!defined('BASEPATH')) exit('No direct script access allowed');?>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>库存管理系统！</title>
        <meta name="globalsign-domain-verification" content="wnLJy1jTEsQbKd3ZepUI9lK4R1lnQif9O4mKSlu1rX">
        <meta name="viewport" content="width=device-width,initial-scale=0.4; maximum-scale=3.0;minimum-scale:0.5;user-scalable=yes;">

        <script src="<?php echo base_url()?>statics/login/Css/jquery-1.7.1.js"></script>

    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>statics/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>statics/common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>statics/common/global.css" media="all">
    <style type="text/css">
        body{background: url(<?php echo base_url()?>statics/common/images/rebc.gif);}
        .footer-wrap {margin-top: 0px;}
        .login{min-height: 650px;}
        .login {height: 600px;position: relative;margin-top: 100px;}
        .login .login-warp{width: 420px;background: #fff;border: 1px solid #eaeaea; position: absolute;left: 50%;top: 0;margin-left: -211px;padding: 30px;}
        .login .login-logo{text-align: center;}
        .login .login-warp .head{font-size: 18px;color: #B2B2B2;position: relative;}
        .login .login-warp .head .cat{position: absolute;right:0;top: -15px;}
        .login .login-warp .head .cat img{max-width: 50px;max-height: 66px;}
        .login .login-warp .head .error{position: absolute;left:0;top:0;border: 1px solid #CC6633;font-size: 14px;line-height: 36px;padding: 0 15px;background: #F5F5F5;color: #787878;}
        .login .login-warp .head .error .layui-icon{position: relative;top: 2px;margin-right: 6px;}
        .login .login-warp .body{margin: 30px 0;}
        .login .login-warp .layui-form-item{position: relative;}
        .login .login-warp .layui-form-item .layui-form-label{width: 24px;padding: 8px;position: absolute;left: 1px;top: 1px;z-index: 10;height: 24px;}
        .login .login-warp .layui-form-item .layui-form-label .layui-icon{font-size: 24px;color: #ccc;position: relative;top: 2px;}
        .login .login-warp .layui-form-item .layui-input-block{margin-left: 0;}
        .login .login-warp .layui-form-item .layui-input{padding-left: 50px;height: 42px;line-height: 42px;}
        .login .login-warp .layui-form-item .layui-input.ng-dirty.ng-invalid{border-color:#FF6666!important; }
        .login .login-warp .layui-form-item .layui-input.code{width: 258px;display: inline-block;}
        .login .login-warp .layui-form-item .code-check img{height: 40px;width: 100px;border: 1px solid #e6e6e6;cursor: pointer;}
        .login .login-warp .layui-form-item.save .layui-input-block{line-height: 30px;color: #999;height: 42px;}
        .login .login-warp .layui-form-item.save .layui-input-block input{position: relative;top: 2px;}
        .login .login-warp .layui-form-item .layui-btn{display: block;font-size: 18px;width: 100%;}
        .login .login-warp .foot{text-align: right;}
        .login .login-warp .foot a{margin-left: 10px;color: #878787;}
        .layui-form-checked, .layui-form-checked:hover{border-color:#2dacf1;}
        .layui-form-checked span, .layui-form-checked:hover span{background-color:#2dacf1;}
        .layui-form-checked i, .layui-form-checked:hover i{color:#2dacf1;}
        .layui-btn{margin-top:30px;}
        .layui-tab-title{border-bottom: 1px solid #2dacf1;}
        .losspass{font-size: 12px;color: #999;}
    </style>
    </head>
<body>
<section class="layui-larry-box">
    <div class="login">
        <div class="login-logo">
        </div>
        <div class="login-warp">
            <div class="head">
                <span>用户登录</span>
                <div class="cat">
                </div>
            </div>
            <div class="body">
                <div style="color: red;" align="center" class="prompt">
                    <span id="promptContent"></span>
                </div>
                <form class="layui-form" id="loginForm" method="post" action="<?php echo site_url('login');?>" name="main_login" onSubmit="return check_main_login()" >

                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont icon-jiaoseguanli"></i></label>
                        <div class="layui-input-block">
                            <input type="text"  name="username" id="loginUsername" lay-verify="user"
                                   placeholder="请输入手机号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><i class="iconfont icon-jiaoseguanli1"></i></label>
                        <div class="layui-input-block">
                            <input type="password" name="userpwd" id="loginPassword" lay-verify="pass"
                                   placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1" type="submit">登 陆</button>
                    </div>
                </form>


            </div>
            <div class="foot">
                <a href="javascript:">忘记密码</a>
            </div>
        </div>
    </div>

</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery','layer','element','form'],function(){
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        window.form = layui.form();
        var element = layui.element();

        form.verify({
            user : function(value) {
                value = value.replace(/\s+/g, "");
                if (value == null || value == "") {
                    return '用户名不允许为空哟!';
                }
                if (value.indexOf("'") != -1) {
                    return '用户名不允许输入特殊符号哟!';
                }
            },
            pass : function(password) {
                password = password.replace(/\s+/g, "");
                if (password == null || password == "") {
                    return '密码不允许为空哟!';
                }
                if (password.indexOf("'") != -1) {
                    return '密码不允许输入特殊符号哟!';
                }
            }
        });

    });
</script>
</body>