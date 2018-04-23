<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>火车票价查询</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/guide_pjcx.css">
	<script type="text/javascript" src="js/nav_swich.js"></script>
	<script type="text/javascript" src="js/jump.js"></script>
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
	
	<div class="center">
		<div class="guide_content">
			
			<div class='guide_tab tabbable tabs-left'>
				<ul id="tab_ul" class='nav nav-tabs'>
					<li class='active'><a id="a4" href='#tab1' data-toggle='tab'>票价查询</a></li>
					<li><a id="a1" href='#tab2' data-toggle='tab'>车次查询</a></li>
					<li><a id="a2" href='#tab3' data-toggle='tab'>余票查询</a></li>
					<li><a id="a3" href='#tab4' data-toggle='tab'>火车时刻表</a></li>
				</ul>
				<div class='tab-content'>
					<div class='tab-pane active' id='tab1'>
						<form action="PJ_Servlet" method="post">
							<div id="pjcx" class="txt_style">
								<ul class="nav">
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">出发站</span><input name="startS" type="text"></li>
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">目的站</span><input name="arriveS" type="text"></li>
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span" style="margin-right: 28px;">出行日期</span><input name="setoff" type="date" onclick="getDate1(this)" style="width: 174px; height: 26px;"></li>
								</ul>
								<div><button type="submit" class="btn btn-primary">查询</button></div>
							</div>
						</form>
					</div>
					<div class='tab-pane' id='tab2'>
						<div id="cccx">
							<form action="CC_Servlet" method="post">
								<div class="cccx_left">
									<ul class="nav">
										<li><span class="red" style="margin-right: 15px;">*</span><span class="span">列车车次</span><input type="text" name="Tname_cc"></li>
									</ul>
									<div><button type="submit" class="btn btn-primary">查询</button></div>
								</div>
							</form>
							<div class="cccx_right">
								<span class="font_style"><b>首字母D列车:</b>本火车车次最高时速250公里。其中广深线城际列车全部使用此车。按车次划分，D1-D4000为跨局列车，D4501-D7300为管内列车。北京局D4501～D4580次，沈阳局D5001～D5050次，西安局D5051～D5100次，上海局D5401～D5700次，济南局D6001～D6500次，广铁集团D7001～D7300次。</span>
								<br>
								<span class="font_style"><b>首字母C列车:</b>城际动车组列车。最高时速可达350公里。</span>
								<br>
								<span class="font_style"><b>首字母T列车:</b>特别快速旅客列车,简称特快,这样的列车在行程中一般只经停省会城市或当地的大型城市。</span>
								<br>
								<span class="font_style"><b>首字母K列车:</b>快速旅客列车,简称快速,这样的列车在行程中一般只经停地级行政中心或重要的县级行政中心。</span>
								<br>
								<span class="font_style"><b>首字母G列车:</b>城际高速铁路,新车次采用G+4位数字，意为“城际高铁”，设计时速350公里/小时，最高时速 380公里/小时，首发区段为武汉到广州，城际高速铁路使得武汉站到广州北站最快只需2小时47分钟。</span>
								<br>
								<span class="font_style"><b>首字母Y列车:</b>临时旅游列车。为旅游而开设的列车，目前只有极少量列车使用此编号。</span>
							</div>
						</div>
					</div>
					<div class='tab-pane' id='tab3'>
						<form action="" method="post">
							<div id="ypcx" class="txt_style">
								<ul class="nav">
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">出发站</span><input type="text"></li>
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">目的站</span><input type="text"></li>
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span" style="margin-right: 28px;">出行日期</span><input type="date" onclick="getDate1(this)" style="width: 174px; height: 26px;"></li>
								</ul>
								<div><button type="button" class="btn btn-primary">查询</button></div>
							</div>
						</form>
					</div>
					<div class='tab-pane' id='tab4'>
						<form action="" method="post">
							<div id="hcsk" class="txt_style">
								<ul class="nav">
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">出发站</span><input type="text"></li>
									<li><span class="red" style="margin-right: 15px;">*</span><span class="span">目的站</span><input type="text"></li>
								</ul>
								<div><button type="button" class="btn btn-primary">查询</button></div>
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