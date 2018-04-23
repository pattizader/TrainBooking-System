<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript" src="js/nav_swich.js"></script>
	<script type="text/javascript" src="js/jump.js"></script>
	<title>用户登录</title>
	<style type="text/css">
	p{
		display:inline;
		color:#F92B40;
		font-size:12px;
		top:27px;
		position:relative;
		margin-left:252px;
	}
	</style>
</head>
<body>
	<!--顶部-->
	<div id="top" name = "top">
		<div class="center">
			<ul id="top_login" class="list-inline">
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
					<li class="selection inActive"><a href="index.html">首页</a></li>
					<li class="selection"><a href="##">车票预订</a></li>
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
	<!--登录面板-->
	<div class="login_content">
		<div class="center">
			<div class="login_panel">
				<div class="login_icon"></div>
				<div class="login_txt">
					<div class="login_title">用户登录</div>
						<form action="loginServlet" method="post">
							<div class="login input-group">
								<span class="input-group-addon glyphicon glyphicon-user"></span>
								<input type="text" name="login" placeholder="用户登录">
							</div>
							<div class="login password input-group">
								<span class="input-group-addon glyphicon glyphicon-lock"></span>
								<input type="password" name="paw" placeholder="输入密码">
							</div>
							<%
							if(request.getAttribute("fail")!=null){
								out.print(request.getAttribute("fail"));
							}
							%>
							<div class="submit">
								<button type="submit" class="btn btn-primary" >登录</button>
							</div>
						</form>
						<span style="margin-left:298px;"><a href="signin.jsp">新用户注册</a></span>
				</div>
			</div>
		</div>
	</div>
	<!--底部-->
	<div class="login_bottom">
		<div>
			<span><a href="#">关于我们</a></span><span>|</span><span><a href="#">版权声明</a></span>
		</div>
	</div>


	<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>