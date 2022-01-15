<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="it">

<head>
	<!-- Termini accentati -->
	<meta charset="utf-8">
	
	<!-- Favicon -->
	<link rel="icon" href="../images/index/logo.png" type="image/x-icon"/>
	
	<!-- Titolo -->
	<title>Select your product</title>
	
	<!-- CSS -->
	<link href="../css/guidaSceltaProdotto/guidaSceltaProdotto.css" rel="stylesheet" type="text/css" />
	
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>	

	<!-- JS -->
	<script src="../js/guidaSceltaProdotto/modelloDomande.js"></script>
	<script src="../js/guidaSceltaProdotto/chiamateAjax.js"></script>
	<script src="../js/guidaSceltaProdotto/sceltaProdotto.js"></script>
	<script src="../js/guidaSceltaProdotto/caricaDomandeCategoria.js"></script>
	
	<!--AJAX ha la dipendenza nel pom -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!------------------------GRUPPO-------------------------------------------->	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link type="text/css" rel="stylesheet" href="css/index/style.css" />
<link rel="icon" href="images/index/logo.png" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css"
	integrity="sha512-OTcub78R3msOCtY3Tc6FzeDJ8N9qvQn1Ph49ou13xgA9VsH9+LRxoFU6EqLhW4+PKRfU+/HReXmSZXHEkpYoOA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/guidaSceltaProdotto/guidaSceltaProdotto.css"
	rel="stylesheet" type="text/css" />
<script src="js/Signup/signUp.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<meta name="google-signin-client_id"
	content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!------------------------GRUPPO-------------------------------------------->		


</head>

<body>

<!-------------------------GRUPPO--------------------------------------------->

	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i>
							techPlanet2022@gmail.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i>Ponte Pietro Bucci, 87036 Quattromiglia CS</a></li>
					<li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>
				</ul>
				<a id="log" href="login.html"></a> <a id="sign" href="signUp.html"></a>
				<ul class="header-links pull-right">
					<c:if test="${loggato == 'si'}">
						<c:if test="${isAdmin == 't'}">
						  <a href="adminPage" style="text-decoration: none;">
							<button class="btnAdmin">
								<span>Admin View <img src="images/index/adminBtn.gif"  width="20" height="20"></span>
							</button>
						  </a>
						</c:if>
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
							<a href="/" class="logo"> <img id="logo"
								src="images/index/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->
					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form method= "post" action="/searchProduct" >
								<select class="input-select" name="categories">
									<option value="All Categories">All Categories</option>
									<option value="notebooks">Notebooks</option>
									<option value="smartphones">Smartphones</option>
									<option value="printers">Printers</option>
									<option value="cameras">Cameras</option>
									<option value="accessories">Accessories</option>
									<option value="tvs">Tvs</option>
								</select> <input class="input" placeholder="Search here" name="productName">
								<button type="submit" class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3">
						<div class="header-ctn">
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
									<div style="display: flex">
									<a href="account.html" style="text-decoration: none; display: flex;">
										<c:if test="${image != null && image != ''}">
										 <img class="profilePic" src='${image}' style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										</c:if>
										<c:if test="${image == null || image == ''}">
										 <img class="profilePic" src='images/account/avatar.png' style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										</c:if>
									</a><p id="nameP" class="overflow-ellipsis">${username}</p>
									</div>
									</c:if>
								</c:if>
								<c:if test="${loggato == 'no' || loggato == null }">
								<a href="login.html" style="text-decoration: none; margin-right: 20px;"> <i
									class="fa fa-user"></i>
								</a>
								</c:if>
							</div>
							<!-- /User Toogle -->
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
							<!-- Wishlist -->
							<div style="padding-right: 10%; padding-left: 0%;">
								<a href="wishList.html" style="text-decoration: none;"> <i
									class="fa fa-heart" id="heart"></i> 
									<c:if test="${username != null && numWishList > 0}">
									<div class="qty" id="wishList">${numWishList}</div>
									</c:if>
								</a>
							</div>
							<!-- WishList -->
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
						href="notebooksGallery.html">Notebooks</a></li>
					<li class="nav-item"><a class="nav-link"
						href="smartphonesGallery.html">Smartphones</a></li>
					<li class="nav-item"><a class="nav-link"
						href="printersGallery.html">Printers</a></li>
					<li class="nav-item"><a class="nav-link"
						href="camerasGallery.html">Cameras</a></li>
					<li class="nav-item"><a class="nav-link"
						href="accessoriesGallery.html">Accessories</a></li>
					<li class="nav-item"><a class="nav-link"
						href="tvsGallery.html">Tvs</a></li>
				</ul>
			</div>
		</div>
	</nav>


<!-------------------------GRUPPO--------------------------------------------->

<!-------------------------FABIO--------------------------------------------->
    <!-- Grafica superiore %% immagine sfondo più descrizione -->
    <div>
    	<div>
			<div id = "imageDescription">
			</div>
		</div>
	</div>
	
	<!-- Parte centrale %% seleziona categoria / rispondi domande -->
	<div class="container container--grid" id = "container">
	
		<div class="row" id = "rigaIndiceDomande">
		</div>
				
		<div id = "rigaDomandeDescrizione">
			<div class="row">
				<div class="col-sm-6" id = "domandeRisposte">
					<div id = "domande">	
					</div>
					<div id = risposte>
					</div>
				</div>
				<div class="col-sm-6" id = "descrizione"  class = "sticky">
				</div>
			</div>
			
			<div class="row" id = "pulsanti">
				<div class="col-sm-6" id = "indietro">
					<button type="button" class="btn btn-light" id = "pulsanteIndietro">Back</button>
				</div>
				<div class="col-sm-6" id = "avanti">
					<button type="button" class="btn btn-primary" id = "pulsanteAvanti">Next</button>
				</div>
			</div>
		</div>
	</div>
	
	<br />
	<div id = "segnalazione">
		<button type="button" class="btn btn-primary" id = "pulsanteProblema">Problem</button>
		<div id = "segnalazione2">
		</div>
		<button type="button" class="btn btn-light" id = "pulsanteInvia" >Send report</button>
	</div>
	<br />
<!-------------------------FABIO--------------------------------------------->

<!-------------------------GRUPPO--------------------------------------------->	

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
								<li><a href="http://www.shorturl.at/nwES4"><i class="fa fa-map-marker"></i>Ponte Pietro Bucci, 87036 Quattromiglia CS</a></li>
								<li><i class="fa fa-phone"></i>+021-95-51-84</li>
								<li><a href="mailto:teachplanet22@gmail.com"><i class="fa fa-envelope"></i>teachplanet22@gmail.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="notebooksGallery.html">Laptops</a></li>
								<li><a href="smartphonesGallery.html">Smartphones</a></li>
								<li><a href="tvGallery.html">Tvs</a></li>
								<li><a href="accessoriesGallery.html">Accessories</a></li>
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
								<li><a href="account.html">My Account</a></li>
								<li><a href="cart.html">View Cart</a></li>
								<li><a href="wishList.html">Wishlist</a></li>
								<li><a href="/myOrder.html">Order and Returns</a></li>
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

<!-------------------------GRUPPO--------------------------------------------->	
	

</body>

</html>
    