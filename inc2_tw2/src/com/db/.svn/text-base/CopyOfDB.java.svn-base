package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CopyOfDB {

	protected Connection conn = null;
	protected Statement statement = null;
	protected PreparedStatement preparedStatement = null;
	protected ResultSet rs = null;

	public void connectDB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// mine
			conn = DriverManager.getConnection("jdbc:mysql://localhost/activiti?" + "user=root&password=123");

			// conn =
			// DriverManager.getConnection("jdbc:mysql://localhost/yuhua?" +
			// "user=root&password=123");

			// for yuhua
			// conn =
			// DriverManager.getConnection("jdbc:mysql://localhost/yuhua?"
			// + "user=root&password=mysql");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}

			if (statement != null) {
				statement.close();
			}

			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {

		}
	}
	
	public void insertAnnouncementRead() throws SQLException {
		String sql = "insert into dlp_hm_users values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? )";
		
		connectDB();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		for (int i = 0;i<=1001;i++){
			pstmt.setString(1, "admin"+i);
			pstmt.setString(2, "8aa8ac65355b979201355bbaf09f0016");
			pstmt.setString(3, "admin"+i);
			pstmt.setString(4, "admin"+i);
			pstmt.setString(5, "admin"+i);
			pstmt.setString(6, "男");
			pstmt.setString(7, null);
			pstmt.setString(8, "88888888");
			pstmt.setString(9, "");
			pstmt.setString(10, "");
			pstmt.setString(11, "admin@admin.com");
			pstmt.setString(12, "admin@admin.com");
			pstmt.setString(13, "");
			pstmt.setString(14, "PASS");
			pstmt.setString(15, "H");
			pstmt.setString(16, "G");
			pstmt.setString(17, null);
			pstmt.setString(18, "2013/09/12 09:21:09");
			
		
			System.out.println(sql);
			pstmt.executeUpdate();
		}
		closeDB();
	}
	public static void main(String[] args)throws Exception{
		//new CopyOfDB().insertAnnouncementRead();
		new CopyOfDB().connectDB();
	}
}
