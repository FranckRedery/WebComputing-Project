<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS only -->
    <link type="text/css" rel="stylesheet" href="css/productDetails/productStyle.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Product Details</title>
    <script src="js/Signup/signUp.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name="google-signin-client_id" content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body onload="timeOut('${loggato}'">
		
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i>
							techPlanet2022@gmail.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734
							Stonecoal Road</a></li>
					<li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>
				</ul>
				<a id="log" href="login.html"></a> <a id="sign" href="signUp.html"></a>
				<ul class="header-links pull-right">
					<c:if test="${loggato == 'si'}">
				     <a href="javascript:signOut()" style="text-decoration: none;">
							<button class="btnLog">
								<span>Log out</span>
							</button>
						</a>
				  </c:if>
				<c:if test="${loggato == 'no' || loggato == null}">
				
					<a style="text-decoration: none;">
						<button onclick="resetLogin();" class="btnLog">
							<span>Login</span>
						</button>
					</a>
					<a style="text-decoration: none;">
						<button onclick="resetSignUp();" class="btnLog">
							<span>Sign Up</span>
						</button>
					</a>
				</c:if>
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
							<a href="#" class="logo"> <img id="logo"
								src="images/index/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->
					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">All Categories</option>
									<option value="1">Smartphone</option>
									<option value="2">TV</option>
									<option value="3">Accessories</option>
								</select> <input class="input" placeholder="Search here">
								<button class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div style="padding-right: 10%; padding-left: 25%;">
								<a href="#" style="text-decoration: none;"> <i
									class="fa fa-heart" id="heart"></i> <!--<div class="qty">0</div>-->
								</a>
							</div>
							<!-- Cart -->
							<div style="padding-right: 10%;">
								<a href="cart.html" style="text-decoration: none;"> <i
									class="fa fa-shopping-cart"></i> 
									<c:if test="${username != null && numProd > 0}">
									<div class="qty">${numProd}</div>
									</c:if>
								</a>
							</div>
							<!-- /Cart -->

							<!-- User Toogle -->
							<div>
								<c:if test="${loggato == 'si'}">
									<c:if test="${loggatoGoogle == 'si'}">
									<a href="account.html"
										style="text-decoration: none; display: flex;"> <img
										class="profilePic" src='${image}'
										style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										${username}
									</a>								
									</c:if>
									<c:if test="${loggatoGoogle == 'no' || loggatoGoogle == null }">
									<a href="account.html" style="text-decoration: none; display: flex;">
										<c:if test="${image != null && image != ''}">
										 <img class="profilePic" src='images/account/${image}' style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										</c:if>
										<c:if test="${image == null || image == ''}">
										 <img class="profilePic" src='images/account/avatar.png' style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										</c:if>
										${username}
									</a>
									</c:if>
								</c:if>
								<c:if test="${loggato == 'no' || loggato == null }">
								<a href="login.html" style="text-decoration: none;"> <i
									class="fa fa-user"></i>
								</a>
								</c:if>
							</div>
							<!-- /User Toogle -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--/HEADER-->


	<nav id="navigation" class="navbar navbar-expand-sm bg-dark">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"> <i class="fa fa-navicon"
					style="color: white; font-size: 28px"></i>
				</span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="laptopsGallery.html">Laptops</a></li>
					<li class="nav-item"><a class="nav-link"
						href="smartphonesGallery.html">Smartphones</a></li>
					<li class="nav-item"><a class="nav-link"
						href="printersGallery.html">Printers</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">Accessories</a></li>
				</ul>
			</div>
		</div>
	</nav>

    <!-- Single product details -->

    <div class="small-container single-product">
        <div id = "riga" class="row">
            <div class="col-lg-3">
                <img src="images/carrello/iphone1.jpeg" width=100% id="productImg">

                <div class="small-img-row">
                    <div class="small-img-col">
                        <img src="images/carrello/iphone1.jpeg" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/carrello/iphone1.jpeg" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/carrello/iphone1.jpeg" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="images/carrello/iphone1.jpeg" width="100%" class="small-img">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 description">
                <h1>${product.name}</h1>
                <h4>${product.price}0</h4>
                <input type="number" value="1" min="1" max="${product.quantity}" id="quantity" oninput="validity.valid||(value='');">
                <br>
                <br>
                <a href=""><button type="button" class="btn btn-info">
                    <i class="far fa-heart"></i>add to Wishlist
                </button></a>
                <c:if test="${username != null}">
                <a href=""><button type="button" class="btn btn-info" value="${product.id}" id="addProd">
                        <i class="fa fa-cart-plus"></i>add to Cart
                    </button></a>
                </c:if>
                <c:if test="${username == null}">
                <a href="login.html"><button type="button" class="btn btn-info" value="${product.id}">
                        <i class="fa fa-cart-plus"></i>add to Cart
                    </button></a>
                </c:if>
                <h3>Product Details <i class="fa fa-indent"></i></h3>
                <p>${product.description}</p>
                <br>
            </div>
        </div>
    </div>
    
        <section id="testimonials">
        <div class="testimonial-heading">
            <span>Comments</span>
            <h1>Clients Says</h1>
        </div>

        <div class="testimonial-box-container">
        	<c:forEach items="${review}" var="rev">
            <div class="testimonial-box">

                <div class="box-top">

                    <div class="profile">
                        <div class="profile-img">
                            <img src="images/index/user01.png" alt="">
                        </div>
                        <div class="name-user">
                            <strong>${rev.username.username}</strong>
                        </div>
                    </div>
                    <div class="reviews">
                   			<c:forEach var="star" begin="1" end="${rev.stars}">
							<span> <i class="fas fa-star"></i></span>
							</c:forEach>
							<c:forEach var="star" begin="${rev.stars}" end="4">
							<span> <i class="far fa-star"></i></span>
							</c:forEach>
                    </div>                  
                </div>
                <div class="title">
                <strong>${rev.title}</strong>
                </div>
                <div class="client-comment">
                    <p>${rev.description}</p>
                </div>
            </div>
			</c:forEach>
        </div> 
    </section>
    
    <!-- TItle -->

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
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Work with Us</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
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
                                <li><a href="#">Help</a></li>
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
    <script src="js/productDetails/productDetails.js"></script>

</body>

</html>