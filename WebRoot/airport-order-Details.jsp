<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<h3 class="order-tip">订单编号:<span>00058</span></h3>
<!--车场信息-->
<div class="main-box clearfix">
    <div class="box-tip">
        <h3 class="txt font-c9">上海双子座停车场</h3>
        <p class="txt">杭州市西湖区翠苑街道万塘路252号</p>
    </div>
    <div class="btn-box" style="margin-right: 20px">
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
    <div class="box-day">
        <p>停车天数：2天</p>
    </div>
</div>
<!--停车统计-->
<div class="main-box clearfix">
    <div class="box-content fl">订单金额:<span>50</span>元</div>
    <div class="box-content"style="clear: both">预付金额：0元</div>
    <div class="box-content " style="clear: both">订单状态:<span>未完成</span></div>
</div>
<!--操作按钮-->
<div class="foot-btn">
    <a href="" class="ljqw-btn">立即前往</a>
</div>
</body>
</html>