<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>个人信息</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/personnal.css" type="text/css">
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>个人信息</h3>
</div>
<div>
    <!--客户头像-->
    <div class="img-center">
        <a><img src="images/per_icon.png"></a>
    </div>
    <!--客户信息-->
    <form class="main">
        <ul>
            <li class="clearfix">
                <label>昵&nbsp;&nbsp;&nbsp;称</label>
                <input type="text" placeholder="12312312312" >
            </li>
            <li class="clearfix">
                <label>性&nbsp;&nbsp;&nbsp;别</label>
                <select>
                    <option>男</option>
                    <option>女</option>
                </select>
            </li>
            <li class="clearfix">
                <label>出生年月</label>
                <select>
                    <option>00后</option>
                    <option>90后</option>
                    <option>80后</option>
                    <option>70后</option>
                    <option>60后</option>
                    <option>50后</option>
                </select>
            </li>
            <li class="clearfix">
                <label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
                <input type="email" placeholder="adasda@145.com">
            </li>
            <li class="clearfix">
                <label>车&nbsp;牌&nbsp;号</label>
                <div>
                    <input type="text" placeholder="浙C.88888">
                </div>
            </li>
        </ul>
    </form>
</div>
<!--退出登录-->
<div class="footer">
    <a href="" class="re-btn">退出登录</a>
</div>
</body>
</html>