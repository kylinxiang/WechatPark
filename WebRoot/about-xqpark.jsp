<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>关于小强</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body style="background: #f7f7f7">
<!--页面头部信息-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>关于小强</h3>
</div>
<!--选择列表-->
<div>
    <ul>
        <li class="about-box">
            <i class="icon  icon-bg-we"></i>
            <p>关于我们</p>
            <a href="" class="about-box-rebtn"></a>
        </li>
        <li class="about-box">
            <i class="icon  icon-bg-pw"></i>
            <p>修改密码</p>
            <a href="" class="about-box-rebtn"></a>
        </li>
        <li class="about-box">
            <i class="icon  icon-bg-fb"></i>
            <p>提交反馈</p>
            <a href="" class="about-box-rebtn"></a>
        </li>
        <li class="about-box">
            <i class="icon  icon-bg-hp"></i>
            <p>用户帮助</p>
            <a href="" class="about-box-rebtn"></a>
        </li>
        <li class="about-box">
            <i class="icon  icon-bg-map"></i>
            <p>离线地图</p>
            <a href="" class="about-box-rebtn"></a>
        </li>
    </ul>
</div>
<!--版本信息-->
<div class="version-box">
    <form>
        <p class="tips">版本号：<span>0.15.01</span></p>
    </form>
</div>
<!--奇偶数换色-->
<script>
    $(function(){
        $("li:odd").css("background-color","#eeeef0");
        $("li:even").css("background-color","#fff");
    })
</script>
</body>
</html>