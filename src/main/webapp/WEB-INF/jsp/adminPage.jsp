<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link type="text/css" rel="stylesheet" href="css/admin/adminPage.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Admin Page</title>
</head>

<body>
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
                                <img id="logo" src="images/index/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- ACCOUNT -->
                    <div class="col-md-9">
                        <div class="header-ctn">

                            <!-- Wishlist -->
                            <div style="padding-right: 3%; margin-top: 3%" id="firstElement">
                                <a href="addProduct" style="text-decoration: none;">
                                    <i class="fas fa-cart-plus" id="add"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="deleteProd" style="text-decoration: none;">
                                    <i class="fas fa-trash" id="trash"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                            <!-- Cart -->
                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="modifyProd" style="text-decoration: none;">
                                    <i class="fas fa-edit"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="returnRequests" style="text-decoration: none;">
                                    <i class="fas fa-truck-loading" id="truck2"></i></a>
                            </div>
                            <!-- /Cart -->

                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="addAdmin" style="text-decoration: none;">
                                    <i class="fas fa-user-tie" id="addAdmin"></i></a>
                            </div>

                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="deleteAdmin" style="text-decoration: none;">
                                    <i class="fas fa-user-slash" id="deleteAdmin"></i></a>
                            </div>

                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="/viewJobs" style="text-decoration: none;">
                                    <i class="fas fa-user-plus" id="positions"></i></a>
                            </div>
                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="/viewCurriculum" style="text-decoration: none;">
                                    <i class="fas fa-book-open" id="curriculum"></i></a>
                            </div>
                            <div style="padding-right: 3%; margin-top: 3%">
                                <a href="/viewReports" style="text-decoration: none;">
                                    <i class="fas fa-bug" id="report"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--/HEADER-->



    <p id="pageTitle">Welcome ${username}</p>

    <div class="container-fluid" id="management">
        <div class="row" id="textManagement1">
            <div class="col-md-4">
                Add product
                <br /><br />
                <a href="addProduct" style="text-decoration: none;">
                    <i class="fas fa-cart-plus fa-5x" id="addProd"></i></a>
            </div>
            <div class="col-md-4">
                Delete product
                <br /><br />
                <a href="deleteProd" style="text-decoration: none;">
                    <i class="fas fa-trash fa-5x" id="deleteProd"></i></a>
            </div>
            <div class="col-md-4">
                Modify product
                <br /><br />
                <a href="modifyProd" style="text-decoration: none;">
                    <i class="fas fa-edit fa-5x" id="users2"></i></a>
            </div>
        </div>
    </div>
    <div class="row" id="textManagement2">

        <div class="col-md-4">
            Returns management
            <br /><br />
            <a href="returnRequests" style="text-decoration: none;">
                <i class="fas fa-truck-loading fa-5x" id="truck2"></i></a>
        </div>

        <div class="col-md-4">
            Add admin
            <br /><br />
            <a href="addAdmin" style="text-decoration: none;">
                <i class="fas fa-user-tie fa-5x" id="addAdmin"></i></a>
        </div>

        <div class="col-md-4">
            Delete admin
            <br /><br />
            <a href="deleteAdmin" style="text-decoration: none;">
                <i class="fas fa-user-slash fa-5x" id="deleteAdmin"></i></a>
        </div>
    </div>

    <div class="row" id="textManagement3">
        <div class="col-md-4">
            Positions management
            <br /><br />
            <a href="/viewJobs" style="text-decoration: none;">
                <i class="fas fa-user-plus fa-5x" id="positions2"></i></a>
        </div>
        <div class="col-md-4">
            View reports
            <br /><br />
            <a href="/viewReports" style="text-decoration: none;">
                <i class="fas fa-bug fa-5x" id="report2"></i></a>
        </div>
        <div class="col-md-4">
            View curriculum
            <br /><br />
            <a href="/viewCurriculum" style="text-decoration: none;">
                <i class="fas fa-book-open fa-5x" id="report2"></i></a>
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
</body>

</html>