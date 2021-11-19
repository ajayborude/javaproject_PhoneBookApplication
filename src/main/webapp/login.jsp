<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body style="background-color: lightblue;">

	<%@include file="CommenElements/navbar.jsp"%>


	<div class="conrainer">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-3">
				<div class="card">
					<div class="card-header bg-success text-center text-white">
						<i class="fas fa-user-tie fa-2x"></i>
						<h4>Login Here</h4>
					</div>

					<%
					String eror_msg = (String) session.getAttribute("eror-msg");
					if (eror_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=eror_msg%></div>
					<%
					}
					session.removeAttribute("eror-msg");
					%>

					<%
					String logout_msg = (String) session.getAttribute("logout-msg");
					if (logout_msg != null) {
					%>
					<div class="alert alert-info" role="alert"><%=logout_msg%></div>
					<%
					}
					session.removeAttribute("logout-msg");
					%>

					<div class="card-body">
						<form action="LoginServlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 170px;">
		<%@include file="CommenElements/footer.jsp"%>
	</div>


</body>
</html>