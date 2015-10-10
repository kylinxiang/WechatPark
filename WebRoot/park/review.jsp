<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>评价停车场</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common2.css" type="text/css">
    <link rel="stylesheet" href="../css/review.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>评价停车场</h3>
        <a href="complaint.html" class="login-font">投诉</a>
    </div>
    <div class="title">
        <i class="icon-b-star"></i>
        <h3 class="h3-left">总体评价</h3>
        <div class="star-box">
          <i class="icon-4-y-star"></i>
          <i class="icon-1-b-star"></i>
        </div>
    </div>
    <form>
        <textarea class="box-txt" placeholder="你对该停车场满意吗？请提出你的意见（限200字）"></textarea>
    </form>
    <div class="btn-box">
        <a class="tj-btn">提交评价</a>
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