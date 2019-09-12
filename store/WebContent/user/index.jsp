<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/index_style.css" />
<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/bootstrap.js"></script>
<style type="text/css">

body {
    padding-right: 0px !important; 
}
*.modal-open {
	overflow-y: scroll;
	padding-right: 0 !important;
}
.fixednav {  
    position: fixed;  
    top: 0px;  
    left: 0px;  
    width: 100%;  
    z-index: 999;  
}  

</style>
</head>
<body>
	<!-- 顶部导航 -->
		<%@include file="user_jsp/header.jsp" %>
		<!-- 二级导航 -->
		<div class="row" id="c3"
			style="width: 100%; height: 300px; background-color: #FFFFFF; margin-left: 1px;">
			<table id="X"
				style="margin-top: 3%; display: none; text-align: center; margin-left: 30%">
				<tr>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/10751.png"
							height="200" alt="" /><br>
							<h4 style="">X23 幻彩版</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/10751.png"
							height="200" alt="" /><br>
							<h4 style="">X23 幻彩版</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/more.png"
							height="200" alt="" /><br>
							<h4 style="">更多X系列</h4>
					</a></td>
				</tr>
			</table>
			<table align="center" id="Y"
				style="margin-top: 3%; display: none; margin-left: 30%">
				<tr>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/5086.png"
							height="200" alt="" /><br>
							<h4 style="">Y全面屏</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/more.png"
							height="200" alt="" /><br>
							<h4 style="">全部Y机型</h4>
					</a></td>
				</tr>
			</table>
			<table align="center" id="IQ"
				style="margin-top: 3%; display: none; margin-left: 30%">
				<tr>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img
							src="../images/10000467.png" height="200" alt="" /><br>
							<h4 style="">IQOO</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/more.png"
							height="200" alt="" /><br>
							<h4 style="">全部IQOO机型</h4>
					</a></td>
				</tr>
			</table>
			<table align="center" id="Z"
				style="margin-top: 3%; display: none; margin-left: 30%">
				<tr>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/10636.png"
							height="200" alt="" /><br>
							<h4 style="">Z3 全面屏</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/10636.png"
							height="200" alt="" /><br>
							<h4 style="">Z3 全面屏</h4>
					</a></td>
					<td style="text-align: center"><a href=""
						style="text-decoration: none"> <img src="../images/more.png"
							height="200" alt="" /><br>
							<h4 style="">更多Z系列</h4>
					</a></td>
				</tr>
			</table>
			<table align="center" id="store"
				style="margin-top: 3%; display: none; margin-left: 30%">
				<tr>

				</tr>
			</table>
		</div>

		<div class="container" style="width: 100%; margin-top: 0">
			<div class="row" id="c1">
				<!--data-ride="carousel" 属性用于标记轮播在页面加载时就开始动画播放                  -->
				<div class="carousel slide" id="myCarousel" data-ride="carousel">
					<!--轮播指标-->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>&nbsp;&nbsp;
						<li data-target="#myCarousel" data-slide-to="1"></li>&nbsp;&nbsp;
						<li data-target="#myCarousel" data-slide-to="2"></li>&nbsp;&nbsp;
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<!--轮播指标-->
					</ol>
					<!--轮播项目-->
					<div class="carousel-inner" style="margin-top: -21px">
						<div class="item active">
							<img src="../images/banner3.2.jpg" alt="" />
						</div>
						<div class="item">
							<img src="../images/banner2.4.png" width="1637" height="752"
								alt="" />
						</div>
						<div class="item">
							<img src="../images/banner4.3.jpg" alt="" />
						</div>
						<div class="item">
							<img src="../images/banner1.2.jpg" alt="" />
						</div>
					</div>
					<!--轮播项目-->
					<!--轮播指标-->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
					<!--轮播指标-->
				</div>
			</div>
		</div>
	<!--热销内容-->
	<div class="container"
		style="background-color: #f7f7f7; height: 450px;">
		<div class="row hot_sale_span" style="height: 50px">
			<span style="margin-left: 20px; line-height: 50px"> <a href=""
				style="text-decoration: none; font-size: 24px; font-weight: bold">
					热销机型</a>
			</span> <span style="float: right; line-height: 50px; margin-right: 40px">
				<a href="store_pro.jsp" style="text-decoration: none; font-size: 14px;">更多 >></a>
			</span>
		</div>
		<div class="row" id="hot">
			
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="row" id="c2">
		<ul class="nav_title">
			<li id="title_IQ"><a href="">IQOO专区</a></li>
			<li id="title_Y"><a href="">Y系列</a></li>
			<li id="title_x"><a href="">X系列</a></li>
			<li id="title_z"><a href="">Z系列</a></li>
			<li id="title_store"><a href="store_pro.jsp">商城</a></li>
			<li><a href=""  >服务</a></li>
		</ul>
	</div>
	<!-- 页面底部 -->
	<%@include file="user_jsp/foot.jsp" %>
	
	<!-- modal显示商品详情 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body" style="width: 80%">
					
				</div>
			</div>
		</div>
	</div>
	
	
