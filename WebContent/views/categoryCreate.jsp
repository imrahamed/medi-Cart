<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.DomainClasses.Category"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css">
	<script type="text/javascript" src="js/script.js"></script>
</head>
<title>Online Medicine Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body style="background-color: #E5E8E8;">
<%@include file="header.jsp"%>
	<center>

		


		<c:choose>
			<c:when test="${categoryIns.getCategoryName()==null}">

				<form class="modal-content animate" style="margin-top: 150px;"
					action="createCategory.do"
					method="post">

					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Create Category</h2>
						<input type="text" placeholder="Enter Category Name"
							name="categoryName" id="categoryName" class="input-fields"
							class="userName-textField " required><br> <br>
						<textarea placeholder="Enter description" name="description" id="description"
							class="input-fields"></textarea>


						<button type="submit" class="loginButton" id="register">Create Category</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<form class="modal-content animate" style="margin-top: 150px;"
					action="categoryUpdate.do"
					method="post">

					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Edit Category</h2>
						<input type="text" value="${categoryIns.getCategoryName() }"
							name="categoryName" class="input-fields"
							class="userName-textField " required><br> <br>
						<textarea value="${categoryIns.getDescription() }" name="description"
							class="input-fields">${categoryIns.getDescription() }</textarea>
							<input type="hidden" value="${categoryIns.getId() }" name="id"/>


						<button type="submit" class="loginButton">Update Category</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>

	</center>
</body>

</html>
