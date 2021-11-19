
<%@page import="com.dataConnection.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PhoneBook Application</title>

<%@include file="CSS/allCssLinks.jsp" %>

<style type="text/css">
.bac-img {
	background: url("Iamage/phone.jpg");
    width: 100%;
    height: 80vh;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

</style>
</head>
<body>

<%@include file="CommenElements/navbar.jsp" %>


<div class="container-fluid bac-img">
<h2 class="text-success text-center">Welcome to PhoneBook Application</h2>
</div>

<div style="margin-bottom: 0;">
<%@include file="CommenElements/footer.jsp" %>
</div>

</body>
</html>