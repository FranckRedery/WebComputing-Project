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
    <link type="text/css" rel="stylesheet" href="css/productGallery/productGallery.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Electronic</title>
    <script src="js/Signup/signUp.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name="google-signin-client_id" content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>
    <!-- HEADER -->
    <header>
        <!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i>
							email@email.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734
							Stonecoal Road</a></li>
					<li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>
				</ul>
				<a id="log" href="login.html"></a> <a id="sign" href="signUp.html"></a>
				<ul class="header-links pull-right">
					<%
					if (session.getAttribute("loggato") == "si") {
					%>
						<%
						if (session.getAttribute("loggatoGoogle") == "si") {
						%>
						<a href="javascript:signOut()" style="text-decoration: none;">
							<button class="btnLog">
								<span>Log out</span>
							</button>
						</a>
						<%
						} else {
						%>
						<a href="/faiLogout" style="text-decoration: none;">
							<button class="btnLog">
								<span>Log out</span>
							</button>
						</a>
						<%
						}
						%>
					<%
					} else {
					%>
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
					<%
					}
					%>
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
                            <a href="index.html" class="logo">
                                <img id="logo" src="images/index/logo.png" alt="">
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
                                </select>
                                <input class="input" placeholder="Search here">
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
                                <a href="#" style="text-decoration: none">
                                    <i class="fa fa-heart" id="heart"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                            <!-- Cart -->
                            <div style="padding-right: 10%;">
                                <a href="cart.html" style="text-decoration: none;">
                                    <i class="fa fa-shopping-cart"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>
                            <!-- /Cart -->

                            <!-- User Toogle -->
                            <div>
                                <a href="account.html" style="text-decoration: none;">
                                    <i class="fa fa-user"></i>
                                </a>
                            </div>
                            <!-- /User Toogle -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <nav id="navigation" class="navbar navbar-expand-sm bg-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon">
                    <i class="fa fa-navicon" style="color:white; font-size:28px"></i>
                </span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">Home</a>
                    </li>
                    <!--<li class="nav-item">
					<a class="nav-link" href="javascript:void(0)">Hot Deals</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="javascript:void(0)">Categories</a>
				  </li>-->
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">Laptops</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">Smartphones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">Tvs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">Accessories</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="box-container">
    	<c:forEach items="${products}" var="prod">
        <div class="box">
            <div class="image">
                <img src="images/index/product01.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">${prod.name}</h3>
                <div class="subInfo">
                    <div class="price"><strong>${prod.price}0$</strong></div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        </c:forEach>
        <!-- <div class="box">
            <div class="image">
                <img src="images/index/product02.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product03.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product04.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product05.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product06.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product07.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product08.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
        <div class="box">
            <div class="image">
                <img src="images/index/product09.png" alt="">
            </div>
            <div class="info">
                <h3 class="title">iphone x</h3>
                <div class="subInfo">
                    <div class="price">1200$</div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
            </div>
            <div class="overlay">
                <a href="#" style="--i:1;" class="fas fa-shopping-cart"></a>
                <a href="#" style="--i:2;" class="fas fa-heart"></a>
                <a href="#" style="--i:3;" class="fas fa-search"></a>
            </div>
        </div>
         -->
    </div>
    <ul class="pagination justify-content-center">
        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
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
    <script src="js/productGallery.js"></script>

</body>

</html>