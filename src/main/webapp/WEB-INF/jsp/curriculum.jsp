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
	<title>Curriculum</title>
	
	<!-- CSS -->
	<link href="../css/lavoraConNoi/lavoraConNoi.css" rel="stylesheet" type="text/css" />
	
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>	

	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- JS -->
	<script src="../js/lavoraConNoi/modelloLavoraConNoi.js"></script>
	<script src="../js/lavoraConNoi/campiForm.js"></script>
	<script src="../js/lavoraConNoi/vaiA.js"></script>
	<script src="../js/lavoraConNoi/funzioni.js"></script>
	<script src="../js/lavoraConNoi/curriculum.js"></script>

	<!--AJAX ha la dipendenza nel pom -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!------------------------GRUPPO-------------------------------------------->	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link type="text/css" rel="stylesheet" href="../css/index/style.css" />
<link rel="icon" href="../images/index/logo.png" type="image/x-icon" />
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
<script src="../js/Signup/signUp.js"></script>
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
								<span>Admin View <img src="../images/index/adminBtn.gif"  width="20" height="20"></span>
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
								src="../images/index/logo.png" alt="">
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
										 <img class="profilePic" src='../images/account/avatar.png' style="border-radius: 50%;" width="29" height="29" alt="Avatar">
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

	<div class="container container--grid" id = "container">
		<!-- Grafica superiore %% immagine sfondo -->
		<div id = "divImmagineTestoSfondo">
			<figure class = "figure">
				<img src = "../images/lavoraConNoi/lavoraConNoi.png" width = 100% class = "img-fluid">
			</figure>
			<div id = "testoSfondo">
				<p class = "titolo" ><strong>Work with us</strong></p>
			</div>
		</div>
		
		<!-- Obiettivi aziendali -->
		<div class = "row" id = "divSovrapposto">
 			<div class="col-sm-10" id = "indice">
				<div id = "barra">
					<nav class="navbar navbar-expand-sm navbar-light">
						<ul class="navbar-nav" id = "navbar">
							<li class="nav-item"> 
								<a class="nav-link" href = "/workWithUs/workInCompany" ><strong>Get to know Tech Planet</strong></a>
							</li>
							<li class="nav-item"> 
								<a class="nav-link" href = "javascript:vaiTesto1()" ><strong>Form</strong></a>
							</li>
							<li class="nav-item"> 
								<a class="nav-link" href = "javascript:vaiTesto2()" ><strong>Send CV</strong></a>
							</li>
						</ul>
					</nav>
				</div>
				
				<div id = "login">
					<c:if test= "${username == null}">
						<a href = "javascript:formLogin()">Registered user? Click here</a>
					</c:if>
					<c:if test= "${username != null}">
						Hi ${username} 
					</c:if>
					<div id = "formLogin">
						<form id = "formCurriculum" method="post" action="loginCurriculum">
							<label for ="username">Username: </label> 
							<input type="text" id = "user" name="username" placeholder="Your username.."/> <br/>
							<label for ="pass">Password: </label>
							<input type="password" id = "pass" name="pass" placeholder="Your password.."/> <br/>
							<button id = "pulsanteLogin" onclick = "faiLogin(event)">Login</button>
						</form>
						<div class = "messaggioErrore" id = "erroreLogin">
						</div>
					</div>
				</div>
				<br />
				
				<div id = "titolo">
					<c:if test= "${posizioneLavoro == null}">
						<p><strong id = "tipoLavoro">Spontaneous Candidature</strong></p>
					</c:if>
					<c:if test= "${posizioneLavoro != null}">
						<p><strong id = "tipoLavoro">${posizioneLavoro.title}</strong></p>
						<div id = "requisiti">
							<c:forEach items = "${posizioneLavoro.obligatory}" var = "obb" varStatus = "obbCount">
								<div class = "requisito">
									<p class = "nomeRequisito">${obb.name}</p>:
									<p class = "valore1Requisito">${obb.value1}</p> 
									<nobr> - </nobr> 
									<p class = "valore2Requisito">${obb.value2}</p>
									<c:if test="${!obb.name.equals('Age range')}">
										<!-- Vede se è l'ultimo elemento -->
			  							<c:if test="${not obbCount.last}">
											or
										</c:if>
									</c:if>
									<c:if test="${obb.name.equals('Age range')}">
										  <br />
									</c:if>	
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
				<br />
				
				<div id = "testoSezione1">
					<form method = "post" action = "/workWithUs/saveCurriculum" enctype="multipart/form-data">
						<div class = "row">
							<div class = "col-sm-12" id = "formCentrale">
								<div id = "titolo">
								</div>
							</div>
	 						<c:if test= "${posizioneLavoro == null}">
								<input type="hidden" name = "lavoro" id = "lavoro" value ="Spontaneous Candidature">
							</c:if>
							<c:if test= "${posizioneLavoro != null}">
								<input type="hidden" name = "lavoro" id = "lavoro" value = "${posizioneLavoro.title}"/>
							</c:if>
							
							<div class = "messaggioErrore" id = "erroreForm">
							</div>
							
 							<div id = "divLavoro">
 							</div>
 							<div class = "col-md-6" id = "formSX">
								<table class="table table-borderless">
									<div id = "datiPersonali">
										<p><strong>Personal data</strong></p>
									</div>
									<thead>
		      							<tr>
									       <th></th>
		      							</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<label for="nome">
													<nobr>First name</nobr> 
													<nobr class = "asterisco">*</nobr>
												</label>
											</td>
											<td>
												<input type="text" name = "nome" id="nome" placeholder="Your first name ..." value = "${name}">
											</td>
										</tr>
										<tr>
											<td>
												<label for="cognome">
													<nobr>Last name</nobr>
													<nobr class = "asterisco">*</nobr>
												</label>
											</td>
											<td>
												<input type="text" name = "cognome" id="cognome" placeholder="Your last name ..." value = "${surname}">
											</td>
										</tr>
										<tr>
											<td> 
												<label for="dataNascita"> 
													<nobr>Date birth</nobr>
													<nobr class = "asterisco">*</nobr>
												</label>
											</td>
											<td>
												<input type="date" name = "dataNascita" id="dataNascita">
											</td>
										</tr>
										<tr>
											<td>
												<label for="email">
													<nobr>E-Mail</nobr>
													<nobr class = "asterisco">*</nobr>
												</label>
											</td>
										    <td>
												<input type="email" name = "email" id="mail" placeholder="Your e-mail ..." value = "${email}">
											</td>
										</tr>
										<tr>
											<td>
												<label for="phone">
													<nobr>Phone</nobr>
													<nobr class = "asterisco">*</nobr>
												</label>
											</td>
										    <td>
												<input type="tel" id="phone" name="phone" placeholder = "Your phone ..." value = "${phonenumber}">
											</td>
										</tr>
									</tbody>
								</table>	
							</div>
						<div class = "col-md-6" id = "formDX">
							<table class="table table-borderless">
								<thead>
	      							<tr>
										<th>Education</th>
	      							</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<select class = "studio" name="titoloStudio" onchange = "caricaOpzioni('titoloStudio', 'materiaStudio')" id = "titoloStudio"></select>
										</td>
										<td>
											<label for="titoloStudio">
												<nobr class = "asterisco">*</nobr>
												<nobr>Study title</nobr>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<select class = "studio" name="materiaStudio" id = "materiaStudio"></select>
										</td>
									    <td>
											<label for="materiaStudio">
												<nobr class = "asterisco">*</nobr>
												<nobr>Study subject</nobr>
											</label>
										</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-borderless">
								<thead>
	      							<tr>
										<th>Last Job Position</th>
	      							</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<select name="funzioneLavoro" onclick = "caricaOpzioni('funzioneLavoro', 'classificazioneLavoro')" id = "funzioneLavoro"></select>
										</td>
										<td>
											<label for="funzioneLavoro">
												<nobr>Function</nobr>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<select name="classificazioneLavoro" id = "classificazioneLavoro"></select>
										</td>
										<td>
											<label for="classificazioneLavoro">
												<nobr>Classification</nobr>
											</label>
										</td>
									</tr>	
								</tbody>
							</table>
						</div>
						<div class = "col-sm-12" id = "formCentrale">
							<div id = "centro">
								<strong>Curriculum</strong>
							</div>
							<table class="table table-borderless">
								<thead>
	      								<tr>
									       <th></th>
	      								</tr>
									</thead>
									<tbody>
										<tr>
				 						<td class = "dx">
												<label for="foto">
													<nobr>Photo</nobr>
													<nobr class="asterisco">*</nobr>
												</label>
											</td>
											<td>
												<input type="file" name="foto" id = "foto" accept="image/png, image/jpeg, image/jpg">
											</td>
										</tr>
										<tr>
											<td class = "dx">
												<label for="cv">
													<nobr>CV</nobr>
													<nobr class="asterisco">*</nobr>
												</label>
											</td>
											<td>
												<input type="file" name="cv" id = "cv" accept="application/pdf">
											</td>
										</tr>	
										<tr>
											<td class = "dx">
												<label for="letteraPresentazione">
													<nobr>Cover letter</nobr>
												</label>
											</td>
											<td>
												<textarea name="letteraPresentazione" rows="4" cols="20" placeholder="Additional presentation ..."></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br /><br />
						<div id = "testoSezione2">
							<div class = "row" id = "mancaLaTuaPosizione">
								<div class = "col-sm-12">
									<p><i>By clicking on the "send curriculum" button, you accept the information on online candidates pursuant to art. 13 of Regulation (EU) 2016/679.</i></p>
									<div>
										<button class = "button" id = "presentazione" onclick = "javascript:inviaPresentazione(event)">Submit your CV</button>
									</div>
								</div>
							</div>
						</div>
						<br />
					</form>
				</div>
				
			</div>
		</div>
	</div>

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