<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
   <meta charset="UTF-8">
    <title>欢迎页面-YT数码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>
  </head>
  
  <body>
  <form action="" method="post">
      <table class="layui-table layui-form">
           <h1>查看商品详情</h1>
        <thead>
          <tr>
            <th width="70">商品ID</th>
            <th width="70">商品名称</th>
            <th width="50">商品价格</th>
            <th width="50">商品图片</th>
            <th width="50">商品描述</th>
            <th width="50">商品上架时间</th>
            <th width="50">商品是否下架</th>
            <th width="50">商品销量</th>
            <th width="50">商品库存</th>
            <th width="50">商品分类id</th>
        </thead>
        <tbody class="x-cate" id="cate">
          
        </tbody>
      </table>
      </form>
  
  </body>
  <script type="text/javascript">
     $(function() {
    	 var url1 = location.search;
     	var pid=url1.substring(5)
		var url="${pageContext.request.contextPath}/ProductServlet?method=selectpid";
		var data={"pid":pid};
		$.getJSON(url,data,function(result){
			var $newNode=
			
			"<tr>"+
			  "<td>"+result.pid+"</td>"+
			  "<td>"+result.pname+"</td>"+
			  "<td>"+result.price+"</td>"+
			  "<td>"+
	            "<img  src='../images/product/"+result.image+"' alt=''>"+
	            "</td>"+
			  "<td>"+result.description+"</td>"+
			  "<td>"+result.time+"</td>"+
			  "<td>"+result.sold_out+"</td>"+
			  "<td>"+result.sales_volume+"</td>"+
			  "<td>"+result.inventory+"</td>"+
			  "<td>"+result.cid+"</td>"+
			"</tr>"
			
			$("#cate").append($newNode);
		})
	})
  </script>
</html>