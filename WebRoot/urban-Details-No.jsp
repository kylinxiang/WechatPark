<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>停车场预订</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/urban-Details.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--头部信息-->
<div class="top-bar">
    <a href="urban-ParkMap.jsp" class="top-bar-rebtn"></a>
    <h3>停车场详情</h3>
</div>
<div class="main">
    <!--焦点轮播­-->
    <div class="main-focus">
        <div class="slider">
            <ul>
                <li><a href="" target="_blank"><img src="images/1.jpg" alt=""></a></li>
                <li><a href="" target="_blank"><img src="images/2.jpg" alt=""></a></li>
                <li><a href="" target="_blank"><img src="images/3.jpg" alt=""></a></li>
                <li><a href="" target="_blank"><img src="images/4.jpg" alt=""></a></li>
            </ul>
        </div>
        <script type="text/javascript" src="js/yxMobileSlider.js"></script>
        <script>
            $(".slider").yxMobileSlider({width:320,height:200,during:3000})
        </script>
    </div>
    <!--è½¦åºä¿¡æ¯-->
    <div class="main-head bottom-sd " >
        <p class="title">杭州市万塘路停车场<span>4.5分</span><span class="star"></span></p>
        <p>地址：万塘路118号</p>
        <p><i class="icon-id"></i>身份认证<i class="icon-place"></i>实地认证<i class="icon-bus"></i>执照认证</p>
    </div>
    <!--收费信息-->
    <div class="main-detail bottom-sd">
        <p>距离：800米</p>
        <p>收费：30元/3小时,10元/次,每天最高60元</p>
        <p>开放时间：00:00-23:00</p>
    </div>
    <!--车主评价-->
    <div class="main-review bottom-sd">
        <p class="h3">车主评价</p>
        <p class="clearfix"><b>王先生</b><span class="star"></span></p>
        <p><span class="txt text-nowrap">停车服务好停车服务好停车服务好停车服务好停车服务好停车服务好停车服务好停车服务好停车服务好停车服务好</span>
            <span class="more">更多评价</span></p>
    </div>
</div>
<!--操作按钮--->
<div class="main-btn clearfix">
    <div>
        <a class="call-btn"><span></span>联系停车场</a>
        <a class="gh-btn"><span></span>导航前往</a>
    </div>
</div>
</body>
</html>