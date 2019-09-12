<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1 , user-scalable=no">
<title></title>
<link rel="stylesheet" href="../css/bootstrap.css" />
<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/gVerify.js"></script>
</head>
<body>
	<div class="container" style="width: 90%">
		<!-- 用户登录界面 -->
		<form action="index.jsp" class="form-horizontal" id="myform"
			onsubmit="return submitcheck()">
			<div class="modal" id="modal">
				<div class="modal-dialog" style="width: 35%">
					<!--  -->
					<div class="modal-content" id="u">
						<div class="modal-header" style="border: 0">
							<button class="close" data-dismiss="modal">&times;</button>
							<p style="color: #337AB7; text-align: center; font-size: 25px">Y
								T</p>
							<p style="text-align: center">用户登陆</p>
						</div>
						<!--用户名界面-->
						<div class="modal-body">
							<!--  用户名 -->
							<div class="form-group">
								<label for="" class="col-md-3 control-label">用户名</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="username"
										placeholder="请输入用户名" id="username" value="" /> <span
										id="userspan" style="font-size: 2px;"></span>
								</div>
							</div>
							<!--密码 -->
							<div class="form-group">
								<label for="" class="col-md-3 control-label">密码</label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="spassword"
										placeholder="请输入密码" id="spassword" /> <span id="spwdspan"
										style="font-size: 2px;"></span>
								</div>
							</div>
							<!--验证码 -->
							<div class="form-group">
								<label for="" class="col-md-3 control-label">验证码</label>
								<div class="col-md-3">
									<input type="text" class="form-control" name="ppassword"
										id="code_input" /> <span id="yanzhengma"
										style="font-size: 0.5px"></span>
								</div>
								<div id="v_container" style="width: 80px; height: 38px"
									class="col-md-5"></div>
							</div>
							<!-- 自动登陆 -->
							<!-- <div class="form-group">
								<div class="col-md-10" style="margin-top: -10px">
									<div class="checkbox">
										<label style="margin-left: 100px"> <input
											type="checkbox" name="auto" value="auto" /> 自动登陆
										</label>
									</div>
								</div>
							</div> -->
						</div>
						<div class="modal-footer" style="border: 0">
							<!--提交验证-->
							<div class="form-group" style="margin-top: -30px;">
								<div class="col-md-10 ">
									<button type="submit" class="btn btn-primary"
										style="width: 90%" id="login" name="login">登陆</button>
								</div>
							</div>
							<a href="" id="wj" data-toggle="modal" data-dismiss="modal"
								data-target="#modal22">忘记密码</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=""
								id="l_register" data-toggle="modal" data-target="#modal11"
								data-dismiss="modal">立即注册</a>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- 邮箱找回密码界面 -->
		<form action="UserServlet" class="form-horizontal" id="emailform"
			onsubmit="return submitchecks()" method="post">
			<div class="modal" id="modal22">
				<div class="modal-dialog" style="width: 400px">
					<div class="modal-content">
						<div class="modal-header" style="border: 0">
							<button class="close" data-dismiss="modal">&times;</button>
							<h3 style="color: #337AB7; text-align: center">Y&nbsp&nbspT</h3>
							<p style="text-align: center">通过绑定邮箱找回密码</p>
						</div>
						<!--邮箱界面-->
						<div class="modal-body">
							<!-- email邮箱-->
							<div class="form-group">
								<label for="" class="col-md-2 control-label"></label>
								<div class="col-md-8">
									<input type="text" class="form-control"
										placeholder="请输入您的email邮箱" name="semail" id="semail"
										onblur="semailcheck()" /> <span id="semailspan"
										style="font-size: 2px;"></span>
								</div>
							</div>
							<!-- email验证码-->
							<div class="form-group">
								<label for="" class="col-md-2 control-label"></label>
								<div class="col-md-5">
									<input type="text" class="form-control" placeholder="验证码"
										name="semailma" id="semailma" onblur="semailmacheck1()" /> <span
										id="semailmaspan" style="font-size: 2px;"></span>
								</div>
								<input type="button" onclick="sbuttonclick()" id="sbutton"
									value="获取邮箱验证码" />
							</div>
						</div>
						<div class="modal-footer" style="border: 0">
							<!--完成验证-->
							<div class="form-group" style="margin-top: -10px;">
								<label for="" class="col-md-1 control-label"></label>
								<div class="col-md-9">
									<a href="" data-toggle="modal" data-dismiss="modal"
										data-target="" onclick="aclick()" id="a1"><button
											type="submit" class="btn btn-primary" style="width: 90%">下一步</button></a>
								</div>
							</div>
							<span id="" style="font-size: 2px;">邮件可能会有延时，请耐心等待....</span>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--重置密码 -->
		<form
			action="${pageContext.request.contextPath}/UserServlet?method=password"
			class="form-horizontal" id="resetform"
			onsubmit="return submitcheck5()" method="post">
			<div class="modal" id="modal33">
				<div class="modal-dialog" style="width: 400px">
					<div class="modal-content" id="e">
						<div class="modal-header" style="border: 0">
							<button class="close" data-dismiss="modal">&times;</button>
							<h3 style="color: #337AB7; text-align: center">Y&nbsp&nbspT</h3>
							<p style="text-align: center">修改密码</p>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="" class="col-md-2 control-label"></label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="请输入新密码"
										name="ipassword" id="ipassword" onblur="ipasswordcheck()" />
									<span id="" style="font-size: 2px;">密码必须为6位字符以上</span>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-2 control-label"></label>
								<div class="col-md-8">
									<input type="text" class="form-control" placeholder="请再次输入密码"
										name="opassword" id="opassword" onblur="opasswordcheck()" />
									<label for="" class="col-md-2 control-label"></label>
								</div>
							</div>
						</div>
						<div class="modal-footer" style="border: 0; margin-top: 25px">
							<div class="form-group" style="margin-top: -30px;">
								<label for="" class="col-md-1 control-label"></label>
								<div class="col-md-9 ">
									<button type="submit" class="btn btn-primary"
										style="width: 90%" id="login2">完成</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="container" style="width: 100%">
		<!--用户注册界面  -->
		<form role="form" class="form-horizontal"
			onsubmit="return submitcheck()" id="form"
			action="${pageContext.request.contextPath}/UserServlet?method=login"
			method="post">
			<div class="modal fade" id="modal11">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<p class="modal-title">用户注册</p>
						</div>
						<div class="modal-body">
							<!--用户名-->
							<div class="form-group">
								<label for="" class="control-label col-md-2">用户名<span
									style="color: red">*</span></label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入用户名"
										name="uname" id="uname" onblur="unamecheck()" />
								</div>
								<label for="" class="control-label col-md-3" id="unamelabel"></label>
							</div>
							<!--用户昵称-->
							<div class="form-group">
								<label for="" class="control-label col-md-2">用户昵称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入用户昵称"
										name="name" id="name" />
								</div>
								<label for="" class="control-label col-md-3" id="namelabel"></label>
							</div>
							<!--密码-->
							<div class="form-group">
								<label for="" class="col-md-2 control-label">密码 <span
									style="color: red">*</span></label>
								<div class="col-md-6">
									<input type="password" class="form-control" placeholder="请输入密码"
										name="password" id="password" onblur="passwordcheck()" />
								</div>
								<label for="" class="control-label col-md-3" id="passwordlabel"></label>
							</div>
							<!--确认密码-->
							<div class="form-group">
								<label for="" class="col-md-2 control-label">确认密码 <span
									style="color: red">*</span></label>
								<div class="col-md-6">
									<input type="password" class="form-control" placeholder="请确认密码"
										name="upassword" id="upassword" onblur="upasswordcheck()" />
								</div>
								<label for="" class="control-label col-md-3 "
									id="upasswordlabel"></label>
							</div>
							<!--  性别 -->
							<div class="form-group">
								<label for="" class="col-md-2 control-label">性别 </label>
								<div class="col-md-6">
									<label for="" class="radio-inline"> <input type="radio"
										value="男" name="gender" />男
									</label> <label for="" class="radio-inline"> <input
										type="radio" value="女" name="gender" />女
									</label>
								</div>
							</div>
							<!-- 生日 -->
							<div class="form-group">
								<label for="" class="col-md-2 control-label">生日</label>
								<div class="col-md-3">
									<select name="year" class="form-control cos">
										<option value="">--年--</option>
										<%
											Date date = new Date();
											SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
											String now1 = simpleDateFormat.format(date);
											int now = Integer.parseInt(now1);

											for (int i = now; i > 1950; i--) {
										%>
										<option value="<%=now%>"><%=now%></option>
										<%
											now--;
											}
										%>
									</select>
								</div>
								<div class="col-md-2">
									<select name="month" class="form-control cos">
										<option value="">--月--</option>
										<%
											for (int i = 12; i > 0; i--) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="col-md-2">
									<select name="day" class="form-control cos">
										<option value="">--日--</option>
										<%
											for (int i = 31; i > 0; i--) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<!--email-->
							<div class="form-group">
								<label for="" class="col-md-2 control-label">email <span
									style="color: red">*</span></label>
								<div class="col-md-6">
									<input type="text" class="form-control"
										placeholder="请输入您的email" name="email" id="email"
										onblur="emailcheck()" />
								</div>
								<label for="" class="control-label col-md-3" id="emaillabel"></label>
							</div>
							<!-- email验证码 -->
							<div class="form-group" id="emaildiv">
								<label for="" class="col-md-2 control-label"> </label>
								<div class="col-md-5">
									<input type="text" class="form-control"
										placeholder="请输入您的email验证码" name="emailma" id="emailma"
										onblur="emailpancheck()" />
								</div>
								<input type="button" value="获取邮箱验证码" onclick="buttonClick()" />

							</div>
							<!--俩次错误判定  -->
							<div class="form-group" id="emailpan">
								<label for="" class="col-md-2 control-label"> </label>
								<div class="col-md-5">
									<span>验证码输入错误</span>
								</div>
							</div>
							<!-- 提示语句 -->
							<div class="form-group">
								<label for="" class="col-md-2 control-label"></label>
								<div class="col-md-6">
									<span style="color: red">* 为必填项，其他可为空</span>
								</div>
							</div>
							<!-- 提交  重置 -->
							<div class="modal-footer">
								<div class="col-md-4 col-lg-offset-3">

									<button class="btn btn-default" type="submit" id="r_submit">提交</button>
									<button class="btn btn-warning" type="reset">重置</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	/* 模态框的交互 */
	$("#wj").click(function() {
		$("#myform").hide();
	});
	$("#register").click(function() {

		$("#myform").hide();
	});
	$("#emaildiv").hide();
	$("#emailpan").hide();
	$("#email").focus(function() {
		$("#emaildiv").show();
	});
	/*用户名验证*/
	var rl = false; // 判定用户名是否存在
	$("#username").blur(function() {
		namecheck();
	});
	function namecheck() {
		var obj = $("#username").val();
		if (obj == null || obj == "") {
			$("#userspan").html("用户名不能为空").css("color", "red");
			return rl;
		} else {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/UserServlet?method=UserLogin",
						data : {
							"username" : obj
						},
						success : function(res) {
							rl = res;
							if (rl.length == 7) {
								$("#userspan").html("用户名不存在").css("color",
										"red");
								rl = false;
								return rl;
							} else {
								rl = true;
								return rl;
							}
						}
					});

		}
	}

	/*密码验证*/
	var rk = false;
	$("#spassword").blur(function() {
		spwdcheck();
	});
	function spwdcheck() {
		var obj = $("#spassword").val();
		var obj1 = $("#username").val();
		if (obj == null || obj == "") {
			$("#spwdspan").html("密码不能为空").css("color", "red");
			return rk;
		} else {
			$.ajax({
						url : "${pageContext.request.contextPath}/UserServlet?method=passwordLogin",
						data : {
							"username" : obj1,
							"spassword" : obj
						},
						success : function(res) {
							if (res.length == 6) {
								rk = true;

							} else {
								rk = false;
							}
							return rk;
						}
					});
		}
	}
	/*验证码*/
	var verifyCode = new GVerify("v_container");
	function code_flag() {
		var res = verifyCode
				.validate(document.getElementById("code_input").value);
		if (res) {
			return true;
		} else {
			return false;
		}
	};

	/*验证码非空验证*/
	$("#code_input").blur(function() {
		codecheck();
	});
	function codecheck() {
		var obj = $("#code_input").val();
		if (obj == null || obj == "") {
			$("#yanzhengma").html("验证码不能为空").css("color", "red");
			return false;
		} else {
			var obj4 = code_flag();
			if (!obj4) {
				$("#yanzhengma").html("验证码错误").css("color", "red");
				return false;
			}
			return true;
		}
	}
	/*表单验证 */
	$("#myform")
			.submit(
					function submitcheck() {
						var obj3 = codecheck();
						var uname = $("#username").val();
						var password = $("#spassword").val();
						var name=$("#name").val();
						var auto = $("#auto").val();
						if (rl && rk && obj3) {
							//alert("登录成功");
							$.ajax({
								url : "${pageContext.request.contextPath}/UserServlet?method=session",
								data : {
									"uname" : uname,
									"name":name,
									"password" : password,
								},
								success : function(res) {
								}

							});
							window.location.href="http://localhost:8080/store/user/index.jsp";
							return true;
						} else if (rl == true && rk == false) {
							alert("用户名或密码输入错误");
							$("[name=username]").val("");
							$("[name=spassword]").val("");
							$("[name=ppassword]").val("");
							return false;
						} else {
							alert("登录失败");
							$("[name=username]").val("");
							$("[name=spassword]").val("");
							$("[name=ppassword]").val("");
							return false;
						}
					});

	/*用户找回密码的页面判定  */
	/*邮箱验证*/
	var rd = false;
	function semailcheck() {

		var obj = $("#semail").val();
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		var uemail;
		$
				.ajax({
					url : "${pageContext.request.contextPath}/UserServlet?method=uemail",
					data : {
						"semail" : obj
					},
					success : function(email) {
						uemail = $.trim(email);
						if (obj == null || obj == "") {
							$("#semailspan").html("邮箱不能为空").css("color", "red");
							return rd;
						} else if (!reg.test(obj)) {
							$("#semailspan").html("邮箱格式不正确")
									.css("color", "red");
							return rd;
						} else if (uemail == "true") {
							$("#semailspan").html("√").css("color", "green");
							rd = true;
							return rd;
						} else {
							$("#semailspan").html("邮箱不存在请先注册").css("color",
									"red");
							return rd;
						}

					}

				});

	};
	/*用户找回密码点击事件调用邮箱方法  */
	var ma1; //用于接收找回密码的邮箱验证码
	var rb = false;
	function sbuttonclick() {
		var da = $("#semail").val();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/UserServlet?method=semail",
					data : {
						"semail" : da
					},
					success : function(result) {
						ma1 = $.trim(result);
					}
				});

	};
	/*邮箱验证码的判定  */
	function semailmacheck1() {
		var obj = $("#semailma").val();
		if (obj == null || obj == "") {
			$("#semailmaspan").html("验证码不能为空").css("color", "red");
			return rb;
		} else if (obj == ma1) {
			rb = true;
			return rb;
		}
		alert(rb + "222");
	};
	/*找回密码的综合判定  */
	function aclick() {
		var obj1 = rb;
		var obj2 = rd;
		if (obj1 && obj2) {
			$("#a1").attr("data-target", "#modal33");
			return true;
		} else {
			$("#a1").attr("data-target", "#modal22");
			alert("验证码输入错误");
			return false;
		}
	};
	/*找回密码的修改判定  */
	/*  function ipasswordcheck(){
		var obj = $("#ipassword").val();
		var reg = /^[a-zA-Z0-9_]{6,18}$/;
		if (obj == null || obj == "") {
			$("#ipassword").html("密码不能为空").css("color", "red");
			return false;
		} else if (!reg.test(obj)) {
			$("#ipassword").html("密码至少为6位").css("color", "red");
			return false;
		} else {
			$("#ipasswordlabel").html("√").css("color", "green");
			return true;
		}
	} */

	/*找回密码时俩次密码 修改确认  */
	/* var rq=false;
	var ma2;
	function opasswordcheck(){
		var obj = $("#ipassword").val();
		var obj1 = $("#opassword").val();
		if(obj==obj1){
			return true;
		}else{
			return false;
		}
		
	} */
	/*如果用户修改成功则调回主界面  */
	$("#resetform")
			.submit(
					function submitcheck5() {
						var da = $("#semail").val();
						var pwd = $("#ipassword").val();
						$
								.ajax({
									url : "${pageContext.request.contextPath}/UserServlet?method=password",
									data : {
										"semail" : da,
										"opassword" : pwd
									},
									success : function(res) {
										if (res) {
											alert("修改成功");
											window.location.href = "index.jsp";
										}
									}
								});
					});

	/*用户注册的判定  */
	var rs = false;
	var ma; // 用于接收 邮箱验证码
	/* 用户昵称的判定 */
	function unamecheck() {
		var obj = $("#uname").val();
		var reg = /^[a-zA-Z0-9_]{3,13}$/;
		var uname;
		$
				.ajax({
					url : "${pageContext.request.contextPath}/UserServlet?method=uname",
					data : {
						"uname" : obj
					},
					success : function(name) {
						uname = $.trim(name);

						if (obj == null || obj == "") {
							$("#unamelabel").html("用户名不能为空")
									.css("color", "red");
							return rs;
						} else if (!reg.test(obj)) {
							$("#unamelabel").html("用户名至少为3位").css("color",
									"red");
							return rs;
						} else if (uname == "true") {
							$("#unamelabel").html("用户名已拥有").css("color", "red");
							return rs;
						} else {
							$("#unamelabel").html("√").css("color", "green");
							rs = true;
							return rs;
						}

					}

				});

	};
	/* 密码的验证 */
	function passwordcheck() {
		var obj = $("#password").val();
		var reg = /^[a-zA-Z0-9_]{6,18}$/;
		if (obj == null || obj == "") {
			$("#passwordlabel").html("密码不能为空").css("color", "red");
			return false;
		} else if (!reg.test(obj)) {
			$("#passwordlabel").html("密码至少为6位").css("color", "red");
			return false;
		} else {
			$("#passwordlabel").html("√").css("color", "green");
			return true;
		}
	};
	/*确认密码的验证  */
	function upasswordcheck() {
		var obj = $("#upassword").val();
		var obj1 = $("#password").val();
		var reg = /^[a-zA-Z0-9_]{6,18}$/;
		if (obj == null || obj == "") {
			$("#upasswordlabel").html("密码不能为空").css("color", "red");
			return false;
		} else if (obj == obj1) {
			$("#upasswordlabel").html("√").css("color", "green");
			return true;
		} else {
			$("#upasswordlabel").html("俩次输入密码不一致").css("color", "red");
			return false;
		}
	};
	/*邮箱的验证  */
	function emailcheck() {
		var obj = $("#email").val();
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if (obj == null || obj == "") {
			$("#emaillabel").html("邮箱不能为空").css("color", "red");
			return false;
		} else if (!reg.test(obj)) {
			$("#emaillabel").html("邮箱格式不正确").css("color", "red");
			return false;
		} else {
			$("#emaillabel").html("√").css("color", "green");
			return true;
		}
	};
	/*点击事件调用邮箱方法  */
	var rc = false;
	function buttonClick() {
		var da = $("#email").val();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/UserServlet?method=email",
					data : {
						"email" : da
					},
					success : function(result) {
						ma = $.trim(result);
					}

				});
	};
	/*邮箱验证码的判定  */
	function emailpancheck() {
		var obj = $("#emailma").val();
		if (obj == null || obj == "") {
			$("#emailpan").show();
			return rc;
		} else if (obj == ma) {
			rc = true;
			return rc;
		} else {
			$("#emailpan").show();
			return rc;
		}
	}

	$("#form").submit(function submitcheck() {
		var rs1 = rs;

		var rs2 = passwordcheck();

		var rs3 = upasswordcheck();

		var rs4 = emailcheck();

		var rs5 = rc;
		if (rs1 && rs2 && rs3 && rs4 && rs5) {
			alert("注册成功");
			return true;
		} else {
			alert("注册失败");
			return false;
		}
	});
</script>
</html>