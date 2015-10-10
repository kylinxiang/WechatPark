<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>小强停车</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common1.css" type="text/css">
    <link rel="stylesheet" href="../css/parking-Time.css" type="text/css">
    <link rel="stylesheet" href="../css/TimeCircles.css" type="text/css" >
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部信息-->
    <div class="top-bar">
    <a href="urban-ParkMap.jsp" class="top-bar-rebtn"></a>
    <h3>小强停车</h3>
</div>
<!--计时器-->
    <div class="main clearfix">
            <div id="someTimer3" class="someTimer" style="width: 240px;; margin: 5px auto;"></div>
        <div>
            <p class="time-tip">您从<span>9月2号</span><span>16:00</span>开始计时</p>
            <a class="stop-btn">停止计时</a>
        </div>
    </div>
<!--拍照记录-->
    <div class="main clearfix">
        <div class="photo">
          <div class="box">
              <a class="photo-btn"></a>
              <input class="photo-btn" style="filter:alpha(opacity:0);opacity: 0; z-index: 10;margin-top: -54px " type="file" capture="camera" accept="../image/*" id="cameraInput" name="cameraInput">
              <p>拍照记录车位</p>
          </div>
        </div>
    </div>
<!--计时器插件-->
<script src="../js/TimeCircles.js" type="text/javascript"></script>
<script>
    $(function(){
        $('#someTimer3').TimeCircles({
            time : {
                Days: {
                    show: false,
                    text: "天",
                    color: "#FC6"
                },
                Hours: {
                    show: false,
                    text: "时",
                    color: "#9CF"
                },
                Minutes: {
                    show: false,
                    text: "分",
                    color: "#BFB"
                },
                Seconds: {
                    show: false,
                    text: "秒",
                    color: "#F99"
                }
            },
            refresh_interval: 0.1,
            count_past_zero: true,
            circle_bg_color: "#eee",
            fg_width: 0.05,
            bg_width: 1
        });
    });
</script>
</body>
</html>