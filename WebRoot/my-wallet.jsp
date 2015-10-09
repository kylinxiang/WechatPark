<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,width=device-width,maximum=scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="yes">
    <title>我的钱包</title>
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/common1.css" type="text/css">
    <link rel="stylesheet" href="css/my-wallet.css" type="text/css">
</head>
<body>
<!--页面头部-->
<div class="top-bar">
    <a href="" class="top-bar-rebtn"></a>
    <h3>我的钱包</h3>
    <a href="" class="call-back"></a>
</div>
<!--余额信息-->
<div class="sy-money">
    <div class="money-box clearfix">
        <img src="images/icon-wallet-cost.png">
        <p>现金金额</p>
        <span>0.00元</span>
    </div>
</div>
<!--钱包信息-->
<div class="yhj">
    <!--优惠卷数量-->
    <div class="yhj-header">
        <img src="images/icon-wallet-logo.png">
        <h2>小强停车场优惠卷</h2>
        <span>2张</span>
    </div>
    <!--优惠卷信息-->
    <div class="yhj-box">
        <ul class="clearfix">
            <li class="font-g">
                <div class="img-center">
                    <span>
                        <img src="images/icon-wallet-logo-g.png">
                    </span>
                </div>
                <div class="box">
                    <h3>首单优惠卷</h3>
                    <p>APP及微信用户专享</p>
                    <span class="font-y">使用期限:2015.5.5-2015.11.5</span>
                </div>
                <span class="sliod-g"></span>
                <span class="tip">￥</span>
                <span class="price">5</span>
            </li>
            <li class="font-b">
                <div class="img-center">
                    <span>
                        <img src="images/icon-wallet-logo-b.png">
                    </span>
                </div>
                <div class="box">
                    <h3>首单优惠卷</h3>
                    <p>APP及微信用户专享</p>
                    <span class="font-y">使用期限:2015.5.5-2015.11.5</span>
                </div>
                <span class="sliod-b"></span>
                <span class="tip">￥</span>
                <span class="price">5</span>
            </li>
        </ul>
    </div>
</div>
<!--页面尾部-->
</body>
</html>