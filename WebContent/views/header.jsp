<%@page import="com.spring.DomainClasses.User"%>
<head>
<link href="https://fonts.googleapis.com/css?family=Charm|Felipa|Lobster" rel="stylesheet">
</head>

				<div class="header">
			<span style="font-size: 60px; cursor: pointer; float: left;margin-right:20px;" title="More Options"
				onclick="openNav()">&#9776; </span>
				<%User userIns = (User)session.getAttribute("user"); 
				if(userIns.getRole().getName().equals("admin")){ %>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a>
				<a href="userList.do" id="listUsers">List Users</a>
				<a href="roleList.do" id="listRoles">List Roles</a> 
				<a href="companyList.do" id="listCompanies">List Companies</a>
				<a href="categoryList.do" id="listCategories">List Categories</a>
				<a href="brandList.do" id="listBrands">List Brands</a>
				<a href="medicineList.do" id="listMedicine">List Medicine</a>
				<a href="roleCreate.do" id="createRole">Create Role</a>
				<a href="medicineCreate.do" id="createMedicine">Create Medicine</a>
				<a href="companyCreate.do" id="createCompanyBrand">Create Company&Brand</a>
				<a href="categoryCreate.do" id="createCategory">Create Category</a>
				<a href="getBlockedProducts.do" id="blockedProducts">Blocked Products</a>
				<a href="getAllProducts.do" id="listAllProducts">List All Products</a>
				<a href="createSeller.do?createSeller=${1 }" id="createSeller">Create Seller</a>
				<a href="logout.do" id="logout">Logout</a>
			</div>
			<%}  if(userIns.getRole().getName().equals("Buyer")){ %>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a>
				<a href="getAllProducts.do" id="listAllproducts">List All Products</a>
				<a href="getDiscountProducts.do" id="listDiscountProducts">List Discount Products</a>
				<a href="myCart.do" id="myCart">My Cart</a>
				<a href="logout.do" id="logout">Logout</a>
				 
				 
			</div>
			<%}  if(userIns.getRole().getName().equals("Seller")) { %>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="home.do" id="home">Home</a>
				<a href="medicineCreate.do" id="createMedicine">Create Medicine</a>
				<a href="categoryCreate.do" id="createCategory">Create Category</a>
				<a href="companyCreate.do" id="createCompanyBrand">Create Company&Brand</a>
				<a href="myOrders.do" id="myOrders">My Orders</a>
				<a href="logout.do" id="logout">Logout</a>				 
			</div>
			<%} %>
			
			<img class="logo-icon logo-icon-index" src="images/drug.png" />
			<p style="float: left; font-family: 'Charm', cursive;font-size:40px;margin-top:10px;margin-left:20px;">Online
				Medicine Cart</p>
			<form action="">
				<input type="text" class="searchBox" /><input type="submit"
					class="searchButton" value="Search" />
				
			</form>
				<ul class="logout">
					<li><a href="logout.do"
						style="color: black;" title="logout"> </span>
							 <span class="glyphicon glyphicon-log-in" 
							style="color: black; font-size: 36px;"></span></a></li>
				</ul>
		</div>