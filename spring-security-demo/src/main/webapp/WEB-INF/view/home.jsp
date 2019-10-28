<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ping Company</title>
<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>Ping Company Home Page</h2>
	<hr>
	<p>Welcome to the Ping company home page!!!!</p>
	<hr>
	<!-- Display user name and role -->
	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>
	<security:authorize access="hasRole('MANAGER')">
		<hr>
		<!-- Add a link to point to /leaders... this for the managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">LeaderShip
				Meeting</a> (Only for Manager peeps)
		</p>
		<hr>
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
		<hr>
		<!-- Add a link to point to /admin... this for the admin -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems
				Meeting</a> (Only for Admin peeps)
		</p>
		<hr>
	</security:authorize>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath }/logout"
		method="POST">

		<!-- Login/Submit Button -->
		<div style="margin-top: 10px" class="form-group">
			<div class="col-sm-6 controls">
				<input class="btn btn-success" type="submit" value="Logout" />

			</div>
		</div>
	</form:form>
</body>
</html>