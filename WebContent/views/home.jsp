<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.spring.DomainClasses.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css?family=Charm|Felipa|Lobster"
	rel="stylesheet">
<link rel="icon" type="image/png" href="images/drug.png">
<link rel="stylesheet" href="css/main.css" type="text/css" />
<script type="text/javascript" src="js/script.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
</head>


<title>Online Medical Cart</title>


<body>

	<center>

		<div class="header">

			<span id="menu"
				style="font-size: 60px; cursor: pointer; float: left; margin-right: 20px;"
				title="More Options" onclick="openNav()">&#9776; </span>
			<%
				User userIns = (User) session.getAttribute("user");
				if (userIns.getRole().getName().equals("admin")) {
			%>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a> <a href="userList.do"
					id="listUsers">List Users</a> <a href="roleList.do" id="listRoles">List
					Roles</a> <a href="companyList.do" id="listCompanies">List
					Companies</a> <a href="categoryList.do" id="listCategories">List
					Categories</a> <a href="brandList.do" id="listBrands">List Brands</a> <a
					href="medicineList.do" id="listMedicine">List Medicine</a> <a
					href="roleCreate.do" id="createRole">Create Role</a> <a
					href="medicineCreate.do" id="createMedicine">Create Medicine</a> <a
					href="companyCreate.do" id="createCompanyBrand">Create
					Company&Brand</a> <a href="categoryCreate.do" id="createCategory">Create
					Category</a> <a href="getBlockedProducts.do" id="blockedProducts">Blocked
					Products</a> <a href="getAllProducts.do" id="listAllProducts">List
					All Products</a> <a href="createSeller.do?createSeller=${1 }"
					id="createSeller">Create Seller</a> <a href="logout.do" id="logout">Logout</a>
			</div>
			<%
				}
				if (userIns.getRole().getName().equals("Buyer")) {
			%>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a> <a href="getAllProducts.do"
					id="listAllproducts">List All Products</a> <a
					href="getDiscountProducts.do" id="listDiscountProducts">List
					Discount Products</a> <a href="myCart.do" id="myCart">My Cart</a> <a
					href="logout.do" id="logout">Logout</a>

			</div>
			<%
				}
				if (userIns.getRole().getName().equals("Seller")) {
			%>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a> <a href="medicineCreate.do"
					id="createMedicine">Create Medicine</a> <a href="categoryCreate.do"
					id="createCategory">Create Category</a> <a href="companyCreate.do"
					id="createCompanyBrand">Create Company&Brand</a> <a
					href="myOrders.do" id="myOrders">My Orders</a> <a href="logout.do"
					id="logout">Logout</a>
			</div>
			<%
				}
			%>

			<img class="logo-icon logo-icon-index" src="images/drug.png" />
			<h1 id="header"
				style="font-family: 'Charm', cursive; font-size: 40px; margin-top: 20px; float: left; margin-left: 20px;">Online
				Medicine Cart</h1>
			<form action="searchProduct.do">
				<input type="hidden" name="searchBy" value="medicineName" /> <input
					type="text" class="searchBox"
					placeholder="Search for your products here..." name="searchValue"><input
					type="submit" class="searchButton" value="Search" />
			</form>


			<div>
				<a href="#" class="dropdown-toggle glyphicon  notify"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					onclick="myCartProducts()" aria-expanded="false"
					style="color: white;"><img class="myShoppingCart"
					id="myShoppingCart" src="images/MyShoppingCart.png" /> <span
					class="badge" id="count">${countRemainder}</span> </a>
				<ul class="dropdown-menu notify-drop">
					<div class="notify-drop-title">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6">My Cart</div>
							<button type="button" class="btn btn-default btn-sm"
								style="height: 30px; width: 100px; margin-left: 60px"
								onclick="clearMyCart()">
								<span class="glyphicon glyphicon-remove"></span> Clear Cart
							</button>

						</div>
					</div>
					<div class="drop-content">
						<li>
							<div id="myCart"></div>
						</li>
					</div>
					<button type="submit" class="viewShoppingCart"
						onclick="addToMyCart()">View Shopping Cart</button>
			</div>
			</ul>
			<ul class="logout">
				<li><a href="logout.do" style="color: black;" title="logout">
						</span> <span class="glyphicon glyphicon-log-in"
						style="color: black; font-size: 36px;">
				</a></li>
			</ul>
		</div>



		<div id="error" style="color: red; display: block">${message}</div>

		</div>

		<div class="search-container">
			<h3>Search Container</h3>
			<hr>

			<div class="brandListHeader" id="brandList">
				<h3>Brands</h3>
			</div>
			<div class="brandList">
				<c:forEach items="${brandList}" var="brandIns">
					<div class="brandDiv">
						<input type="checkbox" value="on" style="float: left;">
						<div style="margin-top: 12px">
							<a
								href="searchProductByBrand.do?brandId=${brandIns.key.getId() }"
								style="float: left; text-decoration: none; font-size: 16px; color: black;">${brandIns.key.getBrandName() }</a><b
								style="float: right; padding-right: 25px;">${brandIns.value}</b><br>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="brandListHeader">
				<h3>Discount Products</h3>
			</div>
			<div class="brandList" style="height: auto;">
				<div class="brandDiv">
					<input type="checkbox" value="on" style="float: left;">
					<div style="margin-top: 12px">
						<a href="searchProductByDiscount.do?discount=${100 }"
							style="float: left; text-decoration: none; font-size: 16px; color: black;">less
							than 100</a><br>
					</div>
				</div>
				<div class="brandDiv">
					<input type="checkbox" value="on" style="float: left;">
					<div style="margin-top: 12px">
						<a href="searchProductByRange.do?discount=${200 }"
							style="float: left; text-decoration: none; font-size: 16px; color: black;">100
							to 200</a><br>
					</div>
				</div>
				<div class="brandDiv">
					<input type="checkbox" value="on" style="float: left;">
					<div style="margin-top: 12px">
						<a href="getDiscountProducts.do"
							style="float: left; text-decoration: none; font-size: 16px; color: black;">All
							Discount Products</a><br>
					</div>
				</div>
			</div>






		</div>

		<div class="product-container">
			<div class="product-header">
				<h1>
					<center>Top Products</center>
				</h1>
				<div class="dropdown">
					<button class="dropbtn" id="category">Category</button>
					<div class="dropdown-content">
						<c:forEach items="${categoryList}" var="categoryIns">


							<a
								href="searchProductByCategory.do?categoryId=${categoryIns.getId() }">${categoryIns.getCategoryName() }</a>
						</c:forEach>
					</div>

				</div>
			</div>
			<hr>


			<c:choose>
				<c:when test="${medicineList.size()>0}">

					<c:forEach items="${medicineList}" var="medicineIns">
						<div class="card">

							<div class="card-body">
								<img class="productImage" src="${medicineIns.getImageURL()}" />
								<div class="medicine_name">
									<center>
										<h4 class="productName">${medicineIns.getMedicineName()}
										</h4>
									</center>
								</div>
								<c:choose>
									<c:when test="${medicineIns.getDiscountPrice()>0}">
										<div class="strikeoutPrice">
											<strike>Rs. ${medicineIns.getActualPrice() }</strike>
										</div>
									</c:when>
									<c:otherwise>
										<div class="strikeoutPrice">
											<strike></strike>
										</div>
										<div class="price">Rs. ${medicineIns.getActualPrice() }</div>
									</c:otherwise>
								</c:choose>

								<c:if test="${medicineIns.getDiscountPrice()>0 }">
									<div class="price">Rs. ${medicineIns.getDiscountPrice() }</div>
								</c:if>

								<div class="addtoCartButton">
									<button class="addToCart" style="margin-bottom: -10px;"
										id="cart"
										onclick="openPopup('${medicineIns.getMedicineName()}')">Add
										to Cart</button>
								</div>

							</div>
						</div>

					</c:forEach>

				</c:when>
				<c:otherwise>
					<h5>No Related Products</h5>

				</c:otherwise>
			</c:choose>
	</center>
	<script>
		var productCart = [];
		var i = 0;
		function openPopup(value) {
			productCart[i] = value;
			//console.log(productCart);
			i++;
			alert("Your product has been added successfully");
			document.getElementById("count").innerHTML = productCart.length;

		}
		function myCartProducts() {
			document.getElementById("myCart").innerHTML = "";
			if (productCart.length <= 0) {
				document.getElementById("myCart").innerHTML = "<div class='cartEmpty'><center><div style='margin-top:30px;'><h4>Your Cart is Empty!</h4></div></center></div>";
			}

			for (var j = 0; j < productCart.length; j++) {
				var x = document.createElement("HR");
				var para = document.createElement("OL");
				var node = document.createTextNode((j + 1) + "."
						+ productCart[j] + "  " + "1");
				para.appendChild(node);
				var element = document.getElementById("myCart");
				element.appendChild(para);
				x.style.cssText = "width:330px;margin-top:25px;";
				element.appendChild(x);
			}
		}

		function addToMyCart() {

		/*	$.ajax({
				type : "POST",
				data : {
					myArray : JSON.stringify(productCart),
				},
				url : "addToCart.do",
				success : function(data) {
					$('html').html(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					// console.error(errorThrown);
					alert(error)
				}
			});*/
		}
		function clearMyCart() {
			productCart = [];
			document.getElementById("count").innerHTML = productCart.length;
		}
	</script>
</body>


</html>
