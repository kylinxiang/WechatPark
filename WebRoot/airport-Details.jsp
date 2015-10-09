<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>停车场信息</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common2.css" type="text/css">
    <link rel="stylesheet" href="css/new-parkList.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>停车场信息</h3>
        <a href="airport-parklist.jsp" class="login-font">列表</a>
    </div>
    <!--焦点轮播-->
    <div class="main-focus" style="background: #f7f7f7;width:100%;height: 458px;">
    </div>
    <!--车场信息-->
    <div class="main-title bg-w">
        <div class="title-txt">
            <h3 class="font-c">上海双子座停车场</h3>
            <p class="size-small"> <i class="icon-star-4"></i><span>4.5</span>分,<span>400</span>人评价</p>
            <p>上海市浦东新区</p>
            <p>距离机场：3.0公里</p>
            <p class="size-small"><i class="icon-id"></i>身份认证<i class="icon-place"></i>实地认证<i class="icon-bus"></i>执照认证</p>
        </div>
        <div class="btn-box">
            <a class="park-like"><i class="icon-b-love"></i>收藏停车场</a>
            <a class="yd-btn">立即预定</a>
        </div>
    </div>
    <!--价格信息-->
    <div class="main-price bg-w">
        <h4 class="font-c border-bottom">月成交量：200</h4>
        <div class="border-bottom"><span style="margin-right: 140px;">室内9/80</span><span>室外：191/500</span></div>
        <div class="border-bottom">
            <p>
                室内收费：1天30，2天30起...
            </p>
            <p>
                室外收费：1天30，2天30起...
            </p>
        </div>
        <p class="font-c">收费方式：按24小时算</p>
    </div>
    <!--车场服务-->
    <div class="main-service bg-w clearfix border-bottom">
        <div class="service-box border-bottom">
            <h4>服务项目</h4>
            <p>免费接送，24小时监控，专人值守，免费洗车，贵宾休息室</p>
        </div>
        <div class="service-box">
            <h4>服务内容</h4>
            <p>1.距离机场候机楼仅500米</p>
        </div>
        <a href="" class="more-tips">更多<i class="icon-list-down"></i></a>
    </div>
    <!--评价信息-->
    <div class="main-review bg-w">
        <h4>评价50条</h4>
        <div class="review-box">
            <p>王先生<i class="icon-star-4"></i></p>
            <p>停车场的服务态度好，车位数量多。</p>
        </div>
        <a href="" class="more-tips">更多<i class="icon-list-down"></i></a>
    </div>
</div>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
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