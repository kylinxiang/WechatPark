<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>评价详情</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common2.css" type="text/css">
    <link rel="stylesheet" href="../css/airport-review.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<div id="wrapper" class="wrapper">
    <!--页面头部信息-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>评价详情</h3>
    </div>
    <!--订单列表-->
    <div>
        <ul>
            <li class="details-box">
                <img src="../images/per_icon.png" class="box-photo">
                <div class="box-txt">
                    <div><p class="h3" style="display: inline-block">王龙龙</p><i class="icon-star-4"  style="margin: -4px;"></i></div>
                    <p class="text-nowrap">服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好</p>
                </div>
                <div class="box-time">2015-06.06</div>
            </li>
            <li class="details-box">
                <img src="../images/per_icon.png" class="box-photo">
                <div class="box-txt">
                    <div><p class="h3" style="display: inline-block">王龙龙</p><i class="icon-star-4"  style="margin: -4px;"></i></div>
                    <p class="text-nowrap">服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好</p>
                </div>
                <div class="box-time">2015-06.06</div>
            </li>
            <li class="details-box">
                <img src="../images/per_icon.png" class="box-photo">
                <div class="box-txt">
                    <div><p class="h3" style="display: inline-block">王龙龙</p><i class="icon-star-4"  style="margin: -4px;"></i></div>
                    <p class="text-nowrap">服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好</p>
                </div>
                <div class="box-time">2015-06.06</div>
            </li><li class="details-box">
            <img src="../images/per_icon.png" class="box-photo">
            <div class="box-txt">
                <div><p class="h3" style="display: inline-block">王龙龙</p><i class="icon-star-4"  style="margin: -4px;"></i></div>
                <p class="text-nowrap">服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好</p>
            </div>
            <div class="box-time">2015-06.06</div>
        </li>
            <li class="details-box">
                <img src="../images/per_icon.png" class="box-photo">
                <div class="box-txt">
                    <div><p class="h3" style="display: inline-block">王龙龙</p><i class="icon-star-4"  style="margin: -4px;"></i></div>
                    <p class="text-nowrap">服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好服务好</p>
                </div>
                <div class="box-time">2015-06.06</div>
            </li>


        </ul>
    </div>
</div>
<!--奇偶数换色-->
<script>
    $(function(){
        $("li:odd").css("background-color","#eeeef0");
        $("li:even").css("background-color","#fff");
    })
</script>
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
</body>
</html>