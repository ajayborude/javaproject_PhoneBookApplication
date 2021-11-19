<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Contact here</title>

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

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<div class="text-center text-success">
							<h5>Add Contact Page</h5>
							<%
							String suc_msg = (String) session.getAttribute("save-msg");
							if (suc_msg != null) {
							%>
							<div class="alert alert-success" role="alert"><%=suc_msg%></div>
							<%
							}
							session.removeAttribute("save-msg");
							%>
						</div>
						<form action="AddContactServlet" method="post">
							<%
							if (ud != null) {
							%>
							<input type="hidden" name="user_id" value="<%=ud.getId()%>">
							<%
							}
							%>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="examplename"
									aria-describedby="nameHelp" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Phone No</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="phone">


								<div class="form-group">
									<label for="exampleFormControlTextarea1"></label>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="3" placeholder="Enter About YourSelf" name="about"></textarea>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Save
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