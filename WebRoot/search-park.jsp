<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>搜索停车场</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/search-park.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>搜索停车场</h3>
</div>
<!--搜索框-->
<div class="bg-e">
    <div class="search-box">
        <div class="input">
            <span class="icon-search"></span><input type="text" placeholder="请输入目的地或者停车名称">
        </div>
        <a class="search-btn color-o">搜索</a>
    </div>
</div>
<!--车场信息-->
<div class="park-list">
    <h3>机场停车</h3>
    <div class="list-box">
        <ul class="inner clearfix">
            <li class="item">杭州萧山机场</li>
            <li class="item">杭州萧山机场</li>
            <li class="item">杭州萧山机场</li>
            <li class="item">杭州萧山机场</li>
            <li class="item">杭州萧山机场</li>
            <li class="item">杭州萧山机场</li>
        </ul>
    </div>
    <h3>火车站停车</h3>
    <div class="list-box">
        <ul class="inner clearfix">
            <li class="item">宁波火车站</li>
            <li class="item">上海虹桥火车站</li>
        </ul>
    </div>
</div>
</body>
</html>