</body>
<script>

	//固定导航栏在顶部
	$(function() {
		var nav = $("#nav_header"); //得到导航对象  
		var win = $(window); //得到窗口对象  
		var sc = $(document);//得到document文档对象。  
		win.scroll(function() {
			if (sc.scrollTop() >= 5) {
				nav.addClass("fixednav");
			} else {
				nav.removeClass("fixednav");
			}
		});
		$('.modal').on('hide.bs.modal', function() {
	        $("body").removeClass('modal-open');
	        $("body").css('padding-right','0px');
	    });
	});

	
    /* 二级导航滑过显示*/
   $("#title_x").mouseenter(function () {
        $("#X").siblings().css("display","none");
        $("#X").css("display","block");
    });
   $("#title_IQ").mouseenter(function () {
       $("#IQ").siblings().css("display","none");
       $("#IQ").css("display","block");
   });
    $("#title_Y").mouseenter(function () {
        $("#Y").siblings().css("display","none");
        $("#Y").css("display","block");
    });
    $("#title_z").mouseenter(function () {
        $("#Z").siblings().css("display","none");
        $("#Z").css("display","block");
    });
    $("#title_store").mouseenter(function () {
        $("#store").siblings().css("display","none");
        $("#store").css("display","block");
    });



    $("#c2 li:lt(4)").mousemove(function () {
        $("#c3").css("display","block");
    });
    $("#c3").mouseleave(function () {
        $(this).css("display","none");
    });
    $("#c2 li:gt(3)").mousemove(function () {
        $("#c3").css("display","none");
    });
    
    /*热搜物品的展示  */
    $(function() {
    	var url="${pageContext.request.contextPath}/hotServlet";
		$.getJSON(url,function(result){
			for (var i = 0; i < result.length; i++) {
				var $newNode=
				"<div class='col-md-4'>"+
				   "<div class='hovereffect' style='margin-left: 5%''>"+
				       "<img src='../images/remai.png' width='60px' alt='' style='position: absolute; left: 275px; top: 10px; animation: dh 1.5s infinite;'/>"+
				       "<a href='"+result[i].pid+"' title='查看详情'  data-toggle='modal' data-target='#exampleModal' id='resou' >"+
				           "<img class='img-responsive' src='../images/product/"+result[i].image+"' alt=''>"+
				       "</a>"+
				   "<div class='overlay'>"+
					   "<h2>"+
						    "<a href='"+result[i].pid+"'  title='查看详情' data-toggle='modal' data-target='#exampleModal' >"+result[i].pname+"</a>"+
					   "</h2>"+
				"</div>"+
			"</div>"+
		"</div>";
		 $("#hot").append($newNode)
			}
		});
    });
    
    
  //点击商品查看详情。
	$("#hot").on("click","a",function(){
		var obj=$(this).attr("href");
		var url="${pageContext.request.contextPath}/ProductServlet?method=getProById";
		var data={"id":obj};
		$.getJSON(url,data,function(res){
			$(".modal-body div").remove();
			var node='<div class="view-left">'+
						'<img src="../images/product/'+res.image+'" style="width: 320px; height: 330px">'+
					'</div>'+
					'<div class="qwick-view-right">'+
					'<div class="qwick-view-content">'+
						'<h2>'+res.pname+'</h2>'+
						'<h8>'+res.description+'</h8>'+
						'<div class="price">'+
						'<h5>价格  <span class="new" style="font-size:28px;color:#ed462f"> ￥'+res.price+'</span></h5>'+
						'</div>'+
						'<div class="quickview-plus-minus">'+
						'<div class="cart-plus-minus">'+
						'<button id="reduce" style="width: 20px; height: 25px; text-align: center; margin-top: 10px">-</button>'+
						'<button id="con" style="width: 30px; height: 25px; text-align: center; background-color: white; border: 0">1</button>'+
						'<button id="add" style="width: 20px; height: 25px; text-align: center;">+</button>'+
						'&nbsp;&nbsp;&nbsp;&nbsp; <label style="font-size: 16px">库存</label>&nbsp;<span id="inventory">&nbsp;'+res.inventory+'</span>'+
						'</div>'+
						'<div class="quickview-btn-cart">'+
						'<a  id="cart" class="btn-style cr-btn" href="'+res.pid+'" style="text-decoration: none;" onclick="return false"><span>添加购物车</span></a>'+
						'</div>'+
					'</div>'+
					'</div>'+
					'</div>';
				$(".modal-body").append(node);
		});
	});
  $(function(){
	  <%
	  	String login=request.getParameter("method");
	  	if(login!=null){
	  		%>
	  		$('#modal').modal();
	  		alert("请先登录！！！");
	  		<%
	  	}
	  %>
  });
</script>
</html>