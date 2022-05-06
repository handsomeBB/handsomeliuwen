<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>telking_test</title>
    <link href="css\index.css" rel="stylesheet" style="text/css"/>
    <script type="text/javascript" src="js\index.js"></script>
    <script type="text/javascript" src="js\echarts.min.js"></script>
    <script type="text/javascript" src="js\jquery.min.js"></script>
  </head>
  <body>
  <jsp:include page="header.jsp"></jsp:include>

  <div class="text_content">
    <div class="left">
      <p><b>Audience Overview</b>
      </p>
      <P>Roseville,CA</P>
    </div>

    <div class="right">
        <ul>
          <li class="selectedNav"><a href="#">DASHBOARD</a></li>
          <li><a href="#">PROJECT</a></li>
          <li><a href="#">CALENDAR</a></li>
          <li><a href="#">MAILBOX</a></li>
          <li><a href="#">SETTINGS</a></li>
        </ul>

        <div class="a222" style="background-color:#6d9eeb;"></div>

    </div>

  </div>
  </div>

  <div id="main_ad">
    <div class="main">
    <div class="scollimg">
      <%--style="z-index: 1"--%>
        <img src="images\0.png" alt="" >
        <img src="images\1.png" alt="">
        <img src="images\2.png" alt="">
    </div>
    <div class="point">
      <span></span>
      <span></span>
      <span></span>
    </div>

    <div class="btn">
      <div id="btnleft">&lt;</div>
      <div id="btnright">&gt;</div>
    </div>
    </div>

    <div class="about">
      <div class="up">
        <p><b>我们的优势<br></b>
          二十年互联网经验<br>
        互联网人才培养优势<br>
          众多低成本快速成功案例
        </p>
        <div class="all">View All</div>
      </div>
      <div class="down">
        <ul>
          <li><b>TIME</b></li>
          <li>9:45PM</li>
          <li>10:00PM</li>
        </ul>
        <ul>
          <li><b>USERNAME</b></li>
          <li>吴振东</li>
          <li>刘文</li>
        </ul>
        <ul>
          <li><b>STATUS</b></li>
          <li><div id="online">在线</div></li>
          <li><div id="offline">离线</div></li>
        </ul>

      </div>
    </div>
  </div>

  <div class="diagram">

    <div class="diagram_a">

    </div>
  </div>

  <div class="chart">
    <div class="pie"></div>
    <div class="barchart"></div>
  </div>








  <jsp:include page="footer.jsp"></jsp:include>
  
  <%--导航栏滑块效果--%>
  <script>
      $('.right ul').on('mouseenter','li',function (e) {
          $('.a222').css("left",e.currentTarget.offsetLeft+"px");
      })
      $('.right ul').on('mouseleave','li',function (e) {
          $('.a222').css("left",$('.selectedNav')[0].offsetLeft+"px");
      })
      $('.right').on("click",'li',function (e) {
          $('li').removeClass("selectedNav");
          $(this).addClass("selectedNav");
          $('.a222').css("left",e.currentTarget.offsetLeft+"px");
      })
  </script>
  <%--轮播图--%>
  <script>
/*    var itemss=document.querySelector(".scollimg");
    console.log(itemss);
    console.log("1");*/

let main=document.querySelector(".main");
let scollimg=document.querySelector(".scollimg");
let items=document.querySelectorAll(".scollimg > img");
let btnleft=document.getElementById("btnleft");
let btnright=document.getElementById("btnright");

let curr=9;
// console.log(main);
//下一张
btnright.onclick=function () {
    curr++;
    scollimg.style.left=-curr*600+"px";
    if(curr>=items.length){
        curr=0;
        scollimg.style.left="0px";
    }
}

btnleft.onclick=function () {
    curr--;
    scollimg.style.left=-curr*600+"px";
    if(curr<0){
        curr=items.length-1;
        scollimg.style.left="-1200px";
    }
}

//自动轮播
let time=setInterval(()=>{
    btnright.onclick();
},2000);

main.onmouseenter=function () {
    clearInterval(time);
    // clearInterval(time);
}

main.onmouseleave=function () {
    let time=setInterval(()=>{
        btnright.onclick();
    },2000);
}
  </script>

  <%--曲线图--%>
  <script>
