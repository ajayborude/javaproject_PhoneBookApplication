package com.dataOperation;

import java.sql.*;

import com.dataConnection.DataBaseConnection;

public class AllDbOperation {

	public static int insert(UserDetails ud) {
	Connection conn = null;
		int result = 0;
		conn=DataBaseConnection.getConnection();
	    String s= " INSERT INTO `mytable` (`Name`, `Email`, `Password`) VALUES (?, ?, ?) ";
	    try {
	    	
		  PreparedStatement ps=conn.prepareStatement(s);
		  ps.setString(1, ud.getName());  
		  ps.setString(2, ud.getEmail());  
		  ps.setString(3, ud.getPassword());  
	     result= ps.executeUpdate();  
		} 
	    catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static UserDetails getLogin(String email , String pass) {
		Connection conn;
		UserDetails ud = null;
		conn=DataBaseConnection.getConnection();
	    String s= " Select * from `mytable` where `Email`=? and `Password`=? ";
	    try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				ud = new UserDetails();
				
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setEmail(rs.getString(3));
				ud.setPassword(rs.getString(4));
					
			}
	    } 
	    catch (SQLException e) {
			e.printStackTrace();
		}
		return ud;
	}
	
}
