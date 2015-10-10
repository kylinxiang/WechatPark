<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
	import="java.io.*, javax.servlet.*, org.json.*, xqpark.ParkApi"%>
	
<% 
	JSONObject jsonobj = null;
	JSONArray list = null;
	
	try {
		String userid = request.getSession().getAttribute("userid").toString();
		jsonobj = ParkApi.getCollects(userid, "1");
		list = jsonobj.getJSONArray("list");
	} catch (JSONException e) {
		e.printStackTrace();
	}
%>

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
    <ul><%
    	if(jsonobj.getInt("count") == 0)
			out.print("<li class='details-box'>没有订单记录</li>");
		else{
			for(int i=0;i<list.length();i++){
				
				JSONObject obj = list.getJSONObject(i);	
				
				out.print("<li class='details-box'>");
				out.print("<div class='box-txt'>");
				out.print("<div class='icon-box'><i class='icon-id'></i><i class='icon-place'></i><i class='icon-bus'></i></div>");
				out.print("<h4 class='font-c'>"+obj.getString("parkname")+"</h4>");
				out.print("<div class='size-small' style='margin: 24px auto 0'><i class='icon-star-4'></i>"+obj.getInt("starlevel")+"分</div>");
				out.print("<p class='border-bottom'>停车场地址："+obj.getString("address")+"</p>");
				out.print("<p>成交量："+obj.getInt("totalorder")+"</p>");
				out.print("<p>室内空车位："+obj.getInt("inempty")+"/"+obj.getInt("incount")+"&nbsp;&nbsp;&nbsp;室外空车位："+obj.getInt("outempty")+"/"+obj.getInt("outcount")+"</p>");
				out.print("<p class='text-nowrap'>收费：室内："+obj.getString("chargeindoor")+"&nbsp;&nbsp;&nbsp;室外："+obj.getString("chargeoutdoor")+"</p></div>");
				out.print("<div class='box-btn'>");
				out.print("<img src="+ obj.getString("parkpic") +">");
				out.print("<a href='airport-Details.jsp' class='yd-btn'>立即预定</a></div></li>");
			}
		}   
    %>
        
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