<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.DomainClasses.Brand"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/drug.png">
<link rel="stylesheet" href="css/main.css" type="text/css"/>
	<script type="text/javascript" src="js/script.js"></script>
	
</head>
<title>LifeGlue</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body style="background-color: #E5E8E8;">
<%@include file="header.jsp"%>
	<center>

		


<c:choose>
					<c:when test="${brandIns.getBrandName()==null}">
		<form class="modal-content" style="margin-top: 150px;"
			action="createCompany.do" method="post">

			<div class="container">
				<img class="logo-icon" src="images/drug.png" />
				<h2>Register Company</h2>
				<input type="text" placeholder="Enter Company Name" name="companyName" id="companyName" class="input-fields" 
					 required><br>
				<br> <input type="text" placeholder="Enter Brand Name" name="brandName" id="brandName" class="input-fields" 
					style="margin-left:34px;" required>
					<div id="div" style="float: right;margin-top:10px;">
				<a href="#" onclick ="appendRow()" ><img class="add-icon" id ="addBrand" src="images/add.png" title="add new brand"/></a>
				 </div><br>
					 <div id="division"></div>
				<button type="submit" class="loginButton" id="register">Register</button>
			</div>
			</form>
			</c:when>
<c:otherwise>
<div class="container">

<form class="modal-content animate" style="margin-top: 150px;"
			action="companyUpdate.do" method="post">

			
				<img class="logo-icon" src="images/drug.png" />
				<h2>Edit Company and Brand</h2>
				<input type="text" value="${brandIns.getBrandName()}" name="companyName" class="input-fields" 
					 required><br>
				<br> <input type="text" value="${brandIns.getCompany().getCompanyName()}" name="brandName" class="input-fields" 
					 required><br>
					<input type="hidden" value="${brandIns.getId() }" name="brandId"/>
					<input type="hidden" value="${brandIns.getCompany().getId() }" name="companyId"/>

				<button type="submit" class="loginButton">Update</button>
			</form>
			</div>
			</c:otherwise>
				</c:choose>
		
	</center>
</body>

</html>
