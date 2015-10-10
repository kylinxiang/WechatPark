<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	import="java.io.*, javax.servlet.*, org.json.*, xqpark.ParkApi"%>
	
<% 
	JSONObject jsonobj = null;
	JSONArray list = null;
	
	try {
		String userid = request.getSession().getAttribute("userid").toString();
		jsonobj = ParkApi.getOrders(userid, "1");
		list = jsonobj.getJSONArray("list");
	} catch (JSONException e) {
		e.printStackTrace();
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>我的订单</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common1.css" type="text/css">
    <link rel="stylesheet" href="../css/my-Details.css" type="text/css">
    <script src="../js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部信息-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>我的订单</h3>
</div>
<!--订单列表-->
<div>
    <ul><% 
    	if(list.isNull(0))
    		out.print("<li class='details-box'>没有订单记录</li>");
    	else{
    		for(int i=0;i<list.length();i++){
    			JSONObject obj = list.getJSONObject(i);	
    			
    			String stateArray[] = {"已取消","未进场","已进场","已完成"};
    			int state = obj.getInt("state");
    			String statePark = stateArray[state];
    			
    			out.print("<li class='details-box'>");
    			out.print("<h3>订单编号：<span>"+obj.getLong("xoid")+"</span></h3>");
    			out.print("<p>"+obj.getString("parkname")+"</p>");
    			out.print("<div>");
    			out.print("<div class='fl'>起止时间：</div>");
    			out.print("<div class='fl'>");
    			out.print("<p>"+obj.getLong("starttime")+"</p>");
    			out.print("<p>"+obj.getLong("endtime")+"</p></div></div>");
    			out.print("<p style='clear: both'>订单状态：<span>"+statePark+"</span></p>");
    			out.print("<p>预付金额：<span>"+obj.getDouble("prepay")+"</span>元</p>");
    			out.print("<a href='' class='btn bg-o'>评价停车场</a>");
    			out.print("</li>");
    		}  		
    	}  
    %>
        
    </ul>
</div>
<!--奇偶数换色-->
<script>
   $(function(){
       $("li:odd").css("background-color","#eeeef0");
       $("li:even").css("background-color","#fff");
   })
</script>
</body>
</html>