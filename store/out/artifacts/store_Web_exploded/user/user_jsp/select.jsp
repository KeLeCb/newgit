<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
	<link rel="stylesheet" href="../css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="../css/select_style.css">
	<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/select_script.js"></script>

</head>
<body>
	<div class="container" style="background-color: #f7f7f7">
		<div class="row">
			<div class="col-md-12">
				<ul class="select">
					<li class="select-list">
						<dl id="select1">
							<dt>系列：</dt>
							<dd class="select-all selected"><a href="#">全部</a></dd>
							<dd><a href="#">IQOO系列</a></dd>
							<dd><a href="#">Y系列</a></dd>
							<dd><a href="#">X系列</a></dd>
							<dd><a href="#">Z系列</a></dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select2">
							<dt>价格：</dt>
							<dd class="select-all selected"><a href="#">全部</a></dd>
							<dd><a href="#">1000-1500</a></dd>
							<dd><a href="#">1500-2000</a></dd>
							<dd><a href="#">2000-2500</a></dd>
							<dd><a href="#">2500-3000</a></dd>
							<dd><a href="#">3000-4000</a></dd>
							<dd><a href="#">4000以上</a></dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select3">
							<dt>运行内存：</dt>
							<dd class="select-all selected"><a href="#">全部</a></dd>
							<dd><a href="#">3GB</a></dd>
							<dd><a href="#">4GB</a></dd>
							<dd><a href="#">6GB</a></dd>
							<dd><a href="#">8GB</a></dd>
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
</body>
</html>