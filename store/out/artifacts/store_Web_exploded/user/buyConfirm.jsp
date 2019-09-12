<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>确认订单</title>
<link href="../css/buyConfirm/public.css" type="text/css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/buyConfirm/base.css" />
<script type="text/javascript" src="../js/buyConfirm/jquery_cart.js"></script>
<link rel="stylesheet" type="text/css"
	href="../css/buyConfirm/checkOut.css" />
<style>
.show{
	display: none;
}

</style>
</head>
<body>
	<%@include file="user_jsp/header.jsp"%>
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
	<!--收货地址body部分开始-->
	<div class="border_top_cart">
		<script type="text/javascript">
        var checkoutConfig = {
            addressMatch: 'common',
            addressMatchVarName: 'data',
            hasPresales: false,
            hasBigTv: false,
            hasAir: false,
            hasScales: false,
            hasGiftcard: false,
            totalPrice: 244.00,
            postage: 10,//运费
            postFree: true,//活动是否免邮了
            bcPrice: 150,//计算界值
            activityDiscountMoney: 0.00,//活动优惠
            showCouponBox: 0,
            invoice: {
                NA: "0",
                personal: "1",
                company: "2",
                electronic: "4"
            }
        };
        var miniCartDisable = true;
    </script>
		<div class="container">
				<form 
					action="${pageContext.request.contextPath}/UserServlet?method=alipay"
					method="post">
			<div class="checkout-box">
					<div class="checkout-box-bd">
						<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
						<input type="hidden" name="Checkout[addressState]" id="addrState"
							value="0">
						<!-- 收货地址 -->
						<div class="xm-box">
							<div class="box-hd ">
								<h2 class="title">收货地址</h2>
								<!---->
							</div>
							<div class="box-bd" id="asd">
								<div class="clearfix xm-address-list" id="checkoutAddrList">
									<!-- <dl class="item">
                                    <dt>
                                        <strong class="itemConsignee">潘骏杰</strong>
                                        <span class="itemTag tag">家</span>
                                    </dt>
                                    <dd>
                                        <p class="tel itemTel">15961726437</p>

                                        <p class="itemRegion">江苏 无锡市 北塘区</p>

                                        <p class="itemStreet">民丰西苑82号202室(214045)</p>
                                    </dd>
                                    <dd style="display:none">
                                        <input type="radio" name="Checkout[address]" class="addressId"
                                               value="10140916720030323">
                                    </dd>
                                </dl> -->
									<div class="item use-new-addr" id="J_useNewAddr"
										data-state="off">
										<span class="iconfont icon-add"><img
											src="../images/buyConfirm/add_address.png" /></span> 使用新地址
									</div>
								</div>
								<!--点击弹出新增/收货地址界面start-->

								<div class="xm-edit-addr-box" id="J_editAddrBox" 
									style="width: 300px">
									<div class="bd">
										<div class="item">
											<label>收货人姓名<span>*</span></label> <input type="text"
												name="userAddress[consignee]" id="Consignee" class="input"
												placeholder="收货人姓名" maxlength="15" autocomplete='off'>

											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>联系电话<span>*</span></label> <input type="text"
												name="userAddress[tel]" class="input" id="Telephone"
												placeholder="11位手机号" autocomplete='off'>

											<p class="tel-modify-tip" id="telModifyTip"></p>

											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>地址<span>*</span></label> <select
												name="userAddress[province]" id="Provinces" class="select-1">
												<option>省份/自治区</option>
											</select> <select name="userAddress[city]" id="Citys" class="select-2"
												disabled>
												<option>城市/地区/自治州</option>
											</select> <select name="userAddress[county]" id="Countys"
												class="select-3" disabled>
												<option>区/县</option>
											</select>
											<textarea name="userAddress[street]" class="input-area"
												id="Street1" placeholder="路名或街道地址，门牌号"></textarea>

											<p class="tip-msg tipMsg"></p>
										</div>
										<div class="item">
											<label>地址标签<span>*</span></label> <input type="text"
												name="userAddress[tag]" id="Tag" class="input"
												placeholder='地址标签：如"家"、"公司"。限5个字内'>

											<p class="tip-msg tipMsg"></p>
										</div>
									</div>
									<div class="ft clearfix">
										<button type="button" class="btn btn-lineDake btn-small "
											id="J_editAddrCancel">取消</button>
										<button type="button" class="btn btn-primary  btn-small"
											id="J_editAddrOk">保存</button>

									</div>
								</div>

								<!--点击弹出新增/收货地址界面end-->
								<div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>
							</div>
						</div>
						<!-- 收货地址 END-->
						<div id="checkoutPayment">
							<!-- 支付方式 -->
							<div class="xm-box">
								<div class="box-hd ">
									<h2 class="title">支付方式</h2>
								</div>
								<div class="box-bd">
									<ul id="checkoutPaymentList"
										class="checkout-option-list clearfix J_optionList">
										<li class="item selected"><input type="radio"
											name="Checkout[pay_id]" checked="checked" value="1">

											<p>
												在线支付 <span></span>
											</p></li>
									</ul>
								</div>
							</div>
							<!-- 支付方式 END-->
							<div class="xm-box">
								<div class="box-hd ">
									<h2 class="title">配送方式</h2>
								</div>
								<div class="box-bd">
									<ul id="checkoutShipmentList"
										class="checkout-option-list clearfix J_optionList">
										<li class="item selected"><input type="radio"
											data-price="0" name="Checkout[shipment_id]" checked="checked"
											value="1">

											<p>
											<h4>快递配送（免运费）</h4>
											</p></li>
										<!--  <li class="item">
                                        <input type="radio" data-price="0" name="Checkout[shipment_id]"
                                               checked="checked" value="1">

                                        <p>
                                        <h4>快递配送10元</h4>
                                        </p>
                                    </li> -->
									</ul>
								</div>
							</div>
							<!-- 配送方式 END-->
							<!-- 配送方式 END-->
						</div>


					</div>
					<div class="checkout-box-ft">
						<!-- 商品清单 -->
						<div id="checkoutGoodsList" class="checkout-goods-box">
							<div class="xm-box">
								<div class="box-hd">
									<h2 class="title">确认订单信息</h2>
								</div>
								<div class="box-bd">
									<dl class="checkout-goods-list">
										<dt class="clearfix">
											<span class="col col-1">商品名称</span> <span class="col col-2">商品单价</span>
											<span class="col col-3">购买数量</span> <span class="col col-4">小计（元）</span>
										</dt>

										<!-- <dd class="item clearfix">
                                        <div class="item-row">
                                            <div class="col col-1">
                                                <div class="g-pic">
                                                    <img src="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!40x40.jpg"
                                                         srcset="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!80x80.jpg 2x"
                                                         width="40" height="40"/>
                                                </div>
                                                <div class="g-info">
                                                    <span>小米T恤 忍者米兔双截棍 军绿 XXL</span>
                                                </div>
                                            </div>

                                            <div class="col col-2">39元</div>
                                            <div class="col col-3">1</div>
                                            <div class="col col-4">39元</div>
                                        </div>
                                    </dd> -->
									</dl>
									<div class="checkout-count clearfix">
										<!-- checkout-count-extend -->
										<div class="checkout-price">
											<ul>
												<li>订单总额：<span id="total"></span>
												</li>
												<!--                            <li>
                                                运费：<span id="postageDesc"> 0元</span>
                                            </li> -->
											</ul>
											<p class="checkout-total">
												应付总额：<span><strong id="totalPrice"></strong>元</span>
											</p>
										</div>
										<!--  -->
									</div>
								</div>
							</div>

						</div>
						<!-- 商品清单 END -->
						<input type="hidden" id="couponType" name="Checkout[couponsType]">
						<input type="hidden" id="couponValue"
							name="Checkout[couponsValue]">

						<div class="checkout-confirm">
							<input type="hidden" value="" name="oid" />
							<input type="hidden" value="" name="money" />
							<input type="hidden" value="" name="name" />
							<input type="hidden" value="" name="phone" />
							<input type="hidden" value="" name="address" />
							<input type="hidden" value="" name="aid" />
								 <a href="cart.jsp"
								class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
								 <input type="submit" class="btn btn-primary" value="立即下单"
								 />
						</div>
					</div>
			</div>

			</form>

		</div>
		<!-- 保险弹窗 -->
		<!-- 保险弹窗 -->
		<script src="../js/buyConfirm/base.min.js"></script>
		<script type="text/javascript" src="../js/buyConfirm/address_all.js"></script>
		<script type="text/javascript" src="../js/buyConfirm/checkout.min.js"></script>
	</div>
	<!--收货地址body部分结束-->
	<script src="../js/buyConfirm/jquery-1.11.1.min.js"></script>
	<script src="../js/buyConfirm/unslider.min.js" type="text/javascript"></script>
	<!-- 页面底部 -->
	<br>
	<%@include file="user_jsp/foot.jsp"%>
