package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDao;
import com.user.model.User;
/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userid=request.getParameter("login");
		String userpassword=request.getParameter("paw");
		User user=new User();
		UserDao u=new UserDao();
		user.setUserId(userid);
		user.setPassword(userpassword);
		PrintWriter out=response.getWriter();
		try{
			List<User> isUser=u.queryLoginList(user);
			if(isUser.size()>0){
				//System.out.println("nnn");
				HttpSession session=request.getSession();
				session.setMaxInactiveInterval(10*60);
				session.setAttribute("userid",userid);
				SimpleDateFormat dataFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String logtime=dataFormat.format(new Date());
				session.setAttribute("logtime", logtime);
				//Cookie cookie=new Cookie("userid",userid);
				//cookie.setMaxAge(60*60*24*30);
				//response.addCookie(cookie);
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}else{
				request.setAttribute("fail", "<p>无效用户，请先完成注册</p>");
				RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
