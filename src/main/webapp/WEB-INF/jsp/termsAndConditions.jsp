<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
            <link type="text/css" rel="stylesheet" href="css/user/termsAndConditions.css" />
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
                integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href='https://fonts.googleapis.com/css?family=Cinzel Decorative' rel='stylesheet'>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="js/Signup/signUp.js"></script>
            <script src="https://apis.google.com/js/platform.js" async defer></script>
            <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
            <meta name="google-signin-client_id"
                content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <title>Terms And Conditions</title>
        </head>



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
	
        <nav id="navigation" class="navbar navbar-expand-sm bg-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"> <i class="fa fa-navicon"
                            style="color: white; font-size: 28px"></i>
                    </span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="notebooksGallery.html">Notebooks</a></li>
                        <li class="nav-item"><a class="nav-link" href="smartphonesGallery.html">Smartphones</a></li>
                        <li class="nav-item"><a class="nav-link" href="printersGallery.html">Printers</a></li>
                        <li class="nav-item"><a class="nav-link" href="camerasGallery.html">Cameras</a></li>
                        <li class="nav-item"><a class="nav-link" href="accessoriesGallery.html">Accessories</a></li>
                        <li class="nav-item"><a class="nav-link" href="tvsGallery.html">Tvs</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="termsAndConditions">
            <h2><strong>Terms and Conditions</strong></h2>

            <p>Welcome to TechPlanet!</p>

            <p>These terms and conditions outline the rules and regulations for the use of TechPlanet's Website.</p>

            <p>By accessing this website we assume you accept these terms and conditions. Do not continue to use
                TechPlanet if you do not agree to take all of the terms and conditions stated on this page.</p>

            <p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice
                and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and
                compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us",
                refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms
                refer to the offer, acceptance and consideration of payment necessary to undertake the process of our
                assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s
                needs in respect of provision of the Company’s stated services, in accordance with and subject to,
                prevailing law of Italy. Any use of the above terminology or other words in the singular, plural,
                capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.
            </p>

            <h3><strong>Cookies</strong></h3>

            <p>We employ the use of cookies. By accessing TechPlanet, you agreed to use cookies in agreement with the
                TechPlanet's Privacy Policy. </p>

            <p>Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are
                used by our website to enable the functionality of certain areas to make it easier for people visiting
                our website. Some of our affiliate/advertising partners may also use cookies.</p>

            <h3><strong>License</strong></h3>

            <p>Unless otherwise stated, TechPlanet and/or its licensors own the intellectual property rights for all
                material on TechPlanet. All intellectual property rights are reserved. You may access this from
                TechPlanet for your own personal use subjected to restrictions set in these terms and conditions.</p>

            <p>You must not:</p>
            <ul>
                <li>Republish material from TechPlanet</li>
                <li>Sell, rent or sub-license material from TechPlanet</li>
                <li>Reproduce, duplicate or copy material from TechPlanet</li>
                <li>Redistribute content from TechPlanet</li>
            </ul>

            <p>Parts of this website offer an opportunity for users to post and exchange opinions and information in
                certain areas of the website. TechPlanet does not filter, edit, publish or review Comments prior to
                their presence on the website. Comments do not reflect the views and opinions of TechPlanet,its agents
                and/or affiliates. Comments reflect the views and opinions of the person who post their views and
                opinions. To the extent permitted by applicable laws, TechPlanet shall not be liable for the Comments or
                for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting
                of and/or appearance of the Comments on this website.</p>

            <p>TechPlanet reserves the right to monitor all Comments and to remove any Comments which can be considered
                inappropriate, offensive or causes breach of these Terms and Conditions.</p>

            <p>You warrant and represent that:</p>

            <ul>
                <li>You are entitled to post the Comments on our website and have all necessary licenses and consents to
                    do so;</li>
                <li>The Comments do not invade any intellectual property right, including without limitation copyright,
                    patent or trademark of any third party;</li>
                <li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful
                    material which is an invasion of privacy</li>
                <li>The Comments will not be used to solicit or promote business or custom or present commercial
                    activities or unlawful activity.</li>
            </ul>

            <p>You hereby grant TechPlanet a non-exclusive license to use, reproduce, edit and authorize others to use,
                reproduce and edit any of your Comments in any and all forms, formats or media.</p>

            <h3><strong>Hyperlinking to our Content</strong></h3>

            <p>The following organizations may link to our Website without prior written approval:</p>

            <ul>
                <li>Government agencies;</li>
                <li>Search engines;</li>
                <li>News organizations;</li>
                <li>Online directory distributors may link to our Website in the same manner as they hyperlink to the
                    Websites of other listed businesses; and</li>
                <li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping
                    malls, and charity fundraising groups which may not hyperlink to our Web site.</li>
            </ul>

            <p>These organizations may link to our home page, to publications or to other Website information so long as
                the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or
                approval of the linking party and its products and/or services; and (c) fits within the context of the
                linking party’s site.</p>

            <p>We may consider and approve other link requests from the following types of organizations:</p>

            <ul>
                <li>commonly-known consumer and/or business information sources;</li>
                <li>dot.com community sites;</li>
                <li>associations or other groups representing charities;</li>
                <li>online directory distributors;</li>
                <li>internet portals;</li>
                <li>accounting, law and consulting firms; and</li>
                <li>educational institutions and trade associations.</li>
            </ul>

            <p>We will approve link requests from these organizations if we decide that: (a) the link would not make us
                look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any
                negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the
                absence of TechPlanet; and (d) the link is in the context of general resource information.</p>

            <p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b)
                does not falsely imply sponsorship, endorsement or approval of the linking party and its products or
                services; and (c) fits within the context of the linking party’s site.</p>

            <p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our
                website, you must inform us by sending an e-mail to TechPlanet. Please include your name, your
                organization name, contact information as well as the URL of your site, a list of any URLs from which
                you intend to link to our Website, and a list of the URLs on our site to which you would like to link.
                Wait 2-3 weeks for a response.</p>

            <p>Approved organizations may hyperlink to our Website as follows:</p>

            <ul>
                <li>By use of our corporate name; or</li>
                <li>By use of the uniform resource locator being linked to; or</li>
                <li>By use of any other description of our Website being linked to that makes sense within the context
                    and format of content on the linking party’s site.</li>
            </ul>

            <p>No use of TechPlanet's logo or other artwork will be allowed for linking absent a trademark license
                agreement.</p>

            <h3><strong>iFrames</strong></h3>

            <p>Without prior approval and written permission, you may not create frames around our Webpages that alter
                in any way the visual presentation or appearance of our Website.</p>

            <h3><strong>Content Liability</strong></h3>

            <p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and
                defend us against all claims that is rising on your Website. No link(s) should appear on any Website
                that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or
                advocates the infringement or other violation of, any third party rights.</p>

            <h3><strong>Your Privacy</strong></h3>

            <p>Please read <a href="/privacyPolicy">Privacy Policy</a></p>

            <h3><strong>Reservation of Rights</strong></h3>

            <p>We reserve the right to request that you remove all links or any particular link to our Website. You
                approve to immediately remove all links to our Website upon request. We also reserve the right to amen
                these terms and conditions and it’s linking policy at any time. By continuously linking to our Website,
                you agree to be bound to and follow these linking terms and conditions.</p>

            <h3><strong>Removal of links from our website</strong></h3>

            <p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform
                us any moment. We will consider requests to remove links but we are not obligated to or so or to respond
                to you directly.</p>

            <p>We do not ensure that the information on this website is correct, we do not warrant its completeness or
                accuracy; nor do we promise to ensure that the website remains available or that the material on the
                website is kept up to date.</p>

            <h3><strong>Disclaimer</strong></h3>

            <p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and
                conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>

            <ul>
                <li>limit or exclude our or your liability for death or personal injury;</li>
                <li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
                <li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>
                <li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>
            </ul>

            <p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a)
                are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer,
                including liabilities arising in contract, in tort and for breach of statutory duty.</p>

            <p>As long as the website and the information and services on the website are provided free of charge, we
                will not be liable for any loss or damage of any nature.</p>

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
                                    <li><a href="http://www.shorturl.at/nwES4"><i class="fa fa-map-marker"></i>Ponte
                                            Pietro Bucci, 87036 Quattromiglia CS</a></li>
                                    <li><i class="fa fa-phone"></i>+021-95-51-84</li>
                                    <li><a href="mailto:teachplanet22@gmail.com"><i
                                                class="fa fa-envelope"></i>teachplanet22@gmail.com</a></li>
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
                                    <li><a href="/customerSupport">Help</a></li>
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