<%@page import="cn.store.entity.User_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
 	<link rel="stylesheet" href="../css/bootstrap.css"/>
    <link href="../css/gouwu.css" rel="stylesheet" type="text/css" />
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
<div class="container" style="background-color: #f7f7f7;">
		<div class="row">
			<div class="col-md-12" style="height: 40px; line-height: 40px;padding-top: 10px">
				<span style="font-size: 16px; margin-left: 45px"> <a
					href="index.jsp" style="text-decoration: none">商城首页</a> >
					<a href="store_pro.jsp" style="text-decoration: none">智能手机</a> >购物车
				</span>
			</div>
		</div>
	</div>
<!-- 购物车 -->
<div class="container" style="background-color: #f7f7f7;">
    <div class="row">
        <div class="col-md-12">
            <div id="page">
                <div id="listdiv"> <h3 class="title">购 物 车</h3>
                    <table width="100%" cellpadding="0" cellspacing="0" id="gwcTable">
                        <thead>
                            <tr>
                                <th colspan="2">商品信息</th>
                                <th style="width: 14%;">商品单价</th>
                                <th style="width: 14%;">商品数量</th>
                                <th style="width: 14%;">商品金额</th>
                                <th>编辑</th>
                            </tr>
                        </thead>
                        <tbody class="tab">
                        <!-- <tr>
                            <td><input type="checkbox" class="checkCss"/></td>
                            <td class="goods">
                                <img src="images/shouji.jpg" class="goods-left"/>
                                <div style="margin-right: 5px" class="goods-right">
                                    <p>华为手机P8</p>
                                </div>
                            </td>
                            <td>2000</td>
                            <td class="count">
                                <input class="reduceCss" id="jia1" value="-" type="button"/>
                                <input type="text" class="inputCountCss" id="inputCountCss1" value="1" size="1"/>
                                <input class="addCss" id="jia2" value="+" type="button"/>
                            </td>
                            <td >2000</td>
                            <td><a href="#"  class="a">删除</a></td>
                        </tr> -->
                        </tbody>
                    </table>
                </div>
                <div id="jiesuan">
                    <input type="checkbox" id="checkAll" style="margin:18px 0 0 -23%"/>&nbsp;&nbsp;&nbsp;&nbsp;全选
                    <div class="t jisuanbtn">
                        <input type="submit" name="btnOrder" id="btnOrder" value="提交订单" />
                    </div>
                    <div class="t TotalMoney" style="margin-right: 5%;text-align: left;">合计：￥  <span id="priceTotal">0.00</span>元</div>
                    <div class="t" style="font-size: 16px;margin-right: 9%">已选商品 
                    	<span id="countTotal" style="font-size: 18px"> 0 </span> 件
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<!-- 页面底部 -->
<%@include file="user_jsp/foot.jsp" %>
</body>
<script type="text/javascript">
	//加载页面后查询购物车里的商品
	$(function(){
		var url="${pageContext.request.contextPath}/UserServlet?method=viewCart";
		$.getJSON(url,function(res){
			if(res.length>0){
				$("tbody div").remove();
				$.each(res,function(index,obj){
					var node='<tr>'+
                        '<td><input type="checkbox" name="checka"/></td>'+
                        '<td class="goods">'+
                            '<img src="../images/product/'+obj.image+'" class="goods-left"/>'+
                            '<div class="goods-right">'+
                                '<p>'+obj.pname+'</p><br>'+
                            '</div>'+
                        '</td>'+
                        '<td class="price">'+obj.price.toFixed(2)+'</td>'+
                        '<td class="count">'+
                        	'<input type="hidden" value="'+obj.inventory+'"/>'+
                            '<em class="product-jian">-</em>'+
                            '<input type="text" class="product-num" id="inputCountCss1" value="'+obj.quantity+'" size="1"/>'+
                            '<em class="product-add">+</em>'+
                        '</td>'+
                        '<td class="money">'+obj.money.toFixed(2)+'</td>'+
                        '<td><a href="'+obj.item_id+'" style="text-decoration: none;" class="del" onclick="return false">删除</a></td>'+
                    	'</tr>';
                    	$("tbody").append(node);
				});
			}else{
				 var node='<div style="color:#F00000;font-size: 24px;margin-top:30px">购物车里暂无商品'+
									'</div>';
				$("tbody").append(node);
				//alert("购物车里暂无商品！");
			}
		})
		
	});
	
	//全选  checkAll
	$("#checkAll").click(function() {
		var flag=$(this).prop("checked");
		if(flag){
			$(".tab [name='checka']").each(function(index,obj) {
				$(obj).prop("checked",true);
			});
		}else{
			$(".tab [name='checka']").each(function(index,obj) {
				$(obj).prop("checked",false);
			});
		}
		
	});
	
	//计算商品的件数 以及总价
	$("body").on("change",'[type="checkbox"]',function(){
		//计算件数
		var num=parseInt(0);
		$(".tab [name='checka']").each(function(index,obj) {
			if($(obj).prop("checked")){
				num++;
			};
		});
		$("#countTotal").text(num);
		//计算总价
		totalprice();
	});
	//计算总价的方法
	function totalprice(){
		var totalprice=parseFloat(0.00);
		$(".tab [name='checka']").each(function(index,obj) {
			if($(obj).prop("checked")){
				var m=parseInt($(obj).parent().siblings(".money").text());
				totalprice=totalprice+m;
			};
			
		});
		$("#priceTotal").text(totalprice.toFixed(2));
	}
	
	//删除商品 
	$(".tab").on("click",".del",function(){
		if(confirm("忍心删除当前商品么？")){
			$(this).parent().parent().remove();
			totalprice();
			item_id=$(this).attr("href");
			$.ajax({
				url:"${pageContext.request.contextPath}/UserServlet?method=CartDelItem",
				data:"item_id="+item_id,
			})
		}
	});
	
	//商品数量加   商品金额加
	$(".tab").on("click",".product-add",function(){
		var count=$(this).siblings("[type='hidden']").val();
		var n=$(this).prev().val();
		var num=parseInt(n)+1;
		if(num>count){ return;}
		$(this).prev().val(num);
		var price=parseInt($(this).parent().siblings().prev().next(".price").text());
		var money=price*num;
		$(this).parent().next(".money").text(money.toFixed(2));
		totalprice();
	});
	//商品数量减   商品金额减
	$(".tab").on("click",".product-jian",function(){
		var n=$(this).next().val();
		var num=parseInt(n)-1;
		if(num==0){ return;}
		$(this).next().val(num);
		var price=parseInt($(this).parent().siblings().prev().next(".price").text());
		var money=price*num;
		$(this).parent().next(".money").text(money.toFixed(2));
		totalprice();
	});
	
	//点击提交订单按钮
	$("#btnOrder").click(function(){
		var flag=false;
		var list=new Array();//把选择的商品放入数组
		$(".tab [name='checka']").each(function(index,obj) {
			if($(obj).prop("checked")){
				flag=true;
				var item_obj=new Object();//订单项对象
				item_obj.item_id=$(obj).parent().siblings().find(".del").attr("href");
				item_obj.quantity=$(obj).parent().siblings().find(".product-num").val();
				item_obj.money=$(obj).parent().siblings(".money").html();
				list.push(item_obj);
			};
		});
		if(!flag){
			alert("请至少选择一件商品!");
			return;
		}
		//如果选择了商品就生成订单  ajax发送到后台
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet?method=submitOrder",
			data:{"list":JSON.stringify(list)},
			success:function(res){
				window.location.href="${pageContext.request.contextPath}/user/buyConfirm.jsp?oid="+res;
			}
		})
		
	});
	

</script>
</html>