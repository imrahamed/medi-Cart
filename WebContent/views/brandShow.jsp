+<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	<script type="text/javascript" src="script.js"></script>
</head>

<title>Online Medical Cart</title>


<body style="background-color: #E5E8E8;">



	<center>

		<%@include file="header.jsp"%>

			<h1 class="container" style="color: black;"></h1>
				<form action="brandEdit.do" method="post">
			
			<div class="modal-content" style="margin:auto;height:auto;">
			
			<h2>Brand Details</h2>
			 <div id="error" style="color:green; display:block">${message}</div>
			<table border="1px" style="border-collapse: separate;
  border-spacing:  30px;margin:auto;">
			<tr>
			<td class="attribute-values"><b>Brand Name</b></td><td class="attribute-values">${brandIns.getBrandName()}</td>
			</tr><tr>
			<td  class="attribute-values"><b>Company Name</b></td><td class="attribute-values">${brandIns.getCompany().getCompanyName()}</td>
			
			</tr>
			
			</table>
			<input type="hidden" value="${brandIns.getId()}" name="brandId"/>
			<input type="hidden" value="${brandIns.getCompany().getId()}" name="companyId"/>
			<button class="btn btn-success" type="submit" style="width:100px;">Edit</button>
			<button class="btn btn-success" type="submit" formaction="brandDelete.do" style="width:100px;background-color:red;">Delete</button>

			</div>
			</form>
			</div>
	</center>
</body>

</html>
