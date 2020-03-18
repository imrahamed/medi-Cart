<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/drug.png">
<link rel="stylesheet" href="css/main.css" type="text/css"/>
<script type="text/javascript"
	src="js/script.js"></script>
	<base href="/medical-Cart/" >
</head>
<title>LifeGlue</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body style="background-color: #E5E8E8;">
<%@include file="header.jsp"%>
	<center>

	


<c:choose>
					<c:when test="${roleIns.getName()==null}">
		<form class="modal-content animate" style="margin-top: 150px;"
			action="createRole.do" method="post">

			<div class="container">
				<img class="logo-icon" src="http://localhost:8082/OnlineMedicineCart/images/drug.png" />
				<h2>Create Role</h2>
				<input type="text" placeholder="Enter Role Name" name="roleName" class="input-fields" id="role"
					class="userName-textField " required><br>
				<br>

				<button type="submit" class="loginButton" id="submitRole">Create Role</button>
			</div>
		</form>
</c:when>
<c:otherwise>
		<form class="modal-content animate" style="margin-top: 150px;"
			action="roleUpdate.do" method="post">

			<div class="container">
				<img class="logo-icon" src="http://localhost:8082/OnlineMedicineCart/images/drug.png" />
				<h2>Edit Role</h2>
				<input type="hidden" value="${roleIns.getId() }" name="id"/>
				<input type="text" value="${roleIns.getName()}" name="name" class="input-fields" id="edit_role"
					class="userName-textField " required><br>
				<br>

				<button type="submit" class="loginButton" id="updateRole">Edit Role</button>
			</div>
		</form>
					</c:otherwise>
				</c:choose>
		

	</center>
</body>

</html>
