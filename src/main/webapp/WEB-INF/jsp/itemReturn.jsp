<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link type="text/css" rel="stylesheet" href="css/user/itemReturn.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/Signup/signUp.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name="google-signin-client_id" content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <title>Refund page</title>
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
				<ul class="header-links pull-right">
						<%if (session.getAttribute("loggato") == "si") {%>
								<a href="javascript:signOut()" style="text-decoration: none;">
									<button class="btnLog">
										<span>Log out</span>
									</button>
								</a>
								<%} else {%>
								<a href="login.html" style="text-decoration: none;">
									<button class="btnLog">
										<span>Login</span>
									</button>
								</a>
								<a href="signUp.html" style="text-decoration: none;">
									<button class="btnLog">
										<span>Sign Up</span>
									</button>
								</a>
								<%}%>
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
							<!-- /User Toogle -->>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--/HEADER-->


    <form class="row g-3 needs-validation" novalidate>
        <div class="col-md-6">
            <label for="refundProduct" class="refundProduct">Selected product</label>
            <div class="product-img">
                <img src="images/index/product01.png" alt="" class="img-fluid d-block mx-auto">
            </div>
            <div class="product-info">
            	<span class="info" style="font-size: small;">Product ID : </span>
                <span class="product-id" id="prodId" style="font-size: small;">5</span>
                <br>
                <span class="info" style="font-size: small;">Category : </span>
                <span class="product-type" style="font-size: small;">
                      categoria prodotto
                </span>
                <br>
                <span class="info" style="font-size: small;">Name : </span>
                <span class="product-name" style="font-size: small;">
                       nome prodotto
                </span>
                <br>
                <span class="info" style="font-size: small;">Price : </span>
                <span class="product-price" style="font-size: medium;">$220,5</span>
             </div>
        </div>

        <div class="col-md-4">
            <label for="refundReason" class="refundReason">Refund reason</label>
            <select class="form-select" id="validationReason" required>
                <option selected disabled value="">Choose a reason</option>
                <option>Inadequate performance or quality</option>
                <option>Received wrong item</option>
                <option>Unauthorized purchase</option>
                <option>Damaged item</option>
                <option>Defective or non-functioning item</option>
                <option>Missing components or accessories</option>
                <option>Other, specify in the description</option>
            </select>
            <div class="invalid-feedback">
                Please select a valid reason.
            </div>
        </div>

        <div class="col-md-2"></div>
        <div class="col-md-6"></div>
        <div class="col-md-4">
                <!--<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">-->
                <label for="description" class="description" id="description">Additional description (optional)</label>
                <textarea class="form-control" rows="5" name="text" id="textArea"></textarea>
                <!--<div class="invalid-feedback">
                    Specify the reasons for the refund in the description.
                </div>-->
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-12">
            <button class="btn btn-primary" type="submit">Submit</button>
        </div>
    </form>




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
    <script src="js/itemReturn/itemReturn.js"></script>
</body>

</html>