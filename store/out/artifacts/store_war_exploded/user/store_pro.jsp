<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智能手机</title>
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/ionicons.min.css">
<link rel="stylesheet" href="../css/bundle.css">
<link rel="stylesheet" href="../css/pro_style.css">
<link rel="stylesheet" href="../css/responsive.css">
<script src="../js/vendor/modernizr-2.8.3.min.js"></script>

<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/select_style.css">

<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script src="../js/bootstrap.js"></script>

<script src="../js/popper.js"></script>
<script src="../js/jquery.counterup.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/main.js"></script>
<style type="text/css">
body {
    padding-right: 0px !important;
    float:left !improtant; 
}
*.modal-open {
	overflow-y: scroll;
	padding-right: 0 !important;
}

</style>
</head>
<body>
	<!-- 页面顶部 -->
	<%@include file="user_jsp/header.jsp"%>

	<div class="container" style="background-color: #f7f7f7">
		<div class="row">
			<div class="col-md-12" style="height: 40px; line-height: 40px">
				<span style="font-size: 16px; margin-left: 35px"> <a
					href="index.jsp" style="text-decoration: none">商城首页</a> >智能手机
				</span>
			</div>
		</div>
	</div>
	<!-- 多条件搜索 -->
	<div class="container" style="background-color: #f7f7f7">
		<div class="row">
			<div class="col-md-12">
				<ul class="select">
					<li class="select-list">
						<dl id="select1">
							<dt>系列：</dt>
							<dd class="select-all selected">
								<a href="#" onclick="return false" style="text-decoration:none;">全部</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">IQOO系列</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">Y系列</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">X系列</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">Z系列</a>
							</dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select2">
							<dt>价格：</dt>
							<dd class="select-all selected">
								<a href="#" onclick="return false" style="text-decoration:none;">全部</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">1000-1500</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">1500-2000</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">2000-2500</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">2500-3000</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">3000-4000</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">4000以上</a>
							</dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select3">
							<dt>运行内存：</dt>
							<dd class="select-all selected">
								<a href="#" onclick="return false" style="text-decoration:none;">全部</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">3GB</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">4GB</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">6GB</a>
							</dd>
							<dd>
								<a href="#" onclick="return false" style="text-decoration:none;">8GB</a>
							</dd>
						</dl>
					</li>
					<li class="select-result">
						<dl>
							<dt>已选条件：</dt>
							<dd class="select-no">暂时没有选择过滤条件</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 手机商品 -->
	<div class="wrapper" >
		<div class="product-area pb-80">
			<div class="container">
				<div class="tab-content">
					<div class="tab-pane active" id="home1" role="tabpanel">
						<div class="row" style="width: 105%; background-color: #f7f7f7"
							id="pro_list">
							<!-- 一个商品开始 -->
							<!-- <div class="col-md-3">
								<div class="product-wrapper mb-45">
									<div class="product-img">
										<a href="#"> <img src="../images/product/1.png" alt=""
											style="width: 270px; height: 320px; background-color: white">
										</a>
										<div class="product-action">
											<div class="product-action-style">
												 <a class="action-cart" title="添加到购物车" href="#"
													style="text-decoration: none;"> <i
													class="ti-shopping-cart"></i>
												</a>
											</div>
										</div>
									</div>
									<div class="product-content text-center">
										<h4>
											<a href="" style="text-decoration: none">Rattan Dustbin</a>
										</h4>
										<div class="product-rating"></div>
										<div class="product-price">
											<span class="old">$33.00 </span><span>$27.00</span>
										</div>
									</div>
								</div>
							</div> -->
							<!-- 一个商品结束 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<!-- <div class="view-left">
							<img src="../images/product/1.png"
								style="width: 320px; height: 330px" alt="">
						</div>
						<div class="qwick-view-right">
							<div class="qwick-view-content">
								<h2>iQOO 6GB+128GB 熔岩橙</h2>
								<h3 style="color: red">【3月20日10点限量开售】</h3>
								<h8>高通骁龙855旗舰处理器，22.5W闪充，6GB+128GB存储组合（每个用户限购一台，已付款订单7天内陆续发出</h8>
								<div class="price">
									<h5>
										价格<span class="new">$120.00</span>
									</h5>
								</div>

								<div class="quickview-plus-minus">
									<div class="cart-plus-minus">
										<button id="reduce"
											style="width: 20px; height: 25px; text-align: center; margin-top: 10px">-</button>
										<button id="con"
											style="width: 30px; height: 25px; text-align: center; background-color: white; border: 0">1</button>
										<button id="add"
											style="width: 20px; height: 25px; text-align: center;">+</button>
										&nbsp;&nbsp;&nbsp;&nbsp; <label style="font-size: 16px">库存</label>&nbsp;<span
											id="inventory">&nbsp;10</span>
									</div>

									<div class="quickview-btn-cart">
										<a class="btn-style cr-btn" href="#"
											style="text-decoration: none;"><span>添加购物车</span></a>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 分页 -->
	<div class="container"
		style="background-color: #f7f7f7; margin-bottom: 10px; margin-top: -80px; text-align: center">
		<ul class="pagination">  
			
		</ul>
	</div>
	<!-- 分页 -->
	<!-- 页面底部 -->
	<%@include file="user_jsp/foot.jsp"%>
