package com.railway.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	private static final String URL = "jdbc:sqlite::resource:db/RailWay.db";
	private static final String USER = "";
	private static final String PASSWORD = "";
	
	protected static Statement s=null;
	protected static ResultSet rs = null;
	protected static Connection con = null;

	public static Connection getConnection(){
		try{
			Class.forName("org.sqlite.JDBC");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		try{
			con=DriverManager.getConnection(URL);
			con.setAutoCommit(false);
			return con;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}
