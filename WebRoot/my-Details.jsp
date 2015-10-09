<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>我的订单</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/my-Details.css" type="text/css">
    <script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<!--页面头部信息-->
<div class="top-bar">
    <a href="javascript:history.back()" class="top-bar-rebtn"></a>
    <h3>我的订单</h3>
</div>
<!--订单列表-->
<div>
    <ul>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-o">评价停车场</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-g">取消订单</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-grey">取消订单</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-grey">取消订单</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-grey">取消订单</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-grey">取消订单</a>
        </li>
        <li class="details-box">
            <h3>订单编号：<span>00009</span></h3>
            <p>杭州万塘路停车场</p>
            <div>
                <div class="fl">起止时间：</div>
                <div class="fl">
                    <p>2015-09-08 10：08</p>
                    <p>2015-09-08 11：08</p>
                </div>
            </div>
            <p style="clear: both">订单状态：<span>已完成</span></p>
            <p>预付金额：<span>5</span>元</p>
            <a href="" class="btn bg-grey">取消订单</a>
        </li>
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