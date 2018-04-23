<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>车次查询</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/cccx.css">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/nav_swich.js"></script>
    <script type="text/javascript" src="js/jump.js"></script>
    <style>
	    .title{
				top:239px;
				left: 68px;
			}
    	.table-hover>tbody>tr:nth-child(odd){
			background:#EEF7F8;
		}
		.table-hover>tbody>tr:hover{
			background: #C9EAE9;
		}
		.bottom{
			margin-top:200px;
		}
    </style>
    <script type="text/javascript">
    
		$(document).ready(function(){
			var json='<%=request.getAttribute("tourjson") %>'
				var tourlist=JSON.parse(json);
				for(var i=0;i<tourlist.length;i++){
					//alert(tourlist[i].Tid);
					//var tbody=document.getElementById("CTbody");
					var num=i+1;
					var td1="<td>"+num+"</td>";
					var td2="<td>"+tourlist[i].Tid+"</td>";
					var td3="<td>"+tourlist[i].Sid+"</td>";
					var td4="<td>"+tourlist[i].Arrive+"</td>";
					var td5="<td>"+tourlist[i].Left+"</td>";
					var tdnull="<td>--</td>";
					$("#CTbody").append("<tr>"+td1+td2+td3+td4+td5+"</tr>");
				}
				if($("td").html=undefined){
					$("td").html="--";
				}
		});

	</script>
</head>
<body>
	<% 
	request.setCharacterEncoding("utf-8");	
	%>
	<!--顶部-->
	<div id="top" name = "top">
		<div class=center>
			<ul id=top_login class="list-inline">
				<li id="welcome" ><span>欢迎来到铁路订票服务网站</span></li>
				<li><span><%
					Object username=request.getSession().getAttribute("userid");
					if(session.getAttribute("userid")==null){
						//out.print("nnn");
				%>
				<a id="login" href="login.jsp">登录</a>
				</span></li>
				<li>|</li>
				<li ><span><a id="signin"  href="signin.jsp">注册</a></span></li>
				<% 
					}else{
						out.print(username);
				%>
				<li><span><a id="login_order" href="checkOrder?user=<%=request.getSession().getAttribute("userid")%>">我的订单</a></span></li>
				<li><span><a href="login.jsp">退出</a></span></li>
				<%
					}
				%>
				
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
	<!--车次表-->
	<div class="cccx_content">
		<div class="center">
			<div class="title"><span id="train"></span><span><%=request.getAttribute("Tname") %>车次时刻表</span></div>
			<div class="cc_table">
				<table class="table table-hover">
					<nav class="navbar navbar-fixed-top">
						<thead class="table_title">
							<tr>
								<td class="tt_sigle">站序</td>
								<td class="tt_sigle">车站</td>
								<td class="tt_sigle">车次</td>
								<td class="tt_sigle">到站时间</td>
								<td class="tt_sigle">离站时间</td>
							</tr>
						</thead>
					<tbody id="CTbody" style="text-align: center;">	
						
					</tbody>	
				</table>
			</div>
		</div>	
	</div>
	
	<div class="bottom">
		<div>
			<span><a href="#">关于我们</a></span><span>|</span><span><a href="#">版权声明</a></span>
		</div>
	</div>	
	<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>