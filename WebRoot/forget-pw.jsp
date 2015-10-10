<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>重置登录密码</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>重置登录密码</h3>
    <a href="login.jsp" class="login-font">登录</a>
</div>
<!--信息输入-->
<div class="main main-top32">
    <form>
        <div class="phone-box">
            <input type="text" class="input" style="width: 70%" placeholder="输入手机号码"><a class="yz-btn color-g">验证</a>
        </div>
        <div class="input">
            <span>验证码</span><input type="text">
        </div>
        <div class="input">
            <span>密码</span><input type="text" placeholder="6-10位数字和字符">
        </div>
        <div class="input">
            <span>确认密码</span><input type="text" placeholder="6-10位数字和字符">
        </div>
        <a class="login-btn" style="background: #009fe8">确定</a>
    </form>
</div>
<!--协议信息-->
<div class="foot">
    <form>
        <p class="protocol"><input type="checkbox" style="margin-right: 2px">同意小强停车服务协议</p>
    </form>
</div>
</body>
</html>