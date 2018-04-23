<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/nav_swich.js"></script>
    <script type="text/javascript" src="js/jump.js"></script>
    <style type="text/css">
    .table tr td{
    	text-align:center;
    }
    .md_table{
    	top:282px;
    	position:relative;
    }
    .md_table ul{
    	text-align:center;
    	margin:auto;
    	margin-top:100px;
    	margin-left:416px;
    }
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
    		var json='<%=request.getAttribute("myorderjson") %>'
    		var myorderlist=JSON.parse(json)
    		for(var i=0;i<myorderlist.length;i++){
    			var num=i+1;
    			var td1="<td>"+num+"</td>";
    			var td2="<td>"+myorderlist[i].Tid+"</td>";
    			var td3="<td>"+myorderlist[i].StartS+"</td>"
    			var td4="<td>"+myorderlist[i].ArriveS+"</td>"
    			var td5="<td>"+myorderlist[i].SetoffDate+"&nbsp&nbsp"+myorderlist[i].StartT+"</td>"
    			var td6="<td>"+myorderlist[i].Passenger+"</td> "
    			var td7="<td><a class='td_a'><span class='glyphicon glyphicon-trash'></span></a></td> "
    			$("#TBody").append("<tr>"+td1+td2+td3+td4+td5+td6+td7+"</tr>");
    		}
    		$(".td_a").click(function(){
    			var prevtd=$(this).parent("td").prevAll();
        		var tid=$(prevtd[4]).text();
        		var passenger=$(prevtd[0]).text();
        		
        		$("#tid").val(tid);
        		$("#passenger").val(passenger);
    			$.post("delectOrder",{"tid":tid,"passenger":passenger},delect(this));
    			
    		});
    		
    	});
    	
    	function delect(obj){
    		/* var prevtd=$(this).parent("td").prevAll();
    		var tid=$(prevtd[4]).text();
    		var passenger=$(prevtd[0]).text();
    		
    		$("#tid").val(tid);
    		$("#passenger").val(passenger); */
    		var tr=$(obj).parents("tr");
    		tr.remove();
    	}
    
    </script>
</head>
<body>
	<form id="delectform" action="delectOrder" method="post">
		<input id="tid" type="hidden" name="tid" value="">
		<input id="passenger" type="hidden" name="passenger" value="">
		<input type="hidden" name="Loginusername" value=<%=request.getSession().getAttribute("Loginusername")%>>
	</form>
	
<!--顶部-->
	<div id="top" >
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
	<div class="md_content">
		<div class="center">	
			<div class="md_table">
				<span><%=request.getSession().getAttribute("Loginusername") %>的订单</span>
				<table class="table table-bordered" >
					<tr>
						<td>订单号</td>   							    
						<td>车次</td>   							    
						<td>出发站</td>   							    
						<td>终点站</td>   							    
						<td>出发日期/时间</td>   							    
						<td>乘车人</td> 
						<td>删除订单</td>  							    
					</tr>
					<tbody id="TBody">
						<!-- <tr>
						<td>1</td> 
						<td>2017-12-08</td>  							    
						<td>T225</td>   							    
						<td>北京</td>   							    
						<td>上海</td>   							    
						<td>2017-12-31 10:22</td>   							    
						<td>张三</td> 
					 	<td>
							<a href="#">
							    <span class="glyphicon glyphicon-trash"></span>
        					</a>
        				</td>  		
					</tr> -->
				</tbody>  							  
				</table>
				<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">&raquo;</a></li>
				</ul>	   	
			</div>
		</div>
	</div>
</body>
</html>			