</body>
<script>
$(function() {
	//进入商城获取第一页数据
	getAllPro(1,pagesize);
});
var pagesize=6;//一页显示的记录数
//生成商品div的节点
function pronode(pid,image,pname,price){
	var node ='<div class="col-md-6 col-lg-4 col-xl-3">'+
	'<div class="product-wrapper">'+
		'<div class="product-img">'+
			'<a href="'+pid+'" title="查看详情"   data-toggle="modal" data-target="#exampleModal"> <img src="../images/product/'+image+'"'+
				'style="width: 270px; height: 320px; background-color: white">'+
			'</a>'+
			'<div class="product-action">'+
				'<div class="product-action-style">'+
					'<a class="action-cart" title="添加到购物车"  href="'+pid+'" onclick="return false"'+
						'style="text-decoration: none;"> <i class="ti-shopping-cart"></i>'+
					'</a>'+
				'</div>'+
			'</div>'+
		'</div>'+
		'<div class="product-content text-center">'+
			'<h4>'+
				'<a href="'+pid+'" style="text-decoration: none" data-toggle="modal" data-target="#exampleModal">'+pname+'</a>'+
			'</h4>'+
			'<div class="product-rating"></div>'+
			'<div class="product-price">'+
				'<span style="color:#ed462f">￥ '+price+' 元</span>'+
			'</div>'+
		'</div>'+
	'</div>'+
'</div>';
	$("#pro_list").append(node);
}
//生成页码的节点
function getpage(totalpage){
	$(".pagination li").remove();
	if(totalpage>0){
		/* var node1='<li class="disabled"><a href="#">上一页</a></li>'; 
		$(".pagination").append(node1); */
		for(var i=1;i<=totalpage;i++){
			var node2;
			if(i==1){
				node2='<li class="active"><a href="#" ">'+i+'</a></li>';
			}else{
				node2='<li><a href="#" ">'+i+'</a></li>';
			}
			$(".pagination").append(node2);
		};
		/* var node3='<li><a href="#">下一页</a></li>';
		$(".pagination").append(node3); */
	}
}


