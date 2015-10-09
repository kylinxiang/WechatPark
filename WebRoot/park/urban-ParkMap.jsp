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
    <link rel="stylesheet" href="../css/urban-ParkMap.css" type="text/css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
</head>
<body>
    <!--页面头部信息-->
    <div class="top-bar">
        <a href="../index.jsp" class="top-bar-rebtn"></a>
        <h3>小强停车</h3>
    </div>
    <!--地点信息搜索-->
    <div class="main-search">
        <div class="search-box">
            <select>
                <option>杭州</option>
                <option>上海</option>
                <option>广州</option>
            </select>
            <div class="search-txt">
                <input id="txt" class="text-nowrap">
                <a class="search-btn"></a>
            </div>
        </div>
        <div class="search-list">
           <ul class="inner clearfix">
               <li class="item">杭州</li>
               <li class="item">上海</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
               <li class="item">杭州</li>
           </ul>
        </div>
    </div>
    <!--百度地图显示-->
    <div id="container" class="main-map"></div>
    <!--地图图标提示-->
    <div class="map-tip">
        <i class="tip-b"></i>
        <label>每次</label>
        <i class="tip-g"></i>
        <label>每小时</label>
    </div>
    <!--地图操作-->
    <div class="map-icon">
        <a class="icon">
            <i class="icon-add"></i>
            <label>添加</label>
        </a>
        <a href="park/parking-Time.jsp" class="icon">
            <i class="icon-time"></i>
            <label>计时</label>
        </a>
    </div>
    <!--停车详情-->
    <div class="map-park-yd "style="display: none">
        <div class="park-box">
            <i class="icon-g-park"></i>
            <div class="box-txt">
                <p>杭州市万塘路停车场</p>
                <p>10元/小时，1000米</p>
                <p>车位状态：可预订</p>
            </div>
           <div class="btn">
               <a href="park/urban-Details.jsp" class="yd-btn">立即预订</a>
               <span>(需支付定金)</span>
           </div>
        </div>
    </div>
    <!--停车详情不可预定-->
    <div  class="map-park-noyd"  >
        <div class="park-box">
            <i class="icon-b-park"></i>
            <a href="park/urban-Details-No.jsp" class="box-txt">
                <p>杭州市万塘路停车场</p>
                <p>10元/小时，1000米</p>
                <p>车位状态：请联系停车场</p>
            </a>

            <div class="btn-box">
                <a href="" class="dh-btn"></a>
                <p>导航前往</p>
            </div>
            <div class="btn-box">
                <a href="" class="lx-btn"></a>
                <p>联系停车场</p>
            </div>
        </div>
    </div>
    <!--引入JQ-->
    <script type="text/javascript" src="../js/jquery.js"></script>
    <!--地图API接入-->
    <script type="text/javascript">
        var map = new BMap.Map("container");
        map.centerAndZoom("杭州滨江",18);
        map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
        map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    </script>
    <!--搜索提示隐藏-->
    <script type="text/javascript">
        $(function() {
            $("#txt").click(function(event) {
                $(".search-list").show();
                event.stopPropagation();
             });
        });
        $(".inner li").click(function() {
            var listText = $(this).html();
            $("#txt").val(listText);
            $(".search-list").hide();
        });
        $("#container").click(function(){
            $(".search-list").hide();
        })
    </script>
</body>
</html>