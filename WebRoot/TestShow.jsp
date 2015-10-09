<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
	import="java.io.*, javax.servlet.*, org.json.*, xqpark.ParkApi" %>

<%

JSONObject jsonobj = null;
try {
	jsonobj = ParkApi.getCarOwnerInfo("15988846256");
} catch (JSONException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

JSONArray results = null; 
JSONObject result = null;


try { 
	result = jsonobj.getJSONObject("info");
		
} catch (JSONException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>


<!DOCTYPE html >

<html>
<head>
    <title>API天气</title>
</head>

<body>
<!--响应式父容器-->
<div>
    <p>状态：<%=jsonobj.getString("code") %></p>
    <p>信息：<%=jsonobj.getString("msg") %></p>
    <p>详细信息：</p>

    <p>用户id:<%=result.getString("userid") %></p>
    <p>用户名:<%=result.getString("username") %></p>
    <p>注册时间:<%=result.getString("registertime") %></p>
    
</div>
</body>

</html>