//ajax请求全部商品数据
function getAllPro(currentpage,pagesize) {
	
	var url = "${pageContext.request.contextPath}/ProductServlet?method=getPro";
	var data = {
		"currentpage" : currentpage,
		"pagesize" : pagesize
	};
	$.getJSON(url,data,function(res) {
		//获取页数
		getpage(res.totalPages);
		//获取商品
		if (res.data.length > 0) {
			$("#pro_list div").remove(); 
			$.each(res.data,function(index, obj) {
				pronode(obj.pid,obj.image,obj.pname,obj.price);
			});
			} else {
				//alert("暂无商品数据");
				var node='';
				$("#pro_list").html("暂无商品！").css("font-size","26px").css("color","#F00000");
			}
		});
};






	$("#select1 dd").click(
		function() {
			$(this).addClass("selected").siblings().removeClass(
					"selected");
			if ($(this).hasClass("select-all")) {
				$("#selectA").remove();
			} else {
				var copyThisA = $(this).clone();
				if ($("#selectA").length > 0) {
					$("#selectA a").html($(this).text());
				} else {
					$(".select-result dl").append(
							copyThisA.attr("id", "selectA"));
				}
			}
	});

	$("#select2 dd").click(
		function() {
			$(this).addClass("selected").siblings().removeClass(
					"selected");
			if ($(this).hasClass("select-all")) {
				$("#selectB").remove();
			} else {
				var copyThisB = $(this).clone();
				if ($("#selectB").length > 0) {
					$("#selectB a").html($(this).text());
				} else {
					$(".select-result dl").append(
							copyThisB.attr("id", "selectB"));
				}
			}
	});

	$("#select3 dd").click(
		function() {
			$(this).addClass("selected").siblings().removeClass(
					"selected");
			if ($(this).hasClass("select-all")) {
				$("#selectC").remove();
			} else {
				var copyThisC = $(this).clone();
				if ($("#selectC").length > 0) {
					$("#selectC a").html($(this).text());
				} else {
					$(".select-result dl").append(
							copyThisC.attr("id", "selectC"));
				}
			}
	});

	$(".select-result").on(
			"click",
			"#selectA",
			function() {
				select[0]="全部";
				$(this).remove();
				$("#select1 .select-all").addClass("selected").siblings()
						.removeClass("selected");
			});

	$(".select-result").on(
			"click",
			"#selectB",
			function() {
				select[1]="全部";
				$(this).remove();
				$("#select2 .select-all").addClass("selected").siblings()
						.removeClass("selected");
			});

	$(".select-result").on(
			"click",
			"#selectC",
			function() {
				select[2]="全部";
				$(this).remove();
				$("#select3 .select-all").addClass("selected").siblings()
						.removeClass("selected");
			});

	
	//根据所选条件查看商品
	var select=new Array();//把用户选择的条件值放在数组传给后台
	$(".select").on("click", "dd", function() {
		if ($(".select-result dd").length >= 1) {
			$(".select-no").hide();
			//给数组赋值
			$.each($(".select-list .selected"),function(index,obj){
				select[index]=$(obj).find("a").html();
			 });
			//alert(select);
			 var all=true;
			 $.each(select,function(index,obj){
				 if(select[index]!="全部"){
					 all=false;
					 return false;
				 }
			 });
			 if(all){
				 $("#pro_list div").remove(); 
				 getAllPro(1,pagesize);
				 return;
			 }
			 $.getJSON({
				 url:"${pageContext.request.contextPath}/ProductServlet?method=getPros",
			     data:{"select":select},
			     traditional:true,
			     success:function(result){
			    	 if (result.data.length>0) {
			    		  //alert(result.data.length+"--总记录数:"+result.totalRecold);
			    		    $("#pro_list div").remove(); 
							$.each(result.data,function(index, obj) {
								pronode(obj.pid,obj.image,obj.pname,obj.price)
							});
							if(result.totalPages>0){
								getpage(result.totalPages);
							}
					 } else {
						 $("#pro_list div").remove(); 
						 var node='<div style="color:#F00000;font-size: 24px;padding-left:10%">该分类下暂无商品'+
								'</div>';
						 $("#pro_list").append(node);;
				     } 
			     }
			 });
			
		} else {
			$(".select-no").show();
		}
	});
	
	//点击.select-result  返回商品数据
	$(".select-result").on("click", "dl", function() {
		//alert(select);
		var all=true;
		 $.each(select,function(index,obj){
			 if(select[index]!="全部"){
				 all=false;
				 return false;
			 }
		 });
		 if(all){
			 getAllPro(1,pagesize);
			 return;
		 }
		 $.getJSON({
			 url:"${pageContext.request.contextPath}/ProductServlet?method=getPros",
		     data:{"select":select},
		     traditional:true,
		     success:function(result){
		    	 if (result.data.length>0) {
		    		  //alert(result.data.length+"--总记录数:"+result.totalRecold);
		    		    $("#pro_list div").remove(); 
						$.each(result.data,function(index, obj) {
							pronode(obj.pid,obj.image,obj.pname,obj.price)
						});
						if(result.totalPages>0){
							getpage(result.totalPages);
						}
				 } else {
					 $("#pro_list div").remove(); 
					 var node='<div style="color:#F00000;font-size: 24px;padding-left:10%">该分类下暂无商品'+
							'</div>';
					 $("#pro_list").append(node);;
			     } 
		     }
		 });
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
		
	
	
	//点击页数换商品
	$(".pagination").on("click","li",function(){
		$(this).addClass("active").siblings().removeClass("active");
		var currentpage=$(this).find("a").html();
		//判断是否是全部商品
		var url=null;
		var all=true;
		 $.each(select,function(index,obj){
			 if(select[index]!="全部"){
				 all=false;
			 }
		 });
		 if(all){
			 url = "${pageContext.request.contextPath}/ProductServlet?method=getPro";
		 }else{
			 url = "${pageContext.request.contextPath}/ProductServlet?method=getPros";
		 }
		//alert(select);
		var data = {
			"currentpage" : currentpage,
			"pagesize" : pagesize,
			"select":select
		};
		//ajax请求该页商品数据
		$.getJSON({
				url:url,
				data:data,
				traditional:true,
				success:function(res) {
					//获取商品
					if (res.data.length > 0) {
						$("#pro_list div").remove(); 
						$.each(res.data,function(index, obj) {
							pronode(obj.pid,obj.image,obj.pname,obj.price);
						});
						} else {
							$("#pro_list div").remove(); 
							 var node='<div style="color:#F00000;font-size: 24px;padding-left:10%">该分类下暂无商品'+
									'</div>';
							 $("#pro_list").append(node);
						}
			}
		});
		
	});
	
	
	//点击商品查看详情。
	$("#pro_list").on("click","a",function(){
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
						'<button class="reduce" style="width: 20px; height: 25px; text-align: center; margin-top: 10px">-</button>'+
						'<button class="con" style="width: 30px; height: 25px; text-align: center; background-color: white; border: 0">1</button>'+
						'<button class="add" style="width: 20px; height: 25px; text-align: center;">+</button>'+
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
	
	
	/*商品购买的数量 加减 */
	$(".modal-body").on("click",".add",function(){
		var obj = parseInt($(".con").html());
		var obj1 = parseInt($("#inventory").text());
		if (obj < obj1) {
			obj = obj + 1;
			$(".con").html(obj);
		}
		//$("#con").html(obj);
	});
	$(".modal-body").on("click",".reduce",function(){
		var obj = parseInt($(".con").html());
		if (obj > 1) {
			obj = obj - 1;
		}
		$(".con").html(obj);
	}); 
	
	//点击action-cart 购物车图标添加到购物车
	$("#pro_list").on("click",".action-cart",function(){
		var pid=$(this).attr("href");
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet?method=addToCart",
			type:"post",
			data:{"pid":pid},
			dataType:"html",
			success:function(res){
				if(res.length>10){
					$("body").append(res);
					return;
				}
				if(res){
					alert("添加成功！");
				}else{
					alert("添加失败！");
				}
			}
		});
	});
	
	//点击查看商品详情后添加到购物车
	$(".modal-body").on("click","#cart",function(){
		var pid=$(this).attr("href");
		var num=$("#con").html();
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet?method=addToCart",
			type:"post",
			data:{"pid":pid,"num":num},
			dataType:"text",
			success:function(res){
				if(res){
					alert("添加成功！");
				}else{
					alert("添加失败！");
				}
			}
		});
	});
</script>
</html>