<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="it">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/account/accountStyle.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="owl_carousel/owl.carousel.css">
	<link rel="stylesheet" href="owl_carousel/owl.theme.default.css">
    <script src="js/editProfile/editProfile.js"></script>
    <script src="js/Signup/signUp.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name="google-signin-client_id" content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
</head>

<title>TechPlanet</title>
</head>

<body onload="timeOutS('${loggato}','${update}')">
		
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="mailto:teachplanet22@gmail.com"><i class="fa fa-envelope"></i>techPlanet2022@gmail.com</a></li>
					<li><a href="http://www.shorturl.at/nwES4"><i class="fa fa-map-marker"></i>Ponte Pietro Bucci, 87036 Quattromiglia CS</a></li>
					<li><a href="#"><i class="fas fa-dollar-sign"></i> USD</a></li>
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
				<div class="row head">
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

		
	<nav id="navigation" class="navbar navbar-expand-md bg-dark">
		<div class="container-fluid">
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			  <span class="navbar-toggler-icon">
				  <i class="fa fa-navicon" style="color:white; font-size:28px"></i>
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



	<h3 style="text-align: center; margin-top: 1%;">EDIT YOUR PROFILE ${username}</h3>

	<div class="container rounded bg-white mt-6 mb-6">
		<div class="row">
			<div class="col-md-4 border-right">
				<div class="profile-pic-wrapper">
 					 <div class="pic-holder">
 					   <div class="circle">
 					   <c:if test="${image == null}">
					      <img id="profilePicIMG" class="pic" src="images/account/avatar.png">										
					   </c:if>
 					   <c:if test="${image != null}">
					      <img id="profilePicIMG" class="pic" src="${image}">									
					   </c:if>
 			 		 </div>
 			 		 </div>
   					  <form method="post" id="ImageForm" enctype="multipart/form-data" action="/updateImage">
	   					 <input type="file" name="image" id="image" accept="image/png, image/jpeg, image/gif" required/>
	   					 <input type="hidden" name="username" value= "${username}">
	   					 <div style="margin-top: 20px; display: flex; flex-direction: row; justify-content: center; align-items: center;">
	   					 	<button class="btn btn-primary profile-button" type="submit">Update Image</button>
	   					 </div>
   					  </form>
 			 <h1>Edit image here</h1>
          </div>
			</div>
			
	<div id="errore" class="modal">
	  <div id="msg" class="modal-content animate" style="width: 50%">
	   	<div class="container">
	      <img id="imgStatus" src="images/account/loadingCircle.gif"  width="120" height="120" style="margin-left: auto; margin-right: auto; display: block;">
	     <p id="msgAlert" style="color: white">we are uploading your Profile picture...</p>
	     <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
	     <div id="myProgress">
  			<div id="myBar">1%</div>
		 </div>
	     </div>
	      <div style="display: flex; align-items: center; justify-content: center; margin-top: 15px; margin-bottom: 15px; ">
	     <a id="closeB">
	     	<button class="btn btn-primary profile-button">close</button>
	     </a>
	      </div>
	   </div>
 	  </div>
	 </div>
			
			
			<div class="col-md-6 border-right">
			 <form  id="infoForm" method="post" action="update">
				<div class="p-5 py-6">
					<div class="row mt-3">
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Email</label>
						    <p style="font-size: 20px"><strong>${email}</strong>
						   <a href="security.html">
						   <c:if test="${loggato == 'no' || loggatoGoogle == null}">
						  <button style="margin-right:3%; margin-left:3%; padding: 5px" class="btn btn-primary profile-button" type="button">edit</button>
						    </c:if>
						   </a>
						    </p>
						</div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Username</label><p style="font-size: 20px"><strong>${username}</strong><a href="security.html"></a></p></div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Name</label><input type="text" class="form-control" placeholder="first name" name="name" value="${name}"></div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Surname</label><input type="text" class="form-control" name="surname" value="${surname}" placeholder="surname"></div>
					</div>
					<div class="row mt-4">
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Mobile Number</label><input type="tel" class="form-control" placeholder="enter phone number" name="phonenumber" value="${phonenumber}"  pattern="[0-9]{3}[0-9]{3}[0-9]{4}" title="the number entered is not in the required format of 10 numbers" ></div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Address Line 1</label><input type="text" class="form-control" placeholder="enter address line 1" name="addressline1" value="${addressline1}"></div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Address Line 2</label><input type="text" class="form-control" placeholder="enter address line 2" name="addressline2" value="${addressline2}"></div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Postcode</label><input type="text" class="form-control" placeholder="enter postcode" name="postcode" value="${postcode}" pattern="[0-9]{5}" title="the inserted postcode is not in the required format. ex (10010, 77644, 87050)"></div>
					</div>
					<div class="row mt-3">
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Province</label>
						<select class="form-control"  name="stateregion">
							<c:if test="${stateregion == '' || stateregion == null}">
						        <option value="${stateregion}" selected>${stateregion}</option>
							</c:if>
							<c:if test="${stateregion != '' || stateregion != null}">
						        <option value="${stateregion}" selected>${stateregion}</option>
							</c:if>
	              		        <option value="Agrigento">Agrigento</option>
								<option value="Alessandria">Alessandria</option>
								<option value="Ancona">Ancona</option>
								<option value="Aosta">Aosta</option>
								<option value="Arezzo">Arezzo</option>
								<option value="Ascoli Piceno">Ascoli Piceno</option>
								<option value="Asti">Asti</option>
								<option value="Avellino">Avellino</option>
								<option value="Bari">Bari</option>
								<option value="Barletta-Andria-Trani">Barletta-Andria-Trani</option>
								<option value="Belluno">Belluno</option>
								<option value="Benevento">Benevento</option>
								<option value="Bergamo">Bergamo</option>
								<option value="Biella">Biella</option>
								<option value="Bologna">Bologna</option>
								<option value="Bolzano">Bolzano</option>
								<option value="Brescia">Brescia</option>
								<option value="Brindisi">Brindisi</option>
								<option value="Cagliari">Cagliari</option>
								<option value="Caltanissetta">Caltanissetta</option>
								<option value="Campobasso">Campobasso</option>
								<option value="Carbonia-iglesias">Carbonia-iglesias</option>
								<option value="Caserta">Caserta</option>
								<option value="Catania">Catania</option>
								<option value="Catanzaro">Catanzaro</option>
								<option value="Chieti">Chieti</option>
								<option value="Como">Como</option>
								<option value="Cosenza">Cosenza</option>
								<option value="Cremona">Cremona</option>
								<option value="Crotone">Crotone</option>
								<option value="Cuneo">Cuneo</option>
								<option value="Enna">Enna</option>
								<option value="Fermo">Fermo</option>
								<option value="Ferrara">Ferrara</option>
								<option value="Firenze">Firenze</option>
								<option value="Foggia">Foggia</option>
								<option value="Forl??-Cesena">Forl&igrave;-Cesena</option>
								<option value="Frosinone">Frosinone</option>
								<option value="Genova">Genova</option>
								<option value="Gorizia">Gorizia</option>
								<option value="Grosseto">Grosseto</option>
								<option value="Imperia">Imperia</option>
								<option value="Isernia">Isernia</option>
								<option value="La spezia">La spezia</option>
								<option value="L'aquila">L'aquila</option>
								<option value="Latina">Latina</option>
								<option value="Lecce">Lecce</option>
								<option value="Lecco">Lecco</option>
								<option value="Livorno">Livorno</option>
								<option value="Lodi">Lodi</option>
								<option value="Lucca">Lucca</option>
								<option value="Macerata">Macerata</option>
								<option value="Mantova">Mantova</option>
								<option value="Massa-Carrara">Massa-Carrara</option>
								<option value="Matera">Matera</option>
								<option value="Medio Campidano">Medio Campidano</option>
								<option value="Messina">Messina</option>
								<option value="Milano">Milano</option>
								<option value="Modena">Modena</option>
								<option value="Monza e della Brianza">Monza e della Brianza</option>
								<option value="Napoli">Napoli</option>
								<option value="Novara">Novara</option>
								<option value="Nuoro">Nuoro</option>
								<option value="Ogliastra">Ogliastra</option>
								<option value="Olbia-Tempio">Olbia-Tempio</option>
								<option value="Oristano">Oristano</option>
								<option value="Padova">Padova</option>
								<option value="Palermo">Palermo</option>
								<option value="Parma">Parma</option>
								<option value="Pavia">Pavia</option>
								<option value="Perugia">Perugia</option>
								<option value="Pesaro e Urbino">Pesaro e Urbino</option>
								<option value="Pescara">Pescara</option>
								<option value="Piacenza">Piacenza</option>
								<option value="Pisa">Pisa</option>
								<option value="Pistoia">Pistoia</option>
								<option value="Pordenone">Pordenone</option>
								<option value="Potenza">Potenza</option>
								<option value="Prato">Prato</option>
								<option value="Ragusa">Ragusa</option>
								<option value="Ravenna">Ravenna</option>
								<option value="Reggio di Calabria">Reggio di Calabria</option>
								<option value="Reggio nell'Emilia">Reggio nell'Emilia</option>
								<option value="Rieti">Rieti</option>
								<option value="Rimini">Rimini</option>
								<option value="Roma">Roma</option>
								<option value="Rovigo">Rovigo</option>
								<option value="Salerno">Salerno</option>
								<option value="Sassari">Sassari</option>
								<option value="Savona">Savona</option>
								<option value="Siena">Siena</option>
								<option value="Siracusa">Siracusa</option>
								<option value="Sondrio">Sondrio</option>
								<option value="Taranto">Taranto</option>
								<option value="Teramo">Teramo</option>
								<option value="Terni">Terni</option>
								<option value="Torino">Torino</option>
								<option value="Trapani">Trapani</option>
								<option value="Trento">Trento</option>
								<option value="Treviso">Treviso</option>
								<option value="Trieste">Trieste</option>
								<option value="Udine">Udine</option>
								<option value="Varese">Varese</option>
								<option value="Venezia">Venezia</option>
								<option value="Verbano-Cusio-Ossola">Verbano-Cusio-Ossola</option>
								<option value="Vercelli">Vercelli</option>
								<option value="Verona">Verona</option>
								<option value="Vibo valentia">Vibo valentia</option>
								<option value="Vicenza">Vicenza</option>
								<option value="Viterbo">Viterbo</option>
						</select>
						</div>
						<div class="col-md-10"><label style="font-size: 15px" class="labels">Common</label><input type="text" class="form-control" placeholder="country" name="country" value="${country}"></div>
					</div>
					<div class="mt-4 text-center" style="display: flex; padding-right: 20%">
					   <a href="account.html">
						<button style="margin-right:3%; margin-left:3%;" class="btn btn-primary profile-button" type="button">back</button>
					   </a>					
						<button style="margin-left:3%; margin-right:3%;" class="btn btn-primary profile-button" type="submit" >Save Profile</button>
					</div>
				</div>
			 </form>
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
								<li><a href="http://www.shorturl.at/nwES4"><i class="fa fa-map-marker"></i>Ponte Pietro Bucci, 87036 Quattromiglia CS</a></li>
								<li><a href="mailto:teachplanet22@gmail.com"><i class="fa fa-envelope"></i>teachplanet22@gmail.com</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="notebooksGallery.html">Notebooks</a></li>
								<li><a href="smartphonesGallery.html">Smartphones</a></li>
								<li><a href="tvsGallery.html">Tvs</a></li>
								<li><a href="printersGallery.html">Printers</a></li>
								<li><a href="camerasGallery.html">Cameras</a></li>
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

<script>
var uploadField = document.getElementById("image");

uploadField.onchange = function() {
    if(this.files[0].size > 1048576){
       alert("sorry can't upload because file is too big!");
       this.value = "";
    };
};
</script>

</body>
</html>