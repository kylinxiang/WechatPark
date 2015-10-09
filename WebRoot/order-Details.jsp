<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>订单详情</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/order-Details.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="order-Confirm.jsp" class="top-bar-rebtn"></a>
    <h3>订单详情</h3>
</div>
<!--订单编号-->
<h3 class="order-tip">订单编号:<span></span></h3>
<!--车场信息-->
<div class="main-box clearfix">
    <div class="box-tip">
        <h3 class="txt font-c9">杭州市万塘路停车场</h3>
        <p class="txt">杭州市西湖区翠苑街道万塘路252号</p>
    </div>
    <div class="btn-box">
        <a href="" class="dh-btn"></a>
        <p>导航前往</p>
    </div>
    <div class="btn-box">
        <a href="" class="lx-btn"></a>
        <p>联系停车场</p>
    </div>
</div>
<!--车场收费-->
<div class="main-box clearfix">
    <div class="box-title">收费：10元/小时</div>
    <div class="box-content">
        <h3>停车时间</h3>
        <p>开始时间:<span>2015-09-02 10:30</span></p>
        <p>结束时间:<span>2015-09-02 12:30</span></p>
    </div>
</div>
<!--停车统计-->
<div class="main-box clearfix">
    <div class="box-content fl">预付金额:<span>30</span>元</div>
    <div class="box-content font-c9" style="clear: both">订单状态:<span>已完成</span></div>
</div>
<!--操作按钮-->
<div class="foot-btn">
    <a href="" class="leave-btn">离场</a>
    <a href="pay-money.jsp" class="pay-btn">补交停车费</a>
</div>
</body>
</html>