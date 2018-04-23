<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>铁路订票服务系统</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/index.css">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/nav_swich.js"></script>
    <script type="text/javascript" src="js/jump.js"></script>
  </head>
  <body>
  	<!--顶部-->
	<div id="top" name = "top">
		<div class=center>
			<ul id=top_login class="list-inline">
				<li id="welcome" ><span>欢迎来到铁路订票服务网站</span></li>
				<li><span>
				<%
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
					<li class="selection"><a href="guide">车票预订</a></li>
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
	<!--车票查询-->
	<div class="content">
		<div class="center">
			<div class="booking">
				<div class="booking_top">车票查询</div>
				<div id="radio1" class="radio">
    				<label>
      					<input type="radio" name="optionsRadios" id="radios1" value="dc" checked onclick="RadDisa()">
      						单程
    				</label>
    				<label>
	      				<input type="radio" name="optionsRadios" id="radios2" value="sc" onclick="RadAble()">
	      					往返
	    			</label>
  				</div>
  				<div class="booking_content">
  					<form action="PJ_Servlet" method="post">
	  					<ul id="booking_list" class="nav">
	  						<li><span>出发地</span><input type="text" name="startS"></li>
	  						<li><span>目的地</span><input type="text" name="arriveS"></li>
	  						<li><div></div></li>
	  						<li><span>出发日</span><input type="date" name="setoff" value="" onclick="getDate1(this)"></li>
	  						<li><span>返程日</span><input id="fcr" type="date" name="backing_date" value="" onclick="getDate1(this)"></li>
	  						<li><span class="submit"><button type="submit" class="btn btn-primary">查询</button></span></li> 
	  					</ul>
	  				</form>
  				</div>
			</div>
			<!--出行助手-->
			<div class="layout_guide">
				<div class="layout_top">出行助手</div>
					<div class="layout_content">
						<div class="layout_icon">
							<div class="img">
								<a onclick="ulrHtml(0)"><div class="icon_pjcx"></div></a>
							</div>
							<div class="desc">票价查询</div>
						</div>
						<div class="layout_icon">
							<div class="img">
								<a onclick="ulrHtml(1)"><div class="icon_cccx"></div></a>
							</div>
							<div class="desc">车次查询</div>
						</div>
						<div class="layout_icon" style="margin-top: 30px;">
							<div class="img">
								<a onclick="ulrHtml(2)"><div class="icon_ypcx"></div></a>
							</div>
							<div class="desc">余票查询</div>
						</div>
						<div class="layout_icon" style="margin-top: 30px;">
							<div class="img">
								<a onclick="ulrHtml(3)"><div class="icon_skb"></div></a>
							</div>
							<div class="desc">火车时刻表</div>
						</div>							
				</div>
			</div>
		</div>
	</div>
	<!--底部-->
	<div class="bottom">
		<div>
			<span><a href="#">关于我们</a></span><span>|</span><span><a href="#">版权声明</a></span>
		</div>
	</div>	
	<script type="text/javascript">
         function ulrHtml(num){
             var toUrl = "guide.jsp?"+num;   
             window.open(toUrl);         
        }
	</script>


    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>