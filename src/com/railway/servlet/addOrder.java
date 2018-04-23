package com.railway.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.railway.dao.OrderDao;
import com.railway.model.Orderlist;

/**
 * Servlet implementation class addOrder
 */
@WebServlet("/addOrder")
public class addOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOrder() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		String Tid=request.getParameter("tid");
		String ticket_num=request.getParameter("ticket_num");
		String ticket_price=request.getParameter("ticket_p");
		String StartStation=request.getParameter("startS");
		String ArriveStation=request.getParameter("arriveS");
		String TrainDate=request.getParameter("date");
		String Passenger=request.getParameter("passenger");
		String Bookername="¡Ù“ª";
		String PassengerPhone=request.getParameter("phonecall");
		String StateT=request.getParameter("startT");
		String ArriveT=request.getParameter("arriveT");
		
		System.out.print(Tid);
		
		OrderDao o=new OrderDao();
		Orderlist order=new Orderlist();
		order.setTid(Tid);
		order.setTicket_num(ticket_num);
		order.setTicket_price(ticket_price);
		order.setStartS(StartStation);
		order.setArriveS(ArriveStation);
		order.setDate(TrainDate);
		order.setTourname(Passenger);
		order.setOrdername(Bookername);
		order.setOrderPhone(PassengerPhone);
		order.setStartT(StateT);
		order.setArriveT(ArriveT);
		
		try{
			boolean flat=o.addOrder(order);
			System.out.print(flat);
			request.setAttribute("success", "‘§∂©≥…π¶");
			RequestDispatcher dispatcher=request.getRequestDispatcher("order.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
