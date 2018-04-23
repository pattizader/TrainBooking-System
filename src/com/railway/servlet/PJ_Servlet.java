package com.railway.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railway.dao.TDao;
import com.railway.model.OrderViewer;
import com.railway.model.TSrelation;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PJ_Servlet
 */
@WebServlet("/PJ_Servlet")
public class PJ_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PJ_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		String StartStation=request.getParameter("startS");
		String ArriveStation=request.getParameter("arriveS");
		String setoff=request.getParameter("setoff");
		TDao t=new TDao();
		OrderViewer pjcx=new OrderViewer();
		pjcx.setStartS(StartStation);
		pjcx.setArriveS(ArriveStation);
		List<OrderViewer> result=new ArrayList<OrderViewer>();
		try{
			result=t.queryAlltrainList(pjcx);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		for(OrderViewer tr:result){
			System.out.println(tr.getTid()+","+tr.getStartT()+","+
								tr.getArriveT()+","+tr.getPrice());
		}
		JSONArray trainlist = new JSONArray();
		for(OrderViewer tr:result){
			JSONObject detaillist=new JSONObject();
			detaillist.put("Tname",tr.getTid());
			detaillist.put("Start",tr.getStartT());
			detaillist.put("Arrive",tr.getArriveT());
			detaillist.put("Price",tr.getPrice());
			detaillist.put("Ticket", tr.getTicket());
			trainlist.add(detaillist);
		}
		System.out.println(trainlist.toString());
		request.setAttribute("trainjson", trainlist.toString());
		request.setAttribute("startS",StartStation);
		request.setAttribute("arriveS", ArriveStation);
		request.setAttribute("setoffdate", setoff);
		RequestDispatcher rd=request.getRequestDispatcher("pjcx.jsp");
		rd.forward(request, response);
	}

}
