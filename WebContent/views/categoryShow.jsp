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
<script type="text/javascript"
	src="js/script.js"></script>
</head>

<title>Online Medical Cart</title>


<body style="background-color: #E5E8E8;">

	<%@include file="header.jsp"%>

	<center>
			<h1
				style="font-family: Lucida Handwriting; font-style: oblique; font-color: blue; display: inline font-color:white; margin-left: 175px;">Online
				Medicine Cart</h1>
			<h3 class="slogan"></h3>
			<br>
			<h1 class="container" style="color: black;"></h1>
			<form action="categoryEdit.do" method="post">

				<div class="modal-content" style="margin: auto; height: 400%;">

					<h2>Category Details</h2>
					<div id="error" style="color: green; display: block">${message}</div>
					<table border="1px"
						style="border-collapse: separate; border-spacing: 30px; margin: auto;">
						<tr>
							<td class="attribute-values"><b>Category Name</b></td>
							<td class="attribute-values">${categoryIns.getCategoryName()}</td>
						</tr>
						<tr>
							<td class="attribute-values"><b>Description</b></td>
							<td class="attribute-values">${categoryIns.getDescription()}</td>
						</tr>

					</table>
					<input type="hidden" value="${categoryIns.getId()}"
						name="categoryId" />
					<button class="btn btn-success" type="submit" style="width: 100px;">Edit</button>
					<button class="btn btn-success" type="submit"
						formaction="categoryDelete.do"
						style="width: 100px; background-color: red;">Delete</button>

				</div>
		</form>
	</center>
</body>

</html>
