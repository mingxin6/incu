package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB {

	protected Connection conn = null;
	protected Statement statement = null;
	protected PreparedStatement preparedStatement = null;
	protected ResultSet rs = null;

	public void connectDB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// mine
			conn = DriverManager.getConnection("jdbc:mysql://localhost/yuhua3?" + "user=root&password=123");

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

}
