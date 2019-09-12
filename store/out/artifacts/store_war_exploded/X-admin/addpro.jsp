<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script  type="text/javascript" src="../js/bootstrap.js"></script>
</head>

<body>
	<div class="x-body">
		<form action="${pageContext.request.contextPath}/ProductServlet?method=add" class="form-horizontal" method="post">
			<div class="form-group" style="text-align: center;background-color: #31b0d5">
				<h4>商品添加</h4>
			</div>
			<!--商品名-->
			<div style="margin-left: 130px">
			<div class="col-md-6">
			<div class="form-group">
				<label for="" class="col-md-3 control-label">商品名</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="pname" value="" />
				</div>
			</div>
			<!--价格-->
			<div class="form-group">
				<label for="" class="col-md-3 control-label">商品价格</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="price" value=""/>
				</div>
			</div>
			
			<!--商品名-->
			<div class="form-group">
				<label for="" class="col-md-3 control-label">商品图片</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="image" value="" />
				</div>
			</div>
			<!--商品名-->
			<div class="form-group">
				<label for="" class="col-md-3 control-label">商品分类id</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="cid" value="" />
				</div>
			</div>
			<!--价格-->
			<div class="form-group">
				<label for="" class="col-md-3 control-label">商品描述</label>
				<div class="col-md-5">
					<textarea name="description" rows="3" cols="20"></textarea>
				</div>
			</div>
			</div>
			<div class="col-md-6">
			
			<!--价格-->
			<div class="form-group">
				<label for="" class="col-md-4 control-label">商品是否下架</label>
				<div class="col-md-5">
                       <select name="sold_out" style="font-size: 16px">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>				
			</div>
			</div>
			
			<!--商品名-->
			<div class="form-group">
				<label for="" class="col-md-4 control-label">商品销量</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="sales_volume" value="" />
				</div>
			</div>
			<!--价格-->
			<div class="form-group">
				<label for="" class="col-md-4 control-label">商品库存</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="inventory" value=""/>
				</div>
			</div>
			</div>
			</div>
			<!--提交 重置-->
			<div class="form-group" style="margin-left: 330px">
				<div class="col-md-6 col-md-offset-2">
					<button type="submit"  class="btn btn-primary">添加</button>
					<button type="reset" class="btn btn-info">取消</button>
				</div>
			</div>
		</form>
	</div>
</body>

</html>