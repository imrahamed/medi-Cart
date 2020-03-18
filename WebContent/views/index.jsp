<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Charm|Felipa|Lobster" rel="stylesheet">
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
<script type="text/javascript" src="js/script.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>


<title>Online Medical Cart</title>


<body>
		<div class="header">
		
			<p style="font-family: 'Charm', cursive;font-size:40px;margin-top:10px;font-weight: normal;">Online
				Medicine Cart</p>
			
			<center>
					<form class="modal-content"
						action="loginUser.do" method="post">
						<div class="container">
							<%
								if (session.getAttribute("user") != null)
									session.removeAttribute("user");
							%>
							<img class="logo-icon-login " src="images/drug.png" />
							<h2 class="login-text">Login</h2>
							<div style="color:red;margin-right:550px;">${message }</div>
							<input type="text" placeholder="Enter Username" name="userName"
								id="userName" class="login-fields" required><br>
							<input type="password" placeholder="Enter Password" id="password"
								name="password" class="login-fields" required><br>
							<br>
							<button type="submit" class="loginSubmitButton" id="submit">Login</button>
							<br> 
							<div style="margin-right:600px; margin-top:10px;"><a href="signup.do">Don't have
								an Account? Signup here</a></div>
						</div>

					</form>
					</center>
				</div>
			
	
</body>


</html>
