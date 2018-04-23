package com.user.util;

import java.sql.*;
public class utilTest {
	private static final String URL = "jdbc:sqlite::resource:db/userDB.db";
	private static final String USER = "";
	private static final String PASSWORD = "";
	
	protected static Statement s=null;
	protected static ResultSet rs = null;
	protected static Connection con = null;

	public static void main(String[] args)  {
		// TODO Auto-generated method stub
		//1.加载驱动程序
        try {
			Class.forName("org.sqlite.JDBC");
			//2. 获得数据库连接
			Connection conn = DriverManager.getConnection(URL);
			//3.操作数据库，实现增删改查
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM user");
			//如果有数据，rs.next()返回true
			//System.out.println(rs.next());
			
			while(rs.next()){
				System.out.println("nnn");
			    System.out.println(rs.getString("u_name"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
