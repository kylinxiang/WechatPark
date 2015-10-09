<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>登录</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="park/urban-ParkMap.jsp" class="top-bar-rebtn"></a>
    <h3>登录</h3>
    <a href="register.jsp" class="login-font">注册</a>
</div>
<!--信息录入-->
<div class="main">
    <form action="/ParkWechat/login.do" method="post">
        <div class="input">
            <span class="phone-icon"></span><input type="text" placeholder="手机号" name="username"/>
        </div>
        <div class="input">
            <span class="password-icon"></span><input type="password" placeholder="密码" name="password"/>
        </div>
        <input class="login-btn color-o" type="submit" value="登录" />
    </form>
    <!--信息操作-->
    <div><a href="quick-login.jsp" class="login-phone">手机号快捷登录</a><a href="forget-pw.jsp" class="rem-password">忘记密码？</a></div>
</div>

</body>
</html>
