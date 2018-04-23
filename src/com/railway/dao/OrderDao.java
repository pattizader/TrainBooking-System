package com.railway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.railway.model.Orderlist;
import com.railway.util.DBUtil;


public class OrderDao {
	private Connection con;
	//Ìí¼Ó¶©µ¥
	public boolean addOrder(Orderlist o) throws Exception{
		boolean flat=false;
		con=DBUtil.getConnection();
		String sql="INSERT INTO orderlist(tid,t_num,t_price,start_S,"
				+ "arrive_S,date,t_name,o_name,o_phone,start_T,end_T) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,o.getTid());
			pst.setString(2,o.getTicket_num());
			pst.setString(3,o.getTicket_price());
			pst.setString(4,o.getStartS());
			pst.setString(5,o.getArriveS());
			pst.setString(6,o.getDate());
			pst.setString(7,o.getTourname());
			pst.setString(8,o.getOrdername());
			pst.setString(9,o.getOrderPhone());
			pst.setString(10,o.getStartT());
			pst.setString(11,o.getArriveT());
			pst.executeUpdate();
			//con.commit();
			flat=true;
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally{
			con.close();
		}
		return flat;
	}
	//É¾³ý¶©µ¥
	public boolean delectOrder(Orderlist o) throws Exception{
		boolean flat=false;
		con=DBUtil.getConnection();
		String sql="DELETE FROM orderlist WHERE tid=? AND t_name=?";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,o.getTid());
			pst.setString(2,o.getTourname());
			pst.executeUpdate();
			//con.commit();
			flat=true;
			
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally{
			con.close();
		}
		return flat;
		
	}
	//²éÑ¯¶©µ¥
	public List<Orderlist> queryAllOrder(Orderlist o) throws Exception{
		List<Orderlist> myOrder=new ArrayList<Orderlist>();
		con=DBUtil.getConnection();
		String sql="SELECT * FROM orderlist WHERE o_name=? ";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,o.getOrdername());
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString("tid")+rs.getString("t_num")+rs.getString("t_price")+rs.getString("start_S")+rs.getString("arrive_S")+rs.getString("date")+rs.getString("t_name")+rs.getString("o_name")+rs.getString("o_phone"));
				Orderlist myOrderList=new Orderlist();
				myOrderList.setTid(rs.getString("tid"));
				myOrderList.setTicket_num(rs.getString("t_num"));
				myOrderList.setTicket_price(rs.getString("t_price"));
				myOrderList.setStartS(rs.getString("start_S"));
				myOrderList.setArriveS(rs.getString("arrive_S"));
				myOrderList.setDate(rs.getString("date"));
				myOrderList.setTourname(rs.getString("t_name"));;
				myOrderList.setOrdername(rs.getString("o_name"));
				myOrderList.setOrderPhone(rs.getString("o_phone"));
				myOrderList.setStartT(rs.getString("start_T"));
				myOrderList.setArriveT(rs.getString("end_T"));
				myOrder.add(myOrderList);
				con.commit();
			}
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally{
			con.close();
		}
		return myOrder;
	}
}
