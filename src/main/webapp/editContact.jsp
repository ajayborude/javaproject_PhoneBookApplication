<%@page import="com.dataOperation.ContactDetails"%>
<%@page import="com.dataOperation.AllContOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Contact here</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body>
	<%@include file="CommenElements/navbar.jsp"%>

	<%
	if (ud == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("eror-msg", "Please Login First....");
	}
	%>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<div class="text-center text-success">
							<h5>Update Contact Page</h5>
							
							<%
							String eror_msg=(String)session.getAttribute("eror-msg");
							if(eror_msg!=null)
							{%>
								<div class="alert alert-danger" role="alert"><%=eror_msg %></div>
							<%
							}
							session.removeAttribute("eror-msg");
							%>

						</div>
						<form action="UpdateServlet" method="post">

							<%
							String id = request.getParameter("cid");
							int cid = Integer.parseInt(id);
							ContactDetails cd = AllContOperation.getContById(cid);
							%>
							
							<input type="hidden" name="cid" value="<%=cid%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									value="<%=cd.getName()%>" type="text" class="form-control"
									id="examplename" aria-describedby="nameHelp" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=cd.getEmail()%>" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Phone No</label> <input
									value="<%=cd.getPhone()%>" type="text" class="form-control"
									id="exampleInputPassword1" name="phone">


								<div class="form-group">
									<label for="exampleFormControlTextarea1"></label>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="3" placeholder="Enter About YourSelf" name="about"><%=cd.getAbout()%></textarea>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Update
								Contact</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 56px;">
		<%@include file="CommenElements/footer.jsp"%>
	</div>

</body>
</html>