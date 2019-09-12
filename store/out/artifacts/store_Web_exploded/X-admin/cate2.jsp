<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so layui-form-pane">
          <input class="layui-input" placeholder="分类名" name="cate_name">
          
          	<button class="layui-btn" onclick="x_admin_show('编辑','addpro.jsp');return false;" lay-submit="" lay-filter="sreach"><i class="layui-icon">
          	</i>增加</button>
         
        </form>
      </div>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <span class="x-right" style="line-height:40px"  id="span"></span>
      <table class="layui-table layui-form" style="text-align: center;">
        <thead>
          <tr style="text-align: center;">
            <th width="20">
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <td width="250">商品名</td>
            <td width="300">商品图片</td>
            <td width="50">商品价格</td>
            <td width="50">商品数量</td>
            <td width="250">操作</td>
        </thead>
        <tbody class="x-cate" id="cate">
            
        </tbody>
      </table>
    </div>
   
  </body>
 <script>
       $(function() {
		var url="${pageContext.request.contextPath}/ProductServlet?method=selectproducts";
		$.getJSON(url,function(result){
			var num=result.length;
			if (result.length>0) {
				for (var i = 0; i < result.length; i++) {
					var $newNode="<tr cate-id='1+i' fid='i' >"+
			            "<td>"+
		              "<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'>"+
		              "<i class='layui-icon'>"+"</i>"+"</div>"+
		            "</td>"+
		            "<td>"+result[i].pname+"</td>"+
		            "<td>"+
		            "<img  src='../images/product/"+result[i].image+"' alt=''>"+
		            "</td>"+
		            "<td>"+
		            result[i].price
		            +"</td>"+
		            "<td>"+result[i].inventory+"</td>"+
		            "<td class='td-manage'>"+
		              "<button class='layui-btn layui-btn layui-btn-xs'>"+
		                   "<i class='layui-icon'>"+"</i>"+
		                   "<a href='${pageContext.request.contextPath}/ProductServlet?method=selectpid1&&pid="+result[i].pid+"'>编辑</a>"+"</button>"+
		              "<button  class='layui-btn layui-btn-warm layui-btn-xs'>"+
		                    "<i class='layui-icon'>"+"</i>"+
		                    "<a href='${pageContext.request.contextPath}/X-admin/cate.jsp?pid="+result[i].pid+"'>查看</a>"+"</button>"+
		              "<button class='layui-btn-danger layui-btn layui-btn-xs'  href='javascript:'>"+
		                    "<i class='layui-icon'>"+"</i>"+
		                    "<a href='${pageContext.request.contextPath}/ProductServlet?method=delete&&pid="+result[i].pid+"'>删除</a>"+"</button>"+
		            "</td>"+ 
		          "</tr>";
		          $("#cate").append($newNode);
		          var node="当前所有商品："+num;
				}
				$("#span").append(node);
			}else{
				alert("没有用户数据")
			}
		})
       })
    </script>
</html>