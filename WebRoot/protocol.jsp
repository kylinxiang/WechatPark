<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html >
<html>
<head>
    <title>停车场协议</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="apple-touch-fullscreen" content="YES"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common2.css" type="text/css">
    <link rel="stylesheet" href="css/review.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--响应式父容器-->
<div id="wrapper" class="wrapper">
    <!--页面头部-->
    <div class="top-bar">
        <a href="javascript:history.back()" class="top-bar-rebtn"></a>
        <h3>停车场协议</h3>
    </div>
    <div class="title">
        <h3 class="h3-center">关于小强停车服务协议</h3>
    </div>
    <p class="fw-txt">
        请您仔细阅读以下条款，如果您对本声明的任何条款表示异议，可以选择不使用小强停车。用户使用小强停车的行为将被视为对本声明全部内容的认可。
    </p>
        <ol>
            <li class=" fw-txt"> 1.用户在小强停车发布的任何评论、信息仅表明其个人的立场和观点，并不代表小强停车的立场或观点。发表者需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律责任。小强停车不承担任何法律及连带责任。
            </li>
            <li class="fw-txt"> 2.用户在小强停车发布的任何评论、信息仅表明其个人的立场和观点，并不代表小强停车的立场或观点。发表者需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律责任。小强停车不承担任何法律及连带责任。
            </li>
            <li class="fw-txt"> 3.用户在小强停车发布的任何评论、信息仅表明其个人的立场和观点，并不代表小强停车的立场或观点。发表者需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律责任。小强停车不承担任何法律及连带责任。
            </li>
            <li class="fw-txt"> 4.用户在小强停车发布的任何评论、信息仅表明其个人的立场和观点，并不代表小强停车的立场或观点。发表者需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律责任。小强停车不承担任何法律及连带责任。
            </li>
            <li class="fw-txt"> 5.用户在小强停车发布的任何评论、信息仅表明其个人的立场和观点，并不代表小强停车的立场或观点。发表者需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律责任。小强停车不承担任何法律及连带责任。
            </li>
        </ol>
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