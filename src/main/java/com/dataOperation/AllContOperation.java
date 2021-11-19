package com.dataOperation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dataConnection.DataBaseConnection;

public class AllContOperation {

	public static int addContact(ContactDetails cd)
	{
		Connection conn;
		int result = 0;
		conn=DataBaseConnection.getConnection();
		String s=" Insert Into `cont_table`(`FullName`, `Email`, `PhoneNo`, `Occupation`, `UserId`) Values(?,?,?,?,?) ";
	  try {
		PreparedStatement ps=conn.prepareStatement(s);
		ps.setString(1, cd.getName());
		ps.setString(2, cd.getEmail());
		ps.setString(3, cd.getPhone());
		ps.setString(4, cd.getAbout());
		ps.setInt(5, cd.getUser_id());
		result=ps.executeUpdate();
	}
	  catch (SQLException e) {
		
		e.printStackTrace();
	}
	return result;
	}
	
	public static List<ContactDetails> getAllContact(int User_id)
	{
		Connection conn;
		ContactDetails cd;
		List<ContactDetails> list = new ArrayList<ContactDetails>();
		conn=DataBaseConnection.getConnection();
		
		String s=" Select * from `cont_table` where `UserId`=? ";
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, User_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				cd=new ContactDetails();
				cd.setId(rs.getInt(1));
				cd.setName(rs.getString(2));
				cd.setEmail(rs.getString(3));
				cd.setPhone(rs.getString(4));
				cd.setAbout(rs.getString(5));
				cd.setUser_id(rs.getInt(6 ));
		        list.add(cd);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static ContactDetails getContById(int cid)
	{
		Connection conn;
		ContactDetails cd = new ContactDetails();
     	conn=DataBaseConnection.getConnection();
		String s=" Select * from `cont_table` where `Id`=? ";
	   
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				cd.setId(rs.getInt(1));
				cd.setName(rs.getString(2));
				cd.setEmail(rs.getString(3));
				cd.setPhone(rs.getString(4));
				cd.setAbout(rs.getString(5));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	return cd;
	}
	
	public static int editContact(ContactDetails cd)
	{
		Connection conn;
		int result = 0;
     	conn=DataBaseConnection.getConnection();
		String s="   Update `cont_table` Set `Fullname`=?, `Email`=?, `PhoneNo`=?, `Occupation`=? where `Id`=? ";
		try {
			PreparedStatement ps=conn.prepareStatement(s);
			
			ps.setString(1, cd.getName());
			ps.setString(2, cd.getEmail());
			ps.setString(3, cd.getPhone());
			ps.setString(4, cd.getAbout());
			ps.setInt(5, cd.getId());
           result=ps.executeUpdate();
           
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static int deleteContact(int id)
	{
		Connection conn;
		int result = 0;
     	conn=DataBaseConnection.getConnection();
		String s="   Delete from `cont_table` where `Id`=? ";
		try {
			ContactDetails cd = new ContactDetails();
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, id);
			result=ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
