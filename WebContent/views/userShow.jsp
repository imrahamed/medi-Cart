<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	    <%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
	<script type="text/javascript" src="js/script.js"></script>
</head>

<title>Online Medical Cart</title>


<body style="background-color: #E5E8E8;">

<%@include file="header.jsp"%>


	<center>
			<br>
			<h1 class="container" style="color: black;"></h1>
				<form action="userEdit.do" method="post">
			
			<div class="modal-content" style="margin:auto;height:400%;">
			
			<h2>User Details</h2>
			 <div id="error" style="color:green; display:block">${message}</div>
			<table border="1px" style="border-collapse: separate;
  border-spacing: 15px 30px;margin:auto;">
			<tr>
			<td class="attribute-values"><b>UserName</b></td><td class="attribute-values">${userIns.getUserName()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Email</b></td><td class="attribute-values">${userIns.getEmail()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Mobile</b></td><td class="attribute-values">${userIns.getMobile()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Password</b></td><td class="attribute-values">${userIns.getPassword()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Address</b></td><td class="attribute-values">${userIns.getAddress()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Role</b></td><td class="attribute-values">${userIns.getRole().getName()}</td>
			</tr>
			
			</table>
			<input type="hidden" value="${userIns.getId()}" name="userId"/>
			<button class="btn btn-success" id="edit" type="submit" style="width:100px;">Edit</button>
			<button class="btn btn-success" id="delete" type="submit" formaction="userDelete.do" style="width:100px;background-color:red;">Delete</button>
			</div>
			</div>
			</form>


	</center>
</body>

</html>
