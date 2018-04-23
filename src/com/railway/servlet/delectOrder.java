package com.railway.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railway.dao.OrderDao;
import com.railway.model.Orderlist;

/**
 * Servlet implementation class delectOrder
 */
@WebServlet("/delectOrder")
public class delectOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delectOrder() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String tid=request.getParameter("tid");
		String passenger=request.getParameter("passenger");
		System.out.print(tid+passenger);
		OrderDao o=new OrderDao();
		Orderlist order=new Orderlist();
		order.setTid(tid);
		order.setTourname(passenger);
		try{
			boolean flat=o.delectOrder(order);
			System.out.println(flat);
			//response.sendRedirect("showorder.jsp");
					
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
