<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>确认订单</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common2.css" type="text/css">
    <link rel="stylesheet" href="../css/new-parkList.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>确认订单</h3>
        <a href="airport-parklist.jsp" class="login-font">列表</a>
    </div>
    <div class="box box-one" >
        <h3>上海双子座停车场</h3>
        <h4>车位类型</h4>
        <div class="select-box clearfix">
                <div><input type="radio">室内停车</div>
                <div><input type="radio">室外停车</div>
        </div>
    </div>
    <div class="box">
        <i class="icon-right"></i>
        <h4>预约时间</h4>
        <div class="start-time">开始时间：<input type="text" style="width: 370px"></div>
        <div class="end-time">结束时间：<input type="text"style="width: 370px"></div>
        <p class="font-c">预计停车费100元</p>
    </div>
    <div class="box">
        <i class="icon-plate"></i>
        <h4>停泊车辆牌号：</h4>
        <div>返回航班号：<input type="text" style="width: 240px">人数：<input type="text" style="width: 86px"></div>
    </div>
    <div class="box clearfix">
        <i class="icon-cost"></i>
        <h4>支付定金</h4>
        <div><input type="checkbox">预付5元抵10元，最少停2天</div>
        <span class="font-c fr box-momey">金额5元</span>
    </div>
    <a href="" class="qd-btn">确定</a>
</div>
</body>
<script src="../js/jquery-1.8.3.min.js"></script>
<!--<script src="../js/jquery.mobile-1.3.2.min.js"></script>-->
<!--获取实际宽度得到缩放比-->
<script type="text/javascript">
    changeSize = function () {
        var page = $(window);
        window.orientation;
        var phoneWidth = parseInt(page.width());
        var phoneScale = phoneWidth/1080;
        $('#wrapper')[0].style.cssText = '-webkit-transform-origin:0 0;transform-origin:0 0;-webkit-transform:scale(' + phoneScale + ');transform:scale(' + phoneScale + ');';
        /* $('sidebar')[0].style.cssText = '-webkit-transform-origin:0 100%;transform-origin:0 100%;-webkit-transform:scale(' + phoneScale + ');transform:scale(' + phoneScale + ');';*/
    };
    $(function(){
        changeSize();
        window.addEventListener('onorientationchange' in window ? 'orientationchange' : 'resize', changeSize);
    });
</script>
</html>