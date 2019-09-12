<%@page import="cn.store.entity.User_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/index_style.css" />
<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/bootstrap.js"></script>
<style type="text/css">
.fixednav {  
    position: fixed;  
    top: 0px;  
    left: 0px;  
    width: 100%;  
    z-index: 999; 
    height: 50px; 
}  

</style>
</head>
<body>
<%@include file="../login.jsp" %>
	<nav class="navbar navbar-default">
		<div class="collapse navbar-collapse" id="nav" style="background-color: black;width: 100%;">
			<ul class="nav navbar-nav" id="nav">
				<li><a href="">品牌</a></li>
				<li><a href="">Funtouch OS</a></li>
				<li><a href="">体验店</a></li>
				<li><a href="">政企业务</a></li>
				<li><a href="">社区</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right" id="nav_right"
				style="margin-right: 2%">
				<li><a href="${pageContext.request.contextPath}/user/cart.jsp">购物车</a></li>
				<li><a href="${pageContext.request.contextPath}/user/order_list.jsp">我的订单</a></li>
				<li><a href=""  data-toggle="modal" data-target="#modal" data-dismiss="modal" id="login1">登录</a></li>
				<li><a href=""  data-toggle="modal" data-target="#modal11" data-dismiss="modal" id="register">注册</a></li>
			</ul>
		</div>
	</nav>
</body>
<script type="text/javascript">
	$(function() {
		var nav = $("#nav"); //得到导航对象  
		var win = $(window); //得到窗口对象  
		var sc = $(document);//得到document文档对象。  
		win.scroll(function() {
			if (sc.scrollTop() >= 5) {
				nav.addClass("fixednav");
			} else {
				nav.removeClass("fixednav");
			}
		})
	
	$(function(){
    var uname = '<%= session.getAttribute("uname")%>';
    var name = '<%= session.getAttribute("name")%>';
    if(null==name||""==name){
    	$("#login1").html(uname);
    	$("#register").html("退出");
    }else if(null==uname||""==uname){
    	$("#login1").html(uname);
    	$("#register").html("退出");
    }
  $("#register").click(function(){
	  if($("#register").html()!="注册"){
			 $("#register").attr("data-target","aa");
			window.location.href="http://localhost:8080/store/user/index.jsp";
		}else{
			$("#register").attr("data-target","#modal11");
		}
	  $("#login1").html("登录");
	  $("#register").html("注册");
	 
      $.ajax({
	  url:"${pageContext.request.contextPath}/UserServlet?method=removesession",
	  data:{
		  "uname":uname,
		  "name":name
	  },
	  success : function(res) {
	}
  });
  });
});
	});
</script>
</html>