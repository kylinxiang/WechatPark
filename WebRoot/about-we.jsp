<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
    
<!DOCTYPE html >
<html>
<head>
    <title>关于我们</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common2.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
 <style>
     .h3{
         width: 998px;
         margin: 40px auto 32px;
         font-size: 3rem;
         color: #606060;
         text-align: center;
     }
     p{
         width: 998px;
         margin: 32px auto;
         font-size: 3rem;
         color: #606060;
         text-indent: 70px;
     }
 </style>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>关于我们</h3>
    </div>
    <h3 class="h3">杭州甲虎科技有限公司介绍</h3>
    <p>杭州甲虎科技有限公司，移动互联网时代的新锐力量。我们致力于用最经济、最有效的方式解决城市的“停车难”问题，以革命式思维、颠覆性的营运模式让城市生活更有序、更环保、更有效率！</p>
    <p>“小强停车”是公司旗下专注解决“停车难”问题的移动互联网平台，我们帮助车主通过小强停车平台提前向停车场预订车位，让停车更简单、出行更轻松！</p>
    <p>公司由多位知名企业高管、海归共同创建，组建了一支充满理想、激情澎拜、极具执行力的创始团队，我们致力于将“小强停车”打造成为中国最大的“车位预订平台”，真正解决阻碍城市发展的“停车难”问题。</p>
    <p>刘永强：公司联合创始人、CEO，历任阿里巴巴（B2B）高级策划经理、IBM（智慧物流项目）首席市场官、杭州汇铭源商务咨询有限公司总经理，是互联网领域的营运管理专家，15年以上工作经验。</p>
    <p>张颖：公司联合创始人、首席产品官，有超过10年的海外工作经验，担任过多家日本科技公司的产品及技术负责人，曾任职阿里巴巴（B2B）高级产品总监，具有开放的国际化视野和全新的互联网思维模式。</p>
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