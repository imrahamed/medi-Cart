<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Charm|Felipa|Lobster"
	rel="stylesheet">
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
<script type="text/javascript"
	src="js/script.js?v=42"></script>
</head>
<title>Online Medical Cart</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body style="background-color: #E5E8E8;">
	<center>

		<div class="header">
			<p
				style="font-family: 'Charm', cursive; font-size: 40px; margin-top: 10px;">Online
				Medicine Cart</p>
			<h3 class="slogan"></h3>
		</div>

		<c:choose>
			<c:when test="${userIns.getUserName()==null}">
				<form class="modal-content animate" style="margin-top: 150px;"
					action="signinUser.do"
					onsubmit="return validate()" method="post">

					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Signup</h2>
						<div id="username_error" style="display: none; color: red;">Username cannot be blank</div>
						<input type="text" id="username" placeholder="Enter Username"
							class="input-fields" name="username" class="userName-textField "><br>
						<br><div id="email_error" style="display: none; color: red;">Email cannot be blank</div> 
						<input type="email" placeholder="Enter e-mail" id="email"
							class="input-fields" name="email"><br> <br>
						<div id="password_error" style="display: none; color: red;">Password
							and Confirm Password does not match</div>
						<input type="password" id="password" placeholder="Enter Password"
							name="password" class="input-fields" required><br> <br>
						<input type="password" id="confirm_password"
							placeholder="Confirm Password" class="input-fields"
							name="confirm_password" required><br> <br>
						<div id="mobile_error" style="display: none; color: red;">Invalid
							Mobile Number</div>
						<input type="text" id="mobile" placeholder="Enter mobile number"
							class="input-fields" name="mobile" required><br> <br>
						<input type="text"
							placeholder="streetnumber,Area,City,State,Pincode" name="address"
							class="input-fields" id="address" required><br> <br> <input
							type="hidden" name="createSeller" value="${createSeller }" />

						<button type="submit" class="loginButton" id="signup">Signup</button>
						<br>
						<div>
							<a href="index.do">Already Have an
								Account? </a>
						</div>
					</div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<form class="modal-content animate" style="margin-top: 150px;"
					action="userUpdate.do" method="post"
					onsubmit="return validate()">

					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Edit User</h2>
						<input type="hidden" value="${userIns.getId() }" name="id" /> <input
							type="text" value="${userIns.getUserName()}" class="input-fields"
							name="userName" class="userName-textField " required><br>
						<br> <input type="text" value="${userIns.getEmail()}"
							class="input-fields" name="email" required><br> <br>
						<div id="password_error" style="display: none; color: red;">Password
							and Confirm Password does not match</div>
						<input type="password" id="password"
							value="${userIns.getPassword()}" name="password"
							class="input-fields" required><br> <br>
						<div id="mobile_error" style="display: none; color: red;">Invalid
							Mobile Number</div>
						<input type="text" id="mobile" value="${userIns.getMobile()}"
							class="input-fields" name="mobile" required><br> <br>
						<input type="text" value="${userIns.getAddress()}" name="address"
							class="input-fields" required><br> <br> <select
							id="roleId" name="roleId" class="input-fields">
							<c:forEach items="${roleList}" var="roleIns">
								<option value="${roleIns.getId()}">${roleIns.getName()}</option>
							</c:forEach>
						</select>

						<button type="submit" class="loginButton">Update</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>


	</center>
</body>

</html>
