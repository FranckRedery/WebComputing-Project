<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/admin/deleteProd.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
		integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Delete product</title>
</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> techPlanet2022@gmail.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
					<li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="/" class="logo">
								<img id="logo" src="images/index/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- ACCOUNT -->
					<div class="col-md-9">
						<div class="header-ctn">

							<!-- Wishlist -->
							<div style="padding-right: 3%; margin-top: 3%"  id="firstElement">
								<a href="addProduct" style="text-decoration: none;">
									<i class="fas fa-cart-plus" id="add"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>

							<div style="padding-right: 3%; margin-top: 3%">
								<a href="deleteProd" style="text-decoration: none;">
									<i class="fas fa-trash" id="trash"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							
							<!-- Cart -->
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="modifyProd" style="text-decoration: none;">
									<i class="fas fa-edit"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="returnRequests" style="text-decoration: none;">
									<i class="fas fa-truck-loading" id="truck2"></i></a>
							</div>
							<!-- /Cart -->
							
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="addAdmin" style="text-decoration: none;">
									<i class="fas fa-user-tie" id="addAdmin"></i></a>
							</div>
							
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="deleteAdmin" style="text-decoration: none;">
									<i class="fas fa-user-slash" id="deleteAdmin"></i></a>
							</div>

							<div style="padding-right: 3%; margin-top: 3%">
								<a href="/viewJobs" style="text-decoration: none;">
									<i class="fas fa-user-plus" id="positions"></i></a>
							</div>
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="/viewCurriculum" style="text-decoration: none;">
									<i class="fas fa-book-open" id="curriculum"></i></a>
							</div>							
							<div style="padding-right: 3%; margin-top: 3%">
								<a href="/viewReports" style="text-decoration: none;">
									<i class="fas fa-bug" id="report"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--/HEADER-->

	<h2 style="margin-top:2%;" id="pageTitle">Delete product</h2>

	<form class="needs-validation" novalidate>
		<div class="mb-3">
			<label class="form-label" for="productName" style="margin-top: 3%;">Name</label>
			<input type="text" class="form-control" id="productName" placeholder="Product name" required>
			<div class="invalid-feedback">Please enter a valid product name.</div>
		</div>
		<button type="submit"  class="btn btn-primary" id="btnSearch">Search the product</button>
	</form>
	
	<c:if test = "${product != null}">
     <div class="row" id="riga">
		<div class="col-md-7">
            <label class="selectedProduct" id="selectedProd">Selected product</label>
            <div class="product-img">
                <img src="${product.image}" class="img-fluid d-block mx-auto" width="400" height= auto>
            </div>
            <div class="product-info">
            	<span class="info" style="font-size: small;">Product ID : </span>
                <span class="product-id" id="prodId" style="font-size: small;">${product.id}</span>
                <br>
                <span class="info" style="font-size: small;">Category : </span>
                <span class="product-type" style="font-size: small;">${product.category}</span>
                <br>
                <span class="info" style="font-size: small;">Name : </span>
                <span class="product-name" style="font-size: small;">${product.name}
                </span>
                <br>
                <span class="info" style="font-size: small;">Price : </span>
                <span class="product-price" style="font-size: medium;">$${product.price}</span>
                </div>
        </div>
        
        <div class="col-md-5">
        	<button type="button" class="btn btn-danger" onclick="deleteFunction();">Delete product</button>
        	<br>
        	<a href="/adminPage"><button type="button" class="btn btn-primary" id="btnHome">Back to homepage</button></a> 
        </div>
        
      </div>
	 </c:if>
	   
	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">About Us</h3>
							<p>We are a friend with a passion of tecnologies.</p>
							<ul class="footer-links">
								<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
								<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>email@email.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="#">Hot deals</a></li>
								<li><a href="#">Laptops</a></li>
								<li><a href="#">Smartphones</a></li>
								<li><a href="#">Tvs</a></li>
								<li><a href="#">Accessories</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Information</h3>
							<ul class="footer-links">
								<li><a href="/aboutUs.html">About Us</a></li>
								<li><a href="/contactUs">Contact Us</a></li>
								<li><a href="/workWithUs/workInCompany">Work with Us</a></li>
								<li><a href="/privacyPolicy">Privacy Policy</a></li>
								<li><a href="/termsAndConditions">Terms & Conditions</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Service</h3>
							<ul class="footer-links">
								<li><a href="#">My Account</a></li>
								<li><a href="#">View Cart</a></li>
								<li><a href="#">Wishlist</a></li>
								<li><a href="#">Order and Returns</a></li>
								<li><a href="/customerSupport">Customer Support</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->
	</footer>
	<!-- /FOOTER -->
	<script src="js/admin/deleteProd.js"></script>
</body>

</html>