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
import com.dataOperation.ContactDetails;

@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneno = request.getParameter("phone");
		String about = request.getParameter("about");
		String uid = request.getParameter("user_id");
		int user_id = Integer.parseInt(uid);

		HttpSession session = request.getSession();

		ContactDetails cd = new ContactDetails();
		cd.setName(name);
		cd.setEmail(email);
		cd.setPhone(phoneno);
		cd.setAbout(about);
		cd.setUser_id(user_id);

		int result = AllContOperation.addContact(cd);

		if (result > 0) {
			session.setAttribute("save-msg", "Your contact has been saved");
			response.sendRedirect("addContact.jsp");
		} else {
			session.setAttribute("eror-msg", "Something wrong on server");
			response.sendRedirect("addContact.jsp");
		}
	}

}
