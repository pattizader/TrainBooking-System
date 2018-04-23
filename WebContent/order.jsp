<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>订单查询</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/cccx.css">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/nav_swich.js"></script>
    <script type="text/javascript" src="js/jump.js"></script>
    <style type="text/css">
    .s_center{
    	top:250px;
    	position:relative;
    }
    .s_title{
    	margin-left:110px;
    	color:#FC5B62;
    	font-size:17px;
    	margin-top:20px;
    	background:#E4EDF6;
    }
    .cp_table{
    	width:80%;
    	margin-left:100px;
    	margin-top:35px;
    }
    .cp_table table tr{
    	height:40px;
    }
    .tt_sigle{
    	width:190px;
    }
    .table-bordered>tbody>tr>td:nth-child(even){
    	text-align:center;
    	font-weight:550;
    }
    .submit_btn{
    	margin-top:70px;
    	text-align:center;
    }
    .submit_btn button{
    	margin-right:70px;
    }
    .input_area{
    	text-align:center;
    }
    .input_area span{
    	margin-right:12px;
    }
    .input_area input{
    	height:33px;
    	margin-right:40px;
    }
    .bottom{
			margin-top:100px;
		}
    </style>
</head>
<body>
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
	<div class="cpyd_content">
		<div class="center">
			<div class="s_center">
				<span class="s_title">请核对您的各项信息，以确保您能及时地、准确地预定到您所需车次的车票！</span>
				<%
				String[] stationarray=request.getParameter("station").split("<br>");
				String[] timearray=request.getParameter("time").split("<br>");
				String startS=stationarray[0];
				String startT=timearray[0];
				String arriveS=stationarray[1];
				String arriveT=timearray[1];
				
				
				%>
				<form action="addOrder" method="post">
					<div class="cp_table">
						<table class="table table-bordered" >
							<tr>
								<td class="tt_sigle">车次</td>
								<td class="tid"><%out.print(request.getParameter("tname"));%></td>
								<td class="tt_sigle">车票数量</td>
								<td class="ticket_num">1</td>   
							</tr>
							<tr>
								<td class="tt_sigle">出发站</td>
								<td class="startS"><%=startS%></td>
								<td class="tt_sigle">目的站</th>
								<td class="arriveS"><%=arriveS %></td>
							</tr>
							<tr>
								<td class="tt_sigle">出发时间</td>
								<td class="startT"><%=startT %></td>
								<td class="tt_sigle">到站时间</td>
								<td class="arriveT"><%=arriveT %></td>
							</tr>
							<tr>
								<td class="tt_sigle">票价</td>
								<td class="ticket_p"><%out.print(request.getParameter("price")); %></td>
								<td class="tt_sigle">出发日期</td>
								<td class="date"><%out.print(request.getParameter("a")); %></td>
							</tr>
						</table>
						<div class="input_area">
							<span>乘车人&nbsp:</span><input type="text" name="passenger" placeholder="请输入乘车人真实姓名">
							<span>联系方式&nbsp:</span><input type="text" name="phonecall" placeholder="请输入乘车人联系方式">
						</div>
						<div class="submit_btn">
							<button type="submit" class="btn btn-primary">确认</button>
							<a href="index.jsp" class="btn btn-primary" role="button">取消</a>
						</div>			   	
					</div>
					<input type="hidden" name="tid" value=<%=request.getParameter("tname") %>>
					<input type="hidden" name="ticket_num" value="1">
					<input type="hidden" name="startS" value=<%=startS%>>
					<input type="hidden" name="arriveS" value=<%=arriveS %>>
					<input type="hidden" name="startT" value=<%=startT %>>
					<input type="hidden" name="arriveT" value=<%=arriveT%>>
					<input type="hidden" name="ticket_p" value=<%=request.getParameter("price")%>>
					<input type="hidden" name="date" value=<%=request.getParameter("a")%>>
				</form>
			</div>
		</div>	
	</div>
	<div class="bottom">
		<div>
			<span><a href="#">关于我们</a></span><span>|</span><span><a href="#">版权声明</a></span>
		</div>
	</div>	

</body>
</html>