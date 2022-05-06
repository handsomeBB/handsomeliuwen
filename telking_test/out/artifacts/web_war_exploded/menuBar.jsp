<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/5/6
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js\jquery.min.js"></script>
    <style type="text/css">
        .a1{
            position: relative;
        }
        ul{
            display: flex;
        }
        li{
            width: 200px;
            height: 50px;
            border: 1px solid burlywood;
            list-style: none;
            background-color: rgba(0,0,0,0);
            z-index: 9999;
        }
        .a2{
            width: 202px;
            height: 50px;
            position: absolute;
            top: 0;
            left: 0;
            transition: all .3s linear;
        }
    </style>
</head>
<body>
<div class="aaa">
    <div class="a1">
        <ul>
            <li class="selectedNav"></li>
            <li>D</li>
            <li>P</li>
            <li>C</li>
            <li>M</li>
            <li>S</li>
        </ul>

        <div class="a2" style="background-color:#6d9eeb;"></div>
    </div>
</div>

<script>
    $('ul').on('mouseenter','li',function (e) {
        $('.a2').css("left",e.currentTarget.offsetLeft+"px");
    })
    $('ul').on('mouseleave','li',function (e) {
        $('.a2').css("left",$('.selectedNav')[0].offsetLeft+"px");
    })
    $('.a1').on("click",'li',function (e) {
        $('li').removeClass("selectedNav");
        $(this).addClass("selectedNav");
        $('.a2').css("left",e.currentTarget.offsetLeft+"px");
    })
</script>
</body>
</html>
