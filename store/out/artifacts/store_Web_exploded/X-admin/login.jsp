<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录-YT数码</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
	<link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">YT数码管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post"  action="index.jsp" id="form" onsubmit="return submitcheck2()">
            <input name="username" placeholder="用户名"  type="text"  class="layui-input" id="name">
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input" id="pwd">
            <hr class="hr15">
            <input value="登录"  style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>


</body>
<script type="text/javascript">
  $("#form").submit(function submitcheck2(){
	  var name=$("#name").val();
	  var pwd=$("#pwd").val();
	  if(name=="admin"&&pwd=="admin"){
		  return true;
	  }else{
		  alert("账号或者密码错误");
		  return false;
	  }
  });
</script>
</html>