<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
 	<link rel="stylesheet" href="../css/bootstrap.css"/>
    <link href="../css/order.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
<!-- 页面顶部 -->
<%@include file="user_jsp/header.jsp" %>
<%
	User_info user=(User_info)session.getAttribute("user_info");
	if(user==null){
		%>
			<script>
				window.location.href="${pageContext.request.contextPath}/user/index.jsp?method=login";
			</script>
		<%
		return;
	}
%> 
<div class="container" style="background-color: #FFFFFE;">
		<div class="row">
			<div class="col-md-12" style="height: 40px; line-height: 40px;padding-top: 10px">
				<span style="font-size: 16px; margin-left: 45px"> <a
					href="index.jsp" style="text-decoration: none">商城首页</a> >
					<a href="store_pro.jsp" style="text-decoration: none">智能手机</a> >我的订单
				</span>
			</div>
		</div>
	</div>
<!-- 我的订单 -->
<div class="container" style="background-color: #f7f7f7;">
    <div class="row">
        <div class="col-md-12">
            <div id="page">
                <div id="listdiv"> <h3 class="title">我的订单</h3>             
                   
                   
            </div>
        </div>
    </div>
</div>
<!-- 页面底部 -->
<%@include file="user_jsp/foot.jsp" %>
</body>
<script type="text/javascript">
var  pagesize=6;
$(function(){
	getdata(1,pagesize);
	
});
$("#listdiv").on("click","li",function(){
	var num=$(this).find("a").html();
	$("#listdiv table").remove();
	$("#listdiv ul").remove();
	getdata(num,pagesize);
});


function getPage(totalPages,pageNumber){
	var node1='<ul class="pagination">';
	var node2='<li><a href="#">1</a></li>';
	if(pageNumber==1){
		node2='<li class="active"><a href="#">1</a></li>';
	}
	if(totalPages>1){
		for(var i=2;i<=totalPages;i++){
			if(i==pageNumber){
				node2=node2+'<li class="active"><a href="#">'+i+'</a></li>';
			}else{
				node2=node2+'<li><a href="#">'+i+'</a></li>';
			}
			
		}
	}
	var node3='</ul>';
	var node=node1+node2+node3;
	$("#listdiv").append(node);
}
//第一次加载数据及分页
function getdata(pagenum,pagesize){
	var url="${pageContext.request.contextPath}/OrderServlet?method=viewOrderPage";
	var data={"pageNumber":pagenum,"pageSize":pagesize};
	$.getJSON(url,data,function(res){
		if(res.data.length>0){
		 	for(var i=0;i<res.data.length;i++){
				if(i==0){
					var node='<table width="100%" cellpadding="0" cellspacing="0" id="orderTable">'+
				            '<thead>'+
				            '<tr>'+
				            '<th colspan="5" style="background-color:#DDECD6;color:black;text-align: left" name="oid">'+'订单号:'+res.data[i].oid+'</th>'+       
				            '</tr>'+
				       '<tr style="background-color:#FCF7E1">'+
				       '<th style="color:black">'+'图片'+'</th>'+
				       '<th style="color:black">'+'商品名称'+'</th>'+
				       '<th style="color:black">'+'单价'+'</th>'+
				       '<th style="color:black">'+'数量'+'</th>'+
				       '<th style="color:black">'+'小计'+'</th>'+
				  	 	'</tr>'+
						'</thead>'+
						'<tbody id="'+res.data[i].oid+'">'+
						 '</tbody>'+
						 '<tr>'+
		                 '<td colspan="2" style="background-color:#F4F4F4;color:black;text-align: left">'+'下单时间：'+res.data[i].time+'</td>'
		               +
		               '<td colspan="2" style="background-color:#F4F4F4;color:black;text-align: left">'+'下单状态:'+res.data[i].satate+'</td>'
		               +
		               '<td colspan="1" style="background-color:#F4F4F4;color:black;text-align: left">'+'应付：'+'￥'+res.data[i].total+'</td>'
		               +'</tr>'
						+'</table>';
					 $("#listdiv").append(node);	
				}else{
					//document.write(i+"---"+res.data[i].oid+"--"+res.data[i-1].oid+"---"+(res.data[i].oid!=res.data[i-1].oid)+"<br>");
					if(res.data[i].oid!=res.data[i-1].oid){
						var node='<table width="100%" cellpadding="0" cellspacing="0" id="orderTable">'+
					            '<thead>'+
					            '<tr>'+
					            '<th colspan="5" style="background-color:#DDECD6;color:black;text-align: left" name="oid">'+'订单号:'+res.data[i].oid+'</th>'+       
					            '</tr>'+
					       '<tr style="background-color:#FCF7E1">'+
					       '<th style="color:black">'+'图片'+'</th>'+
					       '<th style="color:black">'+'商品名称'+'</th>'+
					       '<th style="color:black">'+'单价'+'</th>'+
					       '<th style="color:black">'+'数量'+'</th>'+
					       '<th style="color:black">'+'小计'+'</th>'+
					  	 	'</tr>'+
							'</thead>'+
							'<tbody id="'+res.data[i].oid+'">'+
							 '</tbody>'+
							 '<tr>'+
			                 '<td colspan="2" style="background-color:#F4F4F4;color:black;text-align: left">'+'下单时间：'+res.data[i].time+'</td>'
			               +
			               '<td colspan="2" style="background-color:#F4F4F4;color:black;text-align: left">'+'下单状态:'+res.data[i].satate+'</td>'
			               +
			               '<td colspan="1" style="background-color:#F4F4F4;color:black;text-align: left">'+'应付：'+'￥'+res.data[i].total+'</td>'
			               +'</tr>'
							+'</table>';
						 $("#listdiv").append(node);	
					}
				}
			}
		 	
		 	for(var i=0;i<res.data.length;i++){
		 		var node='<tr style="background-color:#F4F4F4">'+
	            '<td>'+'<img src="../images/product/'+res.data[i].image+'" width="80" />'+'</td>'+
	            '<td>'+res.data[i].pname+'</td>'+
	            '<td>'+'￥'+res.data[i].price+'</td>'+                            
	            '<td>'+res.data[i].quantity+'</td>'+
	            '<td>'+'￥'+res.data[i].money+'</td>'+				            
	        	'</tr>';
	        	var obj="#"+res.data[i].oid;
			   $(obj).append(node);
		 		
		 	}
		}
		var currentNum=res.pageNumber;
		getPage(res.totalPages,currentNum);
	});	
}
</script>
</html>