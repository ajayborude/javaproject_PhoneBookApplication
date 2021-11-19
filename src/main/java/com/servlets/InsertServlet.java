package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataOperation.AllDbOperation;
import com.dataOperation.UserDetails;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		String name=request.getParameter("fullname");
		String em=request.getParameter("email");
		String pass=request.getParameter("password");
		
		UserDetails ud = new UserDetails();
		int result;
		ud.setName(name);
		ud.setEmail(em);
		ud.setPassword(pass);
		
	    result=AllDbOperation.insert(ud);
		if(result>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("reg-msg", "You have sucessfully Register");
			response.sendRedirect("register.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("error-msg", "Something went wrong on Server");
			response.sendRedirect("register.jsp");
		}

	}

	}


