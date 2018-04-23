package com.railway.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.railway.dao.OrderDao;
import com.railway.model.Orderlist;
import com.railway.model.TSrelation;
import com.user.dao.UserDao;
import com.user.model.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class checkOrder
 */
@WebServlet("/checkOrder")
public class checkOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String Loginuser=request.getParameter("user");//uid
		System.out.println(Loginuser);
		Orderlist order=new Orderlist();
		UserDao u=new UserDao();
		User user=new User();
		user.setUserId(Loginuser);
		List<Orderlist> myorder=new ArrayList<Orderlist>();
		String Loginusername=null;
		try {
			Loginusername=u.queryName(user);
			System.out.print(Loginusername);
			OrderDao o=new OrderDao();
			order.setOrdername(Loginusername);
			myorder=o.queryAllOrder(order);
			for(Orderlist tr:myorder){
				System.out.println(tr.getTid()+","+tr.getTourname());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray myorderlist = new JSONArray();
		for(Orderlist tr:myorder){
			JSONObject orderlist=new JSONObject();//每到一站的信息
			orderlist.put("Tid",tr.getTid());
			orderlist.put("StartS",tr.getStartS());
			orderlist.put("ArriveS",tr.getArriveS());
			orderlist.put("SetoffDate",tr.getDate());
			orderlist.put("StartT",tr.getStartT());
			orderlist.put("Passenger",tr.getTourname());
			myorderlist.add(orderlist);
		}
		System.out.println(myorderlist.toString());
		request.setAttribute("myorderjson", myorderlist);
		HttpSession session=request.getSession();
		session.setAttribute("Loginusername", Loginusername);
		RequestDispatcher rd=request.getRequestDispatcher("showorder.jsp");
		rd.forward(request, response);
		
	}

}
