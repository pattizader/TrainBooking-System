package com.railway.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.*;



import com.railway.dao.TDao;
import com.railway.model.TSrelation;
import com.railway.model.Train;

/**
 * Servlet implementation class CC_Servlet
 */
@WebServlet("/CC_Servlet")
public class CC_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CC_Servlet() {
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
		response.setContentType("text/html; charset=utf-8");
		String Tname=request.getParameter("Tname_cc");
		TDao t=new TDao();
		Train train=new Train();
		train.setTname(Tname);
		List<TSrelation> tour=new ArrayList<TSrelation>();
		try {
			tour=t.queryAlltour(train);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(TSrelation tr:tour){
			System.out.println(tr.getTid()+","+tr.getSid()+","+tr.getRarrivetime()+","+tr.getRstarttime());
		}
		//JSONObject tourjson= new JSONObject();
		JSONArray tourlist = new JSONArray();//每一车次  
		for(TSrelation tr:tour){
			JSONObject stationlist=new JSONObject();//每到一站的信息
			stationlist.put("Tid",tr.getTid());
			stationlist.put("Sid",tr.getSid());
			stationlist.put("Arrive",tr.getRarrivetime());
			stationlist.put("Left",tr.getRstarttime());
			tourlist.add(stationlist);
		}
		//tourjson.put("tour", tourlist);
		System.out.println(tourlist.toString());
		//response.sendRedirect("cccx.jsp");
		request.setAttribute("tourjson", tourlist.toString());
		request.setAttribute("Tname", Tname);
		//PrintWriter out=response.getWriter();
		//out.println(tourjson);
		//out.write(tourjson.toString());
		RequestDispatcher rd=request.getRequestDispatcher("cccx.jsp");
		rd.forward(request, response);
	}

}
