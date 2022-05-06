/*
var oImg=document.getElementsByTagName("img")[0];
var oBtnleft=document.getElementsByClassName("btnleft")[0];
var oBtnright=document.getElementsByClassName("btnright")[0];
var aLi=document.getElementsByTagName("li");

var index=0;
function  point() {
  for(var i=0;i<aLi.length;i++){
    aLi[i].className="";
  }
  aLi[index].className="blue";
}
oBtnleft.onclick=function () {
    index==0?index=2:index--;
    oImg.src="images/"+index+".png"
    point();
}

oBtnright.onclick=function () {
  index==2?index=0:index++;
  oImg.src="images/"+index+".png";
  point();
}

for(var i=0;i<aLi.length;i++){
  aLi[i].a=i;
  aLi[i]=onclick=function () {
    index=this.a;
    oImg.src="images/"+index+".png";
    point();
  }
}*/

/*var items=document.querySelectorAll(".right>div");
var move=document.querySelector(".move");

var last=0;
for(var i=0;i<items.length;i++){
  items[i].onmouseenter=function () {
      items[last].style.color="black";
      this.style.color="white";
      last=i;
      move.style.left=i*100+"px";
  }
}*/

/*
let main=document.querySelector(".main");
let scollimg=document.querySelector(".scollimg");
let items=document.querySelectorAll(".scollimg > img");
let btnleft=document.getElementById("btnleft");
let btnright=document.getElementById("btnright");

let curr=9;

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
}

main.onmouseleave=function () {
    let time=setInterval(()=>{
        btnright.onclick();
    },2000);
}*/
