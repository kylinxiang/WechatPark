<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	import="java.io.*, javax.servlet.*, org.json.*, xqpark.ParkApi"%>

<% 
	JSONObject jsonobj = null;
	JSONObject info = null;
	
	try {
		String username = (String) request.getSession().getAttribute("username");
		jsonobj = ParkApi.getCarOwnerInfo(username);
		info = jsonobj.getJSONObject("info");
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
    <title>个人信息</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/common1.css" type="text/css">
    <link rel="stylesheet" href="../css/personnal.css" type="text/css">
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>个人信息</h3>
</div>
<div>
    <!--客户头像-->
    <div class="img-center">
        <a><img src=<% 
        	String headurl = info.getString("headurl") ;
        	System.out.println(headurl);
    		if(headurl.isEmpty()) 				
    			out.print("../images/per_icon.png");
    		else{
    			out.print(headurl);
    		}
        		
        %>></a>
    </div>
    <!--客户信息-->
    <form class="main">
        <ul>
            <li class="clearfix">
                <label>昵&nbsp;&nbsp;&nbsp;称</label>
                <label style="float:right"><%=info.getString("nickname") %> </label>
            </li>
            <li class="clearfix">
                <label>性&nbsp;&nbsp;&nbsp;别</label>
                <label style="float:right">
                <%  
              		int sex = info.getInt("sex") ;
                	if(sex == 1)
                		out.print("男");
                	else{
                		out.print("女");
                	}
                %> 
                </label>
            </li>
            <li class="clearfix">
                <label>出生年月</label>
                <label style="float:right"><%=info.getString("borth") %> </label>
                
            </li>
            <li class="clearfix">
                <label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
                <label style="float:right"><%=info.getString("email") %> </label>
            </li>
            <li class="clearfix">
                <label>车&nbsp;牌&nbsp;号</label>
                <label style="float:right"><%=info.getString("platenumber") %> </label>
            </li>
        </ul>
    </form>
</div>
<!--退出登录-->
<div class="footer">
    <a href="" class="re-btn">退出登录</a>
</div>
</body>
</html>