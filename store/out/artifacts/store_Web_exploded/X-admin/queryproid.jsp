<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<LINK href="css/Style1.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>


</head>
<body>
	<div class="x-body">
		<form method="post" id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/ProductServlet?method=update" >
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4">
						<h4>编辑商品</h4>
						</strong>
					</td>
				</tr>
				<input type="hidden" value="${list.pid}" name="pid"/>
				<tr>
					<td width="18%" align="center"  class="ta_01">
						商品名称：
					</td>
					<td class="ta_01">
						<input type="text" name="pname" value="${list.pname}" class="bg"/>
					</td>
					
					<td width="18%" align="center"  class="ta_01">
						商品上架时间：
					</td>
					<td class="ta_01" >
						<input type="text" name="time" value="${list.time}" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center"  class="ta_01">
						商品价格：
					</td>
					<td class="ta_01">
						<input type="text" name="price" value="${list.price}" class="bg"/>
					</td>
					<td width="18%" align="center"  class="ta_01">
						是否下架：
					</td>
					<td class="ta_01">
						<select name="sold_out">
							<option value="1" <s:if test="${list.sold_out}==1"></s:if>>是</option>
							<option value="0" <s:if test="${list.sold_out}==0"></s:if>>否</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="18%" align="center"  class="ta_01">
						商品图片：
					</td>
					<td class="ta_01">
						<input type="text" name="image" value="${list.image}" class="bg"/>
					</td>
					
					<td width="18%" align="center"  class="ta_01">
						商品销量：
					</td>
					<td class="ta_01" >
						<input type="text" name="sales_volume" value="${list.sales_volume}" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center"  class="ta_01">
						所属的分类：
					</td>
					<td class="ta_01">
						<input type="text" name="cid" value="${list.cid}" class="bg"/>
					</td>
					<td width="18%" align="center"  class="ta_01">
						商品库存：
					</td>
					<td class="ta_01">
						<input type="text" name="inventory" value="${list.inventory}" class="bg"/>
					</td>
				</tr>
			
				<tr>
					<td width="18%" align="center"  class="ta_01">
						商品描述：
					</td>
					<td class="ta_01"  colspan="3">
						<textarea name="description" rows="5" cols="21"  class="bg">${list.description}</textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center"
						bgColor="#f5fafe" colSpan="4">
						<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
							&#30830;&#23450;
						</button>
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>