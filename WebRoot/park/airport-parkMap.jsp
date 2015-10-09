<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>地图</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common2.css" type="text/css">
    <link rel="stylesheet" href="../css/airport-parkMap.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>地图</h3>
        <a href="park/airport-parklist.jsp" class="login-font">列表</a>
    </div>
    <!--地图API-->
    <div class="map">
    </div>
    <!--车场信息标签-->
    <div class="park-box">
        <div class="box-txt">
            <h4>上海双子座停车场</h4>
            <p>距离机场：30公里</p>
            <p>月成交量：80</p>
            <p>室内空车位：50/70</p>
            <p>室外空车位：30/70</p>
            <p class="small-font"><i class="icon-star-4"></i>4.2分 120人评价</p>
        </div>
        <div class="box-icon">
            <p><i class="icon-id"></i><i class="icon-place"></i><i class="icon-bus"></i></p>
        </div>
        <div class="box-btn">
            <img src="../images/icon-no-photo.png">
            <a  href="paark/airport-Details.jsp" class="yd-btn">立即预约</a>
        </div>
    </div>
</div>
</body>
<script src="../js/jquery-1.8.3.min.js"></script>
<!--<script src="js/jquery.mobile-1.3.2.min.js"></script>-->
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