package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataOperation.AllContOperation;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    PrintWriter pw = response.getWriter();
	    
	    int cid=Integer.parseInt(request.getParameter("cid"));
	    HttpSession session=request.getSession();
	   int result= AllContOperation.deleteContact(cid);
	
	   if (result > 0)
		{
			session.setAttribute("del-msg", "Your contact has been Deleted successfully");
			response.sendRedirect("viewContact.jsp");
		} 
		else 
		{
			session.setAttribute("eror-msg", "Something wrong on server");
			response.sendRedirect("viewContact.jsp");
		}

	}

}
