<!DOCTYPE html>
<html lang="it">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/account/accountStyle.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="owl_carousel/owl.carousel.css">
	<link rel="stylesheet" href="owl_carousel/owl.theme.default.css">
	  <script src="js/LoginAdmin/adminLogin.js"></script>
<script src="js/Signup/signUp.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<meta name="google-signin-client_id"
	content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<title>TechPlanet</title>
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
						<a href="javascript:signOut()" style="text-decoration: none;">
							<button class="btnLog">
								<span>Log out</span>
							</button>
						</a>
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
									class="fa fa-shopping-cart"></i> <!--<div class="qty">0</div>-->
								</a>
							</div>
							<!-- /Cart -->

							<!-- User Toogle -->
							<div>
								<%if (session.getAttribute("loggato") == "si"){%>
									<%
									if (session.getAttribute("loggatoGoogle") == "si") {
									%>
									<a href="account.html"
										style="text-decoration: none; display: flex;"> <img
										class="profilePic" src='${image}'
										style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										${username}
									</a>
									<%
									} else {
									%>
									<a href="account.html"
										style="text-decoration: none; display: flex;"> <img
										class="profilePic" src='images/account/avatar.png'
										style="border-radius: 50%;" width="29" height="29" alt="Avatar">
										${username}
									</a>
									<%
									}
									%>
								<%} else{%>
								<a href="login.html" style="text-decoration: none;"> 
									<i class="fa fa-user"></i>
								</a>
								<%}%>
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
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			  <span class="navbar-toggler-icon">
				  <i class="fa fa-navicon" style="color:white; font-size:28px"></i>
			  </span>
		  </button>
		  <div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a class="nav-link" href="/">Home</a>
				  </li>
				  <!--<li class="nav-item">
					<a class="nav-link" href="javascript:void(0)">Hot Deals</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="javascript:void(0)">Categories</a>
				  </li>-->
				  <li class="nav-item">
					<a class="nav-link" href="laptopsGallery.html">Laptops</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="smartphonesGallery.html">Smartphones</a>
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



	<h3 style="text-align: center; margin-top: 1%;">${username}'s ACCOUNT</h3>

  <div class="containerCardsAcc">
	<a style="text-decoration: none;" href="#">
	<div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
		<div class="row g-0">
		  <div class="col-md-4">
			<img src="images/account/box01.png" class="img-fluid rounded-start" alt="...">
		  </div>
		  <div class="col-md-8">
			<div class="cardAcc-body">
			  <h5 class="card-title">My order</h5>
			  <p  class="card-text">Check your orders here.</p>
			</div>
		  </div>
		</div>
	   </a>
	</div>
	
	
	<a style="text-decoration: none;" href="editProfile.html">
	  <div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
		<div class="row g-0">
		  <div class="col-md-4">
			<img src="images/account/user01.png" class="img-fluid rounded-start" alt="...">
		  </div>
		  <div class="col-md-8">
			<div class="cardAcc-body">
			  <h5 class="card-title">Edit profile</h5>
			  <p class="card-text">Edit aspects of your profile: Name, address, Country. </p>
			</div>
		  </div>
		</div>
	   </a>
	  </div>

	  <a style="text-decoration: none;" href="#">
	  <div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
		<div class="row g-0">
		  <div class="col-md-4">
			<img src="images/account/list01.png" class="img-fluid rounded-start" alt="...">
		  </div>
		  <div class="col-md-8">
			<div class="cardAcc-body">
			  <h5 class="card-title">Purchase history</h5>
			  <p class="card-text">Check your purchase history here.</p>
			</div>
		  </div>
		</div>
	  </a>
	 </div>
    </div>
    
    <%if (session.getAttribute("loggatoGoogle") == "si") {%>
	<div class="containerCardsAcc">
		<a style="text-decoration: none;" href="javascript:error()">
		<div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
			<div class="row g-0">
			  <div class="col-md-4">
				<img src="images/account/hack01.png" class="img-fluid rounded-start" alt="...">
			  </div>
			  <div class="col-md-8">
				<div class="cardAcc-body">
				  <h5 class="card-title">Security</h5>
				  <p  class="card-text">Change your email or password here.</p>
				</div>
			  </div>
			</div>
		   </a>
		</div>
	
	 <div id="errore" class="modal">
	  <div id="msg" class="modal-content animate" style="width: 50%">
	   <div class="container">
	   <a href="javascript:close()">
	     <button style="background: transparent; border: 0; font-size:24px"><i  class="fa fa-close"></i></button>
	   </a>
	      <img src="images/account/alert.gif"  width="120" height="120" style="margin-left: auto; margin-right: auto; display: block;">
	     <h3 style="color: white">we are sorry but it is not possible to change your email or password if you have logged in or registered with GOOGLE, if you want to change your google account email or password, you can do it <a href="https://myaccount.google.com/intro/signinoptions/password" target="_blank">here.</a></h3>
	   </div>
 	  </div>
	 </div>
	<%} else {%>
	 
	<div class="containerCardsAcc">
		<a style="text-decoration: none;" href="security.html">
		<div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
			<div class="row g-0">
			  <div class="col-md-4">
				<img src="images/account/hack01.png" class="img-fluid rounded-start" alt="...">
			  </div>
			  <div class="col-md-8">
				<div class="cardAcc-body">
				  <h5 class="card-title">Security</h5>
				  <p  class="card-text">Change your email or password here.</p>
				</div>
			  </div>
			</div>
		   </a>
		</div>
	<%}%>
	
		<a style="text-decoration: none;" href="cart.html">
		  <div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
			<div class="row g-0">
			  <div class="col-md-4">
				<img src="images/account/cart01.png" class="img-fluid rounded-start" alt="...">
			  </div>
			  <div class="col-md-8">
				<div class="cardAcc-body">
				  <h5 class="card-title">Your Cart</h5>
				  <p class="card-text">View your shopping cart here.</p>
				</div>
			  </div>
			</div>
		   </a>
		  </div>
	
		  <a style="text-decoration: none;" href="/contattaci">
		  <div id="cardsAcc" class="card mb-4" style="max-width: 300px; max-height: 300px;">
			<div class="row g-0">
			  <div class="col-md-4">
				<img src="images/account/help01.png" class="img-fluid rounded-start" alt="...">
			  </div>
			  <div class="col-md-8">
				<div class="cardAcc-body">
				  <h5 class="card-title">Help</h5>
				  <p class="card-text">you can find help here.</p>
				</div>
			  </div>
			</div>
		  </a>
		</div>
		</div>



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
								<li><a href="account.html">My Account</a></li>
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

<script>
var modal = document.getElementById('errore');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>