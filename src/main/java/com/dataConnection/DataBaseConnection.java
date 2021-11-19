package com.dataConnection;

import java.sql.*;

public class DataBaseConnection {

	static Connection conn;

	public static Connection getConnection() {
		if (conn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;

	}
}
