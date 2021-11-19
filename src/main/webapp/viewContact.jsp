<%@page import="com.dataConnection.DataBaseConnection"%>
<%@page import="com.dataOperation.ContactDetails"%>
<%@page import="com.dataOperation.AllContOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Contact here</title>

<%@include file="CSS/allCssLinks.jsp"%>

</head>
<body style="background-color: lightblue">

	<%@include file="CommenElements/navbar.jsp"%>
	<%
	if (ud == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("eror-msg", "Please Login First....");
	}
	%>

	<%
	String updt_msg = (String) session.getAttribute("save-msg");
	if (updt_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updt_msg%></div>
	<%
	}
	session.removeAttribute("save-msg");
	%>

	<%
	String delt_msg = (String) session.getAttribute("del-msg");
	if (delt_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=delt_msg%></div>
	<%
	}
	session.removeAttribute("del-msg");
	%>


	<%
	String eror_msg = (String) session.getAttribute("eror-msg");
	if (eror_msg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=eror_msg%></div>
	<%
	}
	session.removeAttribute("eror-msg");
	%>


	<div class="container">
		<div class="row p-3">

			<%
			if (ud != null) {
				ContactDetails cd = new ContactDetails();
				DataBaseConnection.getConnection();

				List<ContactDetails> contact = AllContOperation.getAllContact(ud.getId());
				for (ContactDetails cont : contact) {
			%>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
					
						<h5>
							Name:<%=cont.getName()%></h5>
						<p>
							<b>Email:<%=cont.getEmail()%></b>
						</p>
						<p>
							<b>Phone:<%=cont.getPhone()%></b>
						</p>
						<p>
							<b>Occupation:<%=cont.getAbout()%></b>
						</p>
						<a href="editContact.jsp?cid=<%=cont.getId()%>"
							class="btn btn-primary btn-sm text-white">Edit</a> <a
							href="DeleteServlet?cid=<%=cont.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>


</body>
</html>