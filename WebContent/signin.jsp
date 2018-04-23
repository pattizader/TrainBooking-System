<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>用户注册</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/signin.css">
	<script type="text/javascript" src="js/nav_swich.js"></script>
	<script type="text/javascript" src="js/signCheck.js"></script>
	<script type="text/javascript" src="js/jump.js"></script>
</head>
<body>
	<!--顶部-->
	<div id="top" name = "top">
		<div class=center>
			<ul id=top_login class="list-inline">
				<li id="welcome" ><span>欢迎来到铁路订票服务网站</span></li>
				<li><span><a id="login" href="login.jsp">登录</a></span></li>
				<li>|</li>
				<li ><span><a id="signin"  href="signin.jsp">注册</a></span></li>
				<li><span><a id="login_order" href="#">订单查询</a></span></li>
			</ul>
		</div>
	</div>	
	<!--顶部导航栏-->
	<div class="top_navigator">
		<div class="center">
			<div id="top_nav" class="navbar navbar-default" role="navigation">	
				<ul class="nav nav-pills navbar-navr">
					<li class="selection inActive"><a href="index.jsp">首页</a></li>
					<li class="selection"><a href="guide.jsp">车票预订</a></li>
					<li id="dropdown" class="selection dropdown">
						<a href="##" data-toggle="dropdown" class="dropdown-toggle">出行向导</a>
						<ul class="dropdown-menu">
							<li><a onclick="ulrHtml(0)">票价查询</a></li>
							<li><a onclick="ulrHtml(1)">车次查询</a></li>
							<li><a onclick="ulrHtml(2)">余票查询</a></li>
							<li><a onclick="ulrHtml(3)">火车时刻表</a></li>
							<li><a href="#">代售点查询</a></li>
						</ul>
					</li>
					<li class="selection"><a href="##">订餐服务</a></li>
					<li class="selection"><a href="##">接续换乘</a></li>			
					<li class="selection"><a href="##">信息服务</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="signin_content">
		<div class="center">
			<div class="location">
					<span>您现在所在的位置：</span><span> > </span><span><a href="index.html">首页</a></span><span> > </span><span>注册</span>
			</div>
			<div class="signin_panel">
				<div class="signin_top"><span>账户信息</span></div>	
				<div class="signin_form">
					<form action="UserServlet" method="post" onsubmit="return check(this)">
						<table class="signin_table" style="border-collapse:separate; border-spacing:0px 10px;">
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>用户名</span></td>
								<td><span><input id="txtUser" type="text" name="user" value=""></span></td><td><span id="tips_username" style="margin-left: 50px;color:#F78639;font-size:10px;">用户名由5-18位字符组成</span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>登录密码</span></td>
								<td><span><input id="txtPaw" type="password" name="paw" value=""></span></td><td><span id="tips_password" style="margin-left:48px;color:#F78639;font-size:10px;">密码必须由6-18个字符组成，且必须包含字母、数字、标点符号</span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>确认密码</span></td>
								<td><span><input id="txtRpt" type="password" name="check" value=""></span></td><td><span id="tips_repeat" style="margin-left: 50px;color:#F78639;font-size:10px;"></span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>姓名</span></td>
								<td><span><input id="txtName" type="text" name="name" value=""></span></td><td><span id="tips_name" style="margin-left: 50px;color:#F78639;font-size:10px;">请填写真实姓名</span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>证件类型</span></td>
								<td>
									<span >
										<select name="idKinds" style="height: 30px; width:174px;">
											<option>二代居民身份证</option>
											<option>港澳通行证</option>
											<option>台湾通行证</option>
											<option>护照</option>
										</select>
									</span>
								</td>
								<td><span style="margin-left: 50px;color:#F78639"></span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>证件号</span></td>
								<td><span><input id="idCard" type="text" name="idCard" value=""></span></td><td><span id="tips_idcard" style="margin-left: 50px;color:#F78639;font-size:10px;">请填写正确的证件号</span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red"></span></td><td><span>邮箱</span></td>
								<td><span><input type="text" name="email" value=""></span></td><td><span style="margin-left: 50px;color:#F78639;font-size:10px;"></span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td><td><span>手机号码</span></td>
								<td><span><input id="txtPhn" type="text" name="phone" value=""></span></td><td><span id="tips_phone" style="margin-left: 50px;color:#F78639;font-size:10px;">请正确填写手机号码</span></td>
							</tr>
							<tr class="table_style">
								<td><span class="red">*</span></td>
								<td><span>旅客类型</span></td>
								<td>
									<span>
										<select name="tourist" style="height: 30px; width:174px;">
											<option>成人</option>
											<option>儿童</option>
											<option>学生</option>
											<option>残疾军人</option>
										</select>
									</span>
								</td>
								<td><span style="margin-left: 50px;color:#F78639"></span></td>
							</tr>
						</table>
						<div class="signin_submit">
							<button id="sub_btn" type="submit" class="btn btn-primary">提交</button>
							<button type="reset" class="btn btn-primary" >重置</button>
						</div>
					</form>	
				</div>
			</div>
		</div>	
	</div>




	<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>