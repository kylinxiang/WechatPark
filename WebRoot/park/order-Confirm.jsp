<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>订单确认</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common1.css" type="text/css">
    <link rel="stylesheet" href="../css/order-Confirm.css" type="text/css">
    
    <!--日期插件-->
	<script src="../dev/js/mobiscroll.core-2.5.2.js" type="text/javascript"></script>
	<script src="../dev/js/mobiscroll.core-2.5.2-zh.js" type="text/javascript"></script>
	<script src="../dev/js/mobiscroll.datetime-2.5.1.js" type="text/javascript"></script>
	<script src="../dev/js/mobiscroll.datetime-2.5.1-zh.js" type="text/javascript"></script>
	<script src="../dev/js/mobiscroll.android-ics-2.5.2.js" type="text/javascript"></script>
    
    <link href="../dev/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="../dev/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
	<link href="../dev/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
	
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="urban-ParkMap.jsp" class="top-bar-rebtn"></a>
    <h3>订单确认</h3>
    <a href="" class="top-call-back"></a>
</div>
<!--页面主体-->
<div class="wrapper">
    <!--停车时间-->
    <div class="main-time">
        <div class="main-top clearfix">
            <h2><i class="icon-appointment"></i>预约停车时间</h2>
            <form class="yd-time">
                <div class="start-time">
                    <h3>开始时间：</h3>
                    <input type="text" id="startTime">
                    <span class="tip">计费开始时间</span>
                </div>
                <div class="end-time">
                    <h3>结束时间：</h3>
                    <input type="text" id="endTime">
                </div>
            </form>
        </div>
        <!--停车规则-->
        <div class="main-gz clearfix">
            <h4>预订规则</h4>
            <ol>
                <li class="">1.最終解释权最終解释权最終解释权最終解释权最終解释权最終解释权最終解释权</li>
                <li class="">2.最終解释权最終解释权最終解释权最終解释权最終解释权最終解释权最終解释权</li>
            </ol>
        </div>
    </div>
    <!--车辆信息-->
    <div class="car-number">
        <h2><i class="icon-plate"></i>停泊的车牌号:</h2>
        <form>
        <select>
            <option>浙c.88888</option>
        </select>
        </form>
    </div>
    <!--费用详情-->
    <div class="preferential-policy">
        <div>
            <h2 class="fl"><i class="icon-Discount"></i>预付停车费用(<span>2</span>小时)</h2>
            <p class="fr"><span>20</span>元</p>
        </div>
        <div>
            <h2 class="fl"><i class="icon-Discount"></i>优惠政策:</h2>
            <p style="font-size: 1.2rem;">暂无</p>
        </div>
        </div>
    </div>

<div class="btn">
    <a href="order-Details.jsp" class="query-btn" onclick="formsubmit()">确定</a>
</div>


<!--时间控件设置
<script type="text/javascript">
    $(function () {
        var currYear = (new Date()).getFullYear();
        var opt={};
        opt.datetime = {preset : 'datetime'};
        opt.default = {
            theme: 'android-ics light', //皮肤样式
            display: 'modal', //显示方式
            mode: 'scroller', //日期选择模式
            lang:'zh',
            startYear:currYear - 10, //开始年份
            endYear:currYear + 10 //结束年份
        };
        var optDateTime = $.extend(opt['datetime'], opt['default']);
        $("#startTime").mobiscroll(optDateTime).datetime(optDateTime);
        $("#endTime").mobiscroll(optDateTime).datetime(optDateTime);

    });
</script>
-->
<!--确定点击事件-->
<!--判断时间-->
<script>
    function formsubmit() {
        var starttime=$.trim($("#startTime").val());//开始时间
        var endtime=$.trim($("#endTime").val());//结束时间
        var start=new Date(starttime.replace("-", "/").replace("-", "/"));
        var end=new Date(endtime.replace("-", "/").replace("-", "/"));
        if(end<start){
            alert("结束时间不得小于开始时间");
            return false;
        }
    }

</script>
</body>
</html>