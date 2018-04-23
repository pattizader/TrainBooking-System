package com.railway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.railway.model.OrderViewer;
import com.railway.model.Station;
import com.railway.model.TSrelation;
import com.railway.model.Train;
import com.railway.util.DBUtil;
import com.user.util.DbUtil;


public class TDao {
	private Connection con;
	//查询所有列车
	public List<Train> queryAllTrain()throws Exception{
		List<Train> list=new ArrayList<Train>();
		con=DBUtil.getConnection();
		String sql="SELECT * FROM train";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Train train = new Train();
				train.setTid(rs.getString(1));
				train.setTname(rs.getString(2));
				train.setTstartstation(rs.getString(3));
				train.setTterminus(rs.getString(4));
				train.setTtype(rs.getString(5));
				list.add(train);
			}
					
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return list;
	}
	//车次查询，返回Tid，sid，进出站时间；
	public List<TSrelation> queryAlltour(Train train)throws Exception{
		List<TSrelation> tour = new ArrayList<TSrelation>();
		con=DBUtil.getConnection();
		String sql="SELECT * FROM relation WHERE Tid IN(SELECT Tid FROM train WHERE Tname=?)";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,train.getTname());
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				TSrelation ts=new TSrelation();
				ts.setTid(rs.getString("Tid"));
				ts.setSid(rs.getString("sid"));
				ts.setRarrivetime(rs.getString("Rarrivetime"));
				ts.setRstarttime(rs.getString("Rstarttime"));
				tour.add(ts);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		for(TSrelation tr:tour){
			String sql2="SELECT Tname FROM train WHERE Tid=?";
			String sql3="SELECT sname FROM station WHERE sid=?";
			try{
				PreparedStatement pst1=con.prepareStatement(sql2);
				PreparedStatement pst2=con.prepareStatement(sql3);
				pst1.setString(1,tr.getTid());
				pst2.setString(1,tr.getSid());
				ResultSet rs1=pst1.executeQuery();
				ResultSet rs2=pst2.executeQuery();
				while(rs1.next()){
					tr.setTid(rs1.getString("Tname"));
				}
				while(rs2.next()){
					tr.setSid(rs2.getString("sname"));
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return tour;
		
	}
	//预订查询，返回途径出发站，终点站的车次，时间，票价
	public List<OrderViewer> queryAlltrainList(OrderViewer o)throws Exception{
		List<OrderViewer> trainlist = new ArrayList<OrderViewer>();
		con=DBUtil.getConnection();
		
		String sql1="SELECT Tid FROM relation WHERE sid=? INTERSECT SELECT Tid "
				+ "FROM relation WHERE sid=?";
		String sql2="SELECT Rstarttime FROM relation WHERE Tid=? AND sid=? ";
		String sql3="SELECT Rarrivetime FROM relation WHERE Tid=? AND sid=?";
		String sql4="SELECT Tname,price,ReTickets FROM train WHERE Tid=?";
		String sql5="SELECT sid FROM station WHERE sname=?";
		
		try{
			PreparedStatement pst5=con.prepareStatement(sql5);
			PreparedStatement pst6=con.prepareStatement(sql5);
			pst5.setString(1,o.getStartS());
			pst6.setString(1,o.getArriveS());
			ResultSet result=pst5.executeQuery();
			ResultSet result2=pst6.executeQuery();
			while(result.next()){
				o.setStartS(result.getString("sid"));
			}
			while(result2.next()){
				o.setArriveS(result2.getString("sid"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		try{
			PreparedStatement pst1=con.prepareStatement(sql1);
			pst1.setString(1,o.getStartS());
			pst1.setString(2,o.getArriveS());
			ResultSet rs=pst1.executeQuery();
			while(rs.next()){
				OrderViewer olist=new OrderViewer();
				olist.setTid(rs.getString("Tid"));
				trainlist.add(olist);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		for(OrderViewer tr:trainlist){
			//System.out.println(tr.getTid());
			try{
				PreparedStatement pst2=con.prepareStatement(sql2);
				PreparedStatement pst3=con.prepareStatement(sql3);
				PreparedStatement pst4=con.prepareStatement(sql4);
				pst2.setString(1,tr.getTid());
				pst2.setString(2,o.getStartS());
				pst3.setString(1,tr.getTid());
				pst3.setString(2, o.getArriveS());
				pst4.setString(1,tr.getTid());
				ResultSet rs2=pst2.executeQuery();
				ResultSet rs3=pst3.executeQuery();
				ResultSet rs4=pst4.executeQuery();
				while(rs2.next()){
					tr.setStartT(rs2.getString("Rstarttime"));
				}
				while(rs3.next()){
					tr.setArriveT(rs3.getString("Rarrivetime"));
				}
				while(rs4.next()){
					tr.setPrice(rs4.getString("price"));
					tr.setTid(rs4.getString("Tname"));
					tr.setTicket(rs4.getString("ReTickets"));
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return trainlist;
		
	}
	
}
