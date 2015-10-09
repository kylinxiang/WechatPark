<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>我的收藏</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common2.css" type="text/css">
    <link rel="stylesheet" href="../css/my-collection.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>我的收藏</h3>
    </div>
    <ul>
        <li class="details-box">
            <div class="box-txt">
                <div class="icon-box"><i class="icon-id"></i><i class="icon-place"></i><i class="icon-bus"></i></div>
                <h4 class="font-c">杭州甲虎停车场</h4>
                <div class="size-small" style="margin: 24px auto 0"><i class="icon-star-4"></i>4.2分 基于50条评价</div>
                <p class="border-bottom">停车场地址：杭州滨江区江汉路</p>
                <p>成交量：10</p>
                <p>室内空车位：100/200</p>
                <p class="text-nowrap">收费：1天50，2天80，3天100，4天200</p>
            </div>
            <div class="box-btn">
                <img src="../images/icon-no-photo.png">
                <a class="yd-btn">立即预定</a>
            </div>
        </li>
        <li class="details-box">
            <div class="box-txt">
                <div class="icon-box"><i class="icon-id"></i><i class="icon-place"></i><i class="icon-bus"></i></div>
                <h4 class="font-c">杭州甲虎停车场</h4>
                <div class="size-small" style="margin: 24px auto 0"><i class="icon-star-4"></i>4.2分 基于50条评价</div>
                <p class="border-bottom">停车场地址：杭州滨江区江汉路</p>
                <p>成交量：10</p>
                <p>室内空车位：100/200</p>
                <p class="text-nowrap">收费：1天50，2天80，3天100，4天200</p>
            </div>
            <div class="box-btn">
                <img src="../images/icon-no-photo.png">
                <a class="yd-btn">立即预定</a>
            </div>
        </li>
        <li class="details-box">
            <div class="box-txt">
                <div class="icon-box"><i class="icon-id"></i><i class="icon-place"></i><i class="icon-bus"></i></div>
                <h4 class="font-c">杭州甲虎停车场</h4>
                <div class="size-small" style="margin: 24px auto 0"><i class="icon-star-4"></i>4.2分 基于50条评价</div>
                <p class="border-bottom">停车场地址：杭州滨江区江汉路</p>
                <p>成交量：10</p>
                <p>室内空车位：100/200</p>
                <p class="text-nowrap">收费：1天50，2天80，3天100，4天200</p>
            </div>
            <div class="box-btn">
                <img src="../images/icon-no-photo.png">
                <a class="yd-btn">立即预定</a>
            </div>
        </li>
    </ul>
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