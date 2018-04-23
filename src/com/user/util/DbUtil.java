package com.user.util;
import java.sql.*;

public class DbUtil {

	private static final String URL = "jdbc:sqlite::resource:db/userDB.db";
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