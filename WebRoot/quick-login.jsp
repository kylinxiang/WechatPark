<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>快捷登录</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>快捷登录</h3>
    <a href="login.html" class="login-font">登录</a>
</div>
<!--信息录入-->
<div class="main">
    <form>
        <div class="input">
            <span class="phone-icon"></span><input type="text" placeholder="手机号">
        </div>
        <div class="input">
            <span class="pin-icon" ></span><input type="text" placeholder="验证码">
        </div>
        <a class="login-btn color-g">登录</a>
    </form>
</div>
</body>
</html>