<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022/5/5
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js\echarts.min.js"></script>
<script type="text/javascript" src="js\jquery.min.js"></script>
<html>
<head>
    <title>ajax-json</title>
    <style type="text/css">
        .mybox{
            position: relative;
            width: 1600px;
            height: 400px;
        }
        .childbox{
            position: absolute;
            width: 1600px;
            height: 400px;
        }
    </style>
</head>
<body>
<div class="mybox">
    <div class="childbox"></div>
</div>



<script>
    // var ABChart=document.querySelector(".childbox")
    // console.log(ABChart)

    $.ajax({
        url:"https://edu.telking.com/api/?type=month",
        type:"get",
        dataType:"json",
        success:function (data) {
            console.log(data.data.series);
            if(data.code==200){
                var AAChart=echarts.init(document.querySelector(".childbox"))
                option = {
                    title:{
                        /*            text:{'曲线图数据显示'},
                                    left:'center'*/
                    },
                    xAxis: {
                        type: 'category',
                        data: data.data.xAxis
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            data: data.data.series,
                            type: 'line',
                            smooth: true
                        }
                    ]
                };
                AAChart.setOption(option);
            }
            else{
                alert("未获取正确数据")
            }
        }
    })

</script>
</body>
</html>
