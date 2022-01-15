<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<!-- Termini accentati -->
	<meta charset="utf-8">
	
	<!-- Favicon -->
	<link rel="icon" href="../images/index/logo.png" type="image/x-icon"/>
	
	<!-- Titolo -->
	<title>Job positions</title>
	
	<!-- CSS -->
	<link href="css/admin/report.css" rel="stylesheet" type="text/css" />
	<link href="css/admin/posizioniLavoro.css" rel="stylesheet" type="text/css" />
	
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>	

	<!-- JS -->
	<script src="../js/lavoraConNoi/modelloLavoraConNoi.js"></script>
	<script src="../js/lavoraConNoi/funzioni.js"></script>
	<script src="js/admin/posizioniLavoro/posizioniLavoro.js"></script>
	<script src="js/admin/posizioniLavoro/chiamateAjax.js"></script>
	
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

<!------------------------GRUPPO-------------------------------------------->	

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
								<img id="logo" src="../images/index/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- ACCOUNT -->
					<div class="col-md-9">
						<div class="header-ctn">
							<div style="padding-right: 5%; margin-top: 3%" id="firstElement">
								<a href="/viewCurriculum" style="text-decoration: none;">
									<i class="fas fa-book-open" id="positions"></i>
								</a>
							</div>
							<div style="padding-right: 5%; margin-top: 3%">
								<a href="/viewReports" style="text-decoration: none;">
									<i class="fas fa-bug" id="report"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							<!-- Wishlist -->
							<div style="padding-right: 5%; margin-top: 3%">
								<a href="addProduct" style="text-decoration: none;">
									<i class="fas fa-cart-plus" id="add"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>

							<div style="padding-right: 5%; margin-top: 3%">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-trash" id="trash"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							
							<!-- Cart -->
							<div style="padding-right: 5%; margin-top: 3%">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-users"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							<!-- /Cart -->

							<!-- User Toogle -->
							<div style="padding-right: 5%; margin-top: 3%">
								<a href="returnRequests" style="text-decoration: none;">
									<i class="fas fa-truck-loading"></i>
								</a>
							</div>

							<div style= "margin-top: 3%">
								<a href="account.html" style="text-decoration: none;">
									<i class="fas fa-sign-out-alt"></i>
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

<!------------------------GRUPPO-------------------------------------------->	

<!------------------------FABIO-------------------------------------------->

		<h1 id = "titolo">Job positions</h1>
		<table id="tabella" class="table table-borderless">
			<thead>
				<tr>
					<th data-title = "Select deselect all"><input type="checkbox" id = "checkBoxTh" onchange = "checkBoxTh()" /></th>
					<th id = "titoloTh">Title</th>
					<th id = "descrizioneTh">Description</th>
					<th id = "requisitiTh">Requirements</th>
					<th id = "obbligatoryTh">Obligatory requirements</th>
					<th id = "attivoTh">Active</th>
				</tr>
			</thead>
			<tbody>
 				<c:forEach items="${lavori}" var="lav">
					<c:if test = "${lav.title ne 'Spontaneous Candidature'}">
						<tr>
							<td data-title = "Select deselect"><input type="checkbox" class = "lavoro"/></td>
							<td data-title = "Title" class = "titoloLavoro">${lav.title}</td>
							<td >${lav.description}</td>
							<td class = "formattaTesto">${lav.requirements}</td>
							<td class = "obbligatori"><c:forEach items="${lav.obligatory}" var="obb">${obb.name}: ${obb.value1} - ${obb.value2}<br /><br />
								</c:forEach>
							</td>
							<td data-title = "Active">
								<c:if test = "${lav.active == true}"><input type="checkbox" id = "lavoroCheckBox" value = "true"/>
									<figure>
										<img src = "images/admin/posizioniLavoro/si.png">
									</figure>
								</c:if>
								<c:if test = "${lav.active == false}"><input type="checkbox" id = "lavoroCheckBox" value = "false"/>
									<figure>
										<img src = "images/admin/posizioniLavoro/no.png">
									</figure>
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>		
			</tbody>
		</table>
		
		<br/>
		<div id = "pulsanti">
			<input class="btn btn-danger" id="btnCancella" type="button" value="Delete job" />
			<input class="btn btn-warning" id="btnModifica" onclick = "pulsanteModifica()" type="button" value="Edit job" />
			<input class="btn btn-primary" id="btnInserisci" onclick = "pulsanteAggiungi()" type="button" value="Add job"/>
		</div>
		<br/>
		
		<form id = "form" method = "post" action = "/aggiugiModificaLavoro">
			<div id = "divForm" class = "container-fluid">
				<div class = "row">
					<div class="col-md-2">
						<textarea id="titoloForm" onkeyup="textAreaAdjust(this)" placeholder="Enter the title"/></textarea>
					</div>
					<div class="col-md-4">
						<textarea id="descrizioneForm" onkeyup="textAreaAdjust(this)" placeholder="Enter the description"/></textarea>
					</div>
					<div class="col-md-5">
						<textarea id="requisitiForm" onkeyup="textAreaAdjust(this)" placeholder="Enter the requirements"/></textarea>
					</div>
					<div class="col-md-1">
						<p id = "testoAttivo">Active</p>
						<input type="checkbox" id = "checkBoxForm" />
					</div>	
				</div>
				<br />
				<div id = "requisitiSpeciali">
					<div class = "row" id = "eta">
						<div class="col-md-12">
							<label for ="ageRange">Age range: (min - max)</label>
							<br />
							<select name="ageRange" id = "min" onchange = "caricaOpzioniAge()"></select> - 
							<select name="ageRange" id = "max"></select>
						</div>
					</div>
					<br />
					<div id = "requisitoTitoloStudio">
						<div class = "row" id = "1">
							<div class="col-2">
								<a class = "piuMeno" href = "javascript:caricaTitoloStudio()">
									<img src = "../images/admin/posizioniLavoro/piu.png">
								</a>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class = "row">
					<input class="btn btn-primary" onclick = "inviaLavoro()" id="btnInvia" type="button" value="Send" />
				</div>
			</div>
		</form>
		<br/>	

<!------------------------FABIO-------------------------------------------->

<!------------------------GRUPPO-------------------------------------------->	

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
	
<!------------------------GRUPPO-------------------------------------------->	

</body>

</html>