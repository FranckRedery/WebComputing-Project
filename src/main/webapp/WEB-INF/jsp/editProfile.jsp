
<html lang="it">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/index/style.css" />
	<link type="text/css" rel="stylesheet" href="css/account/accountStyle.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="owl_carousel/owl.carousel.css">
	<link rel="stylesheet" href="owl_carousel/owl.theme.default.css">
    <script src="js/aditProfile/editProfile.js"></script>
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
						<li><a href="#"><i class="fa fa-envelope"></i> email@email.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
						<li><a href="#"><i class="fa fa-eur"></i> EUR</a></li>
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
								<a href="#" class="logo">
									<img id = "logo" src="images/index/logo.png" alt="">
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
								<div style = "padding-right: 10%; padding-left: 25%;">
									<a href="#" style="text-decoration: none;">
										<i class="fa fa-heart" id="heart"></i>
										<!--<div class="qty">0</div>-->
									</a>
								</div>
	
								<!-- Cart -->
								<div style = "padding-right: 10%;">
									<a href="#" style="text-decoration: none;">
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
					<a class="nav-link" href="index.html">Home</a>
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



	<h3 style="text-align: center; margin-top: 1%;">EDIT YOU PROFILE</h3>

	<div class="container rounded bg-white mt-6 mb-6">
		<div class="row">
			<div class="col-md-4 border-right">
				<div class="profile-pic-wrapper">
 					 <div class="pic-holder">
					    <img id="profilePic" class="pic" src="https://source.unsplash.com/random/150x150">
   							<label for="newProfilePhoto" class="upload-file-block">
      						  <div class="text-center">
        						<div class="mb-2">
        						  <i class="fa fa-camera fa-2x"></i>
       						    </div>
       						   <div class="text-uppercase">
      						     Update <br /> Profile Photo
     					       </div>
     				     	 </div>
   					      </label>
   					 <Input class="uploadProfileInput" type="file" name="profile_pic" id="newProfilePhoto" accept="image/*" style="display: none;" />
 			 </div>
 			 <h1>Edit image here</h1>
          </div>
			</div>
			<div class="col-md-6 border-right">
				<div class="p-5 py-6">
					<div class="row mt-3">
						<div class="col-md-10"><label class="labels">Name</label><input type="text" class="form-control" placeholder="first name" value=""></div>
						<div class="col-md-10"><label class="labels">Surname</label><input type="text" class="form-control" value="" placeholder="surname"></div>
					</div>
					<div class="row mt-4">
						<div class="col-md-10"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="enter phone number" value=""></div>
						<div class="col-md-10"><label class="labels">Address Line 1</label><input type="text" class="form-control" placeholder="enter address line 1" value=""></div>
						<div class="col-md-10"><label class="labels">Address Line 2</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
						<div class="col-md-10"><label class="labels">Postcode</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
						<div class="col-md-10"><label class="labels">State</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
						<div class="col-md-10"><label class="labels">Area</label><input type="text" class="form-control" placeholder="enter address line 2" value=""></div>
						<div class="col-md-10"><label class="labels">Education</label><input type="text" class="form-control" placeholder="education" value=""></div>
					</div>
					<div class="row mt-3">
						<div class="col-md-10"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value=""></div>
						<div class="col-md-10"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state"></div>
					</div>
					<div class="mt-4 text-center">
						<button class="btn btn-primary profile-button" type="button">Save Profile</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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


</body>
</html>