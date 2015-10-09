<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>补交停车费</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/pay-momey.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="order-Details.jsp" class="top-bar-rebtn"></a>
    <h3>订单详情</h3>
</div>
<!--页面提示-->
<h3>请输入应补交费用</h3>
<!--补交费用-->
<form>
    <div class="pay-box">
         <div class="box">
            <p>支付金额&nbsp;:&nbsp;<input type="text"class="pay-txt">&nbsp;&nbsp;元</p>
         </div>
        <a href="" class="qr-btn">确认支付</a>
    </div>
</form>
</body>
</html>