</body>
<script type="text/javascript">
$(function(){
	//加载当前用户的收货地址
	var url="${pageContext.request.contextPath}/UserServlet?method=viewAddress";
	var data={"uid":2};
	$.getJSON(url,data,function(res){
		if(res.length>0){
			$.each(res,function(index,obj){
			var node='<dl class="item">'+
                '<dt>'+
                '<input type="hidden" value="'+obj.aid+'"/>'+
                  '<strong class="itemConsignee">'+obj.name+'</strong>'+
        		'</dt>'+
        		'<dd>'+
            		'<p class="tel itemTel">'+obj.phone+'</p>'+
            		'<p class="itemRegion">'+obj.address+'</p>'+
        		'</dd>'+
        		'<dd style="display:none">'+
            		'<input type="radio" name="Checkout[address]" class="addressId"'+
                   'value="'+obj.aid+'">'+
        		'</dd>'+
    			'</dl>';
				$("#checkoutAddrList").prepend(node);
			});
		}
	});
	var oid=getOid();
	$.getJSON("${pageContext.request.contextPath}/UserServlet?method=buyConfirm",{"oid":oid},function(res){
		var m=parseInt(0);
		if(res.length>0){
			$.each(res,function(index,obj){
				m=m+obj.money;
				var node='<dd class="item clearfix">'+
                    '<div class="item-row">'+
                '<div class="col col-1">'+
                    '<div class="g-pic">'+
                        '<img src="../images/product/'+obj.image+'"'+
                             'srcset="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!80x80.jpg 2x"'+
                             'width="40" height="40"/>'+
                    '</div>'+
                    '<div class="g-info">'+
                        '<span>'+obj.pname+'</span>'+
                    '</div>'+
                '</div>'+
                '<div class="col col-2">'+obj.price.toFixed(2)+'</div>'+
                '<div class="col col-3">'+obj.quantity+'</div>'+
                '<div class="col col-4" class="money">'+obj.money.toFixed(2)+'</div>'+
            	'</div>'+
        		'</dd>';
        		$(".checkout-goods-list").append(node);
			});
			$("#total").html(m.toFixed(2)+"元");
			$("#totalPrice").html(m.toFixed(2)+"元");
			$("[name='money']").val(m.toFixed(2));
		}
	});
	
});
//点击选中地址后有红色边框
$("#checkoutAddrList").on("click",".item",function(){
	//$(this).find("input").val();
	$(this).addClass("selected").siblings().removeClass("selected");
	var name=$(this).find(".itemConsignee").html();
	$("[name='name']").val(name);
	var phone=$(this).find(".tel").text();
	$("[name='phone']").val(phone);
	var address=$(this).find(".itemRegion").text();
	$("[name='address']").val(address);
	var aid=$(this).find("[type='hidden']").val();
	$("[name='aid']").val(aid);
});
//保存添加的地址
$("#J_editAddrOk").on("click",function(){
	window.setTimeout(function(){
		if($(".tip-msg").text()==null||$(".tip-msg").text()==""){
			var name=$("#Consignee").val();
			var phone=$("#Telephone").val();
			var address1=$("#Provinces option:selected").text();
			var address2=$("#Citys option:selected").text();
			var address3=$("#Countys option:selected").text();
			var address4=$("#Street1").val();
			var address=address1+address2+address3+address4;
			//alert(name+"--"+phone+"--"+address);
			$(".xm-edit-addr-box").css("display","none");
			$("#J_editAddrBackdrop").css("display","none");
			var url="${pageContext.request.contextPath}/UserServlet?method=addAddress";
			var data={"name":name,"phone":phone,"address":address};
			$.getJSON(
				url,
				data,
				function(res){
					if(res.length>0){
						$("#checkoutAddrList .item").remove();
						$.each(res,function(index,obj){
						var node='<dl class="item">'+
			                '<dt>'+
			                  '<strong class="itemConsignee">'+obj.name+'</strong>'+
			        		'</dt>'+
			        		'<dd>'+
			            		'<p class="tel itemTel">'+obj.phone+'</p>'+
			            		'<p class="itemRegion">'+obj.address+'</p>'+
			        		'</dd>'+
			        		'<dd style="display:none">'+
			            		'<input type="radio" name="Checkout[address]" class="addressId"'+
			                   'value="'+obj.aid+'">'+
			        		'</dd>'+
			    			'</dl>';
							$("#checkoutAddrList").prepend(node);
						});
					}
				}
			);
		
	}},400);
	
});


//获取地址栏的oid
function getOid(){
	var url=location.href;
	var oid;
	if(url.indexOf("=")!=-1){
		oid=url.substr(url.indexOf("=")+1);
	}
	$("[name='oid']").val(oid);
	return oid;
}


</script>
</html>