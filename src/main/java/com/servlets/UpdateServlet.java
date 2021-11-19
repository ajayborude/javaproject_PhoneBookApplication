package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataConnection.DataBaseConnection;
import com.dataOperation.AllContOperation;
import com.dataOperation.ContactDetails;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
	    
	    int cid=Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneno = request.getParameter("phone");
		String about = request.getParameter("about");
		
		HttpSession session = request.getSession();

		ContactDetails cd = new ContactDetails();
		cd.setId(cid);
		cd.setName(name);
		cd.setEmail(email);
		cd.setPhone(phoneno);
		cd.setAbout(about);
		DataBaseConnection.getConnection();
		int result=AllContOperation.editContact(cd);
		
		if (result > 0)
		{
			session.setAttribute("save-msg", "Your contact has been updated");
			response.sendRedirect("viewContact.jsp");
		} 
		else 
		{
			session.setAttribute("eror-msg", "Something wrong on server");
			response.sendRedirect("editContact.jsp?cid="+cid);
		}
	
	}

}
