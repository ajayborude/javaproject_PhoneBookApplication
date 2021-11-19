<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="CommenElements/navbar.jsp"%>


	<div class="conrainer">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-2 ">
				<div class="card">
					<div class="card-header bg-success text-center text-white">
						<i class="fas fa-users fa-2x"></i>
						<h4>Register Here</h4>
					</div>

					<%
					String reg_msg = (String) session.getAttribute("reg-msg");
					String eror_msg = (String) session.getAttribute("error-msg");

					if (reg_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=reg_msg%><a
							href="login.jsp"><br>Click here to login</a>
					</div>
					<%
					}

					if (eror_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=eror_msg %></div>
					<%
					}

					session.removeAttribute("reg-msg");
					session.removeAttribute("error-msg");
					%>

					<div class="card-body">
						<form method="post" action="InsertServlet">
							<div class="form-group">
								<label for="exampleInputname">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									placeholder="enter name" name="fullname">
							</div>
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



</body>
</html>