<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>票价查询</title>
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
    <style type="text/css" media="screen">
    	.autoline{
    		word-break: break-all;
    	}	
		.table{
			width: 90%;
			margin: auto;
		}
		.title{
			top:239px;
			left: 68px;
		}
		.table>thead>tr>td{
			width: 80px;
		}
		.btn-group-lg>.btn, .btn-lg{
			padding: 4px 6px;
			font-size: 15px;
		}
		.bottom{
			margin-top:200px;
		}
    </style>
    <script type="text/javascript">
    
		$(document).ready(function(){
				var json='<%=request.getAttribute("trainjson") %>'
				var startS="<%=request.getAttribute("startS") %>"
				var arriveS="<%=request.getAttribute("arriveS") %>"
			
				var trainlist=JSON.parse(json);
				for(var i=0;i<trainlist.length;i++){
					//alert(tourlist[i].Tid);
					//var tbody=document.getElementById("CTbody");
					var num=i+1;
					var td1="<td class='tt_sigle' style='vertical-align:middle;'>"+trainlist[i].Tname+"</td>";
					var td2="<td class='tt_sigle autoline'>"+startS+"<br>"+arriveS+"</td>";
					var td3="<td class='tt_sigle autoline'>"+trainlist[i].Start+"<br>"+trainlist[i].Arrive+"</td>";
					var td4="<td class='tt_sigle' style='vertical-align:middle;'>"+trainlist[i].Price+"</td>";
					var td5="<td class='tt_sigle' style='vertical-align:middle;''>"+trainlist[i].Ticket+"</td>";
					var td6="<td class='tt_sigle td_button' style='vertical-align:middle;'><a class='td_a btn btn-info btn-lg'><span class='glyphicon glyphicon-ok'></span> 预订</a></td>";
					var a="<a href='#' class='td_a btn btn-info btn-lg'></a>";
					$("#TBody").append("<tr>"+td1+td2+td3+td4+td5+td6+"</tr>");
					
				}
				$(".td_a").click(findRow);
		});
		function findRow(){
			var rows=$(this).parent("td").prevAll();
			var ticket=$(rows[0]).text();
			var price=$(rows[1]).text();
			var time=$(rows[2]).html();
			var station=$(rows[3]).html();
			var tname=$(rows[4]).text();
			
			$("#tname").val(tname);
			$("#station").val(station);
			$("#time").val(time);
			$("#price").val(price);
			$("#ticket").val(ticket);
			$("#transform").submit();
		}

	</script>
</head>
<body>
	<% 
	request.setCharacterEncoding("utf-8");
    Object setoff=request.getAttribute("setoffdate");
	//System.out.print(setoff);
	//request.setAttribute("setoff",123); 
	
	//out.println(request.getParameter("i"));
	//Integer index=request.getParameter("i");
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
			<div class="title"><span id="train"></span><span>出发日期：<%=request.getAttribute("setoffdate")%></span></div>
			<div class="cc_table">
				<table class="table table-hover">
					<nav class="navbar navbar-fixed-top">
						<thead class="table_title">
							<tr>
								<td class="tt_sigle" style="vertical-align:middle;"><b>车次</b></td>
								<td class="tt_sigle autoline" ><b>出发站</b><br><b>到达站</b></td>
								<td class="tt_sigle autoline" ><b>出发时间</b><br><b>到站时间</b></td>
								<td class="tt_sigle" style="vertical-align:middle;"><b>票价</b></td>
								<td class="tt_sigle" style="vertical-align:middle;"><b>余票</b></td>
								<td class="tt_sigle" style="vertical-align:middle;"><b>预订</b></td>
							</tr>
						</thead>
					<tbody id="TBody" style="text-align: center;">	
						
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
	<form id="transform" action="order.jsp" method="post">
		<input id="tname" type="hidden" name="tname" value="">
		<input id="station" type="hidden" name="station" value="">
		<input id="time" type="hidden" name="time" value="">
		<input id="price" type="hidden" name="price" value="">
		<input id="ticket" type="hidden" name="ticket" value="">
		<input id="a" type="hidden" name="a" value=<%=setoff %>>
	</form>
	<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>