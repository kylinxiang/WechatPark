<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
    <title>登录</title>
</head>
<body>
	<div class="top-bar">
		<a href="index.jsp" class="top-bar-rebtn"></a>
        <h3>会员登录</h3>
    </div>
	<form action="/WechatPark/login.do" method="post">  
            <span class = "name">帐号：</span><input autofocus required  tabindex="1" class="login" id="username" type="text" value="" placeholder="请用手机号登录" name="username"/><br/>  
            <span class = "name">密码：</span><input required  tabindex="2" class="login" id="password" type="password" placeholder="6-20位字母、数字和符号" name="password"/><br/>  
       <input type="submit" value="登录" />            
    </form> 

</body>
</html>