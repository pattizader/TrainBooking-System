package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.railway.util.DBUtil;
import com.user.model.User;
import com.user.util.*;

public class UserDao {
	private Connection con;
	//增加用户；
	public boolean addUser(User u)throws Exception{
		boolean isSuccess=false;
		con=DbUtil.getConnection();
		String sql="INSERT INTO user(u_id,u_paw,u_name,u_idKind,u_idCard,u_email,u_phone,u_tourist) VALUES(?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,u.getUserId());
			pst.setString(2,u.getPassword());
			pst.setString(3,u.getUserName());
			pst.setString(4,u.getIdKind());
			pst.setString(5,u.getIdCode());
			pst.setString(6,u.getEmail());
			pst.setString(7,u.getPhone());
			pst.setString(8,u.getTourist());
		    
			pst.executeUpdate();
			con.commit();
			isSuccess=true;
			
		
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally{
			con.close();
		}
		return isSuccess;
	}
	//更新用户手机；
	public boolean updateUser(User u) throws Exception{
		boolean isSuccess=false;
		con=DbUtil.getConnection();
		String sql="UPDATE user SET u_phone=? WHERE u_name=?";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,u.getPhone());
			pst.setString(2,u.getUserName());
			pst.executeUpdate();
			con.commit();
			isSuccess=true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return isSuccess;
		
	}
	public void deleteUser(){
		
	}
	public List<User> queryAllUser()throws Exception{
		List<User> list=new ArrayList<User>();
		con=DbUtil.getConnection();
		String sql="SELECT * FROM user";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				User u=new User();
				u.setUserId(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setUserName(rs.getString(3));
				u.setIdKind(rs.getString(4));
				u.setIdCode(rs.getString(5));
				u.setEmail(rs.getString(6));
				u.setPhone(rs.getString(7));
				u.setTourist(rs.getString(8));
				list.add(u);
				con.commit();
			}
					
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally{
			con.close();
		}
		return list;
	}
	public List<User> queryLoginList(User u) throws Exception{
		List<User> auser=new ArrayList<User>();
		con=DbUtil.getConnection();
		String sql="SELECT u_id,u_paw FROM user WHERE u_id=? AND u_paw=? ";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,u.getUserId());
			pst.setString(2, u.getPassword());
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				u.setUserId(rs.getString("u_id"));
				u.setPassword(rs.getString("u_paw"));
				auser.add(u);
			}
		}catch(SQLException e){
				e.printStackTrace();
		}
		
		return auser;
		
		
	}
	//通过useid查询username
	public String queryName(User u) throws Exception{
		String UserName = null;
		con=DbUtil.getConnection();
		String sql="SELECT u_name FROM user WHERE u_id=?";
		try{
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,u.getUserId());
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				UserName=rs.getString("u_name");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return UserName;
		
		
	}
}
