<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>
    <script src="../js/bootstrap.js"></script>
    <style type="text/css">
    #orderlist{
          margin-left:40px;
          text-align: center;
          margin-top: 20px;
          font-size: 20px;
          font-family: 
          }
    </style>
  </head> 
  <body>
     <div class="x-body" >
        <form class="layui-form">
        <h1 align="center" style="font-size:40px;">订单详情</h1>
        <table  border="0"  cellpadding="0" cellspacing="0" id="orderlist" width="90%">
         <tr height="50" >
        <td width="30%" >订单编号</td>
        <td width="60%" id="oid"></td>
        </tr>   
        
         <tr height="50" >
        <td width="30%" >收货人</td>
        <td width="60%" id="uname"></td>
        </tr> 
         <tr height="50" >
        <td width="30%" >手机号</td>
        <td width="60%" id="tel"></td>
        </tr> 
         <tr height="50" >
        <td width="30%" >收货地址</td>
        <td width="60%" id="address"></td>
        </tr>  
         <tr height="50" >
        <td width="30%" >订单总价</td>
        <td width="60%" id="money"></td>
        </tr>
        <tr height="50" >
        <td width="30%" >用户id</td>
        <td width="60%" id="name"></td>
        </tr>     
        </table>
        </form>
    </div>    
  </body>
    <script>
   
    $(function () {
    	var url = location.search;
    	var oid=url.substring(1);
		var url="${pageContext.request.contextPath}/OrderServlet?method=selectOid";
		var data={"oid":oid};
		$.getJSON(url,data,function(data){									
			if(data.length>0){
				for(var i=0;i<data.length;i++){
					 var uid=data[i].uid;
					 $("#name").append(uid);
					 var name=data[i].name;
					 $("#uname").append(name);
					 var tel=data[i].phone;
					 $("#tel").append(tel);
					 var address=data[i].address;
					 $("#address").append(address);
					 var time=data[i].time;
					 $("#time").append(time);
					 var money=data[i].money;
					 $("#money").append(money);
					 var oid=data[i].oid;
					 $("#oid").append(oid);
				}
			}						 
		});
	});
    $(function(){
    	
    	$("tr:odd").css("background-color","#EFEEF0");
    });
    </script>
</html>