/*    var Chart=echarts.init(document.querySelector(".diagram_a"))
    option = {
        title:{
/!*            text:{'曲线图数据显示'},
            left:'center'*!/
        },
        xAxis: {
            type: 'category',
            data: ['01/26', '01/28', '01/30', '02/01', '02/03', '02/05', '02/07', '02/09', '02/11', '02/13', '02/15', '02/17', '02/19', '02/21', '02/23']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                data: [8972, 6445, 7456, 5824, 8123, 300, 300,5318,7463,1435,9426,8187,8297,443,9135],
                type: 'line',
                smooth: true
            }
        ]
    };
    Chart.setOption(option);*/
$.ajax({
    url:"https://edu.telking.com/api/?type=month",
    type:"get",
    dataType:"json",
    success:function (data) {
        console.log("验证获取json月数据成功为："+data.data.series);
        if(data.code==200){
            var AAChart=echarts.init(document.querySelector(".diagram_a"))
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


  <%--柱状图、饼状图--%>
  <script>
      // console.log("ok");
      $.ajax({
          url:"https://edu.telking.com/api/?type=week",
          type:"get",
          dataType:"json",
          success:function (data) {
              if (data.code == 200) {
                  console.log("验证获取json周数据成功为："+data.data.series);
                  var myChart=echarts.init(document.querySelector(".barchart"))
                  var option={
                      title:{
                          text:'柱状图图数据展示',
                          left:'center'
                      },
                      tooltip:{},
                      legend:{
                          data:['商品数'],
                          left:'left'
                      },
                      xAxis:{
                          data:data.data.xAxis
                      },
                      yAxis:{},
                      series:[{
                          name:'商品数',
                          type:'bar',
                          data:data.data.series
                      }]
                  };
                  myChart.setOption(option);

                  //饼状图
                  console.log("验证获取json单天数据成功为："+data.data.series[0]);
                  var myChartA=echarts.init(document.querySelector(".pie"))
                  option = {
                      title: {
                          text: '饼状图数据显示',
                          //副标题
                          // subtext: 'Fake Data',
                          left: 'center'
                      },
                      tooltip: {
                          trigger: 'item'
                      },
                      legend: {
                          orient: 'vertical',
                          left: 'left'
                      },
                      series: [
                          {
                              name: 'Access From',
                              type: 'pie',
                              radius: '50%',
                              data: [
                                  { value: data.data.series[0], name: data.data.xAxis[0] },
                                  { value: data.data.series[1], name: data.data.xAxis[1] },
                                  { value: data.data.series[2], name: data.data.xAxis[2] },
                                  { value: data.data.series[3], name: data.data.xAxis[3] },
                                  { value: data.data.series[4], name: data.data.xAxis[4] },
                                  { value: data.data.series[5], name: data.data.xAxis[5] },
                                  { value: data.data.series[6], name: data.data.xAxis[6] }
                              ],
                              emphasis: {
                                  itemStyle: {
                                      shadowBlur: 10,
                                      shadowOffsetX: 0,
                                      shadowColor: 'rgba(0, 0, 0, 0.5)'
                                  }
                              }
                          }
                      ]
                  };
                  myChartA.setOption(option);
              }
          }

      })


  </script>

  <%--饼状图--%>
  <%--<script>
    $.ajax({
        url:"https://edu.telking.com/api/?type=week",
        type:"get",
        dataType:"json",
        success:function (data){
            // var i=data.data.series.length;
            if(data.code==200){
                console.log("验证获取json单天数据成功为："+data.data.series);
                var myChartA=echarts.init(document.querySelector(".pie"))
                option = {
                    title: {
                        text: '饼状图数据显示',
                        //副标题
                        // subtext: 'Fake Data',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left'
                    },
                    series: [
                        {
                            name: 'Access From',
                            type: 'pie',
                            radius: '50%',
                            data: [
                                { value: data.data.series[0], name: data.data.xAxis[0] },
                                { value: data.data.series[1], name: data.data.xAxis[1] },
                                { value: data.data.series[2], name: data.data.xAxis[2] },
                                { value: data.data.series[3], name: data.data.xAxis[3] },
                                { value: data.data.series[4], name: data.data.xAxis[4] },
                                { value: data.data.series[5], name: data.data.xAxis[5] },
                                { value: data.data.series[6], name: data.data.xAxis[6] }
                            ],
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                myChartA.setOption(option);
            }
        }

    })


  </script>--%>
  </body>
</html>