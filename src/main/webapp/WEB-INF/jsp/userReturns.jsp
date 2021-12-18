<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link type="text/css" rel="stylesheet" href="css/user/userReturns.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Returns page</title>
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
                                <a href="#" style="text-decoration: none;">
                                    <i class="fa fa-heart" id="heart"></i>
                                    <!--<div class="qty">0</div>-->
                                </a>
                            </div>

                            <!-- Cart -->
                            <div style="padding-right: 10%;">
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


    <div class="container">
        <h2 style="margin-top: 5%;">Returns list</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Request's date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="product-cell">
                        <div class="d-flex flex-column align-items-center text-center "><img src="images/index/product01.png" 
                                class="img-fluid d-block mx-auto">
                            <div class="product-info">
                                <span class="product-type" style="font-size: small;">
                                    Electronics & accessories
                                </span>
                                <a href="#" class="d-block text-dark text-decoration-none product-name" style="font-size: small;">pc
                                    windows</a>
                                <span class="product-price" style="font-size: medium;">$100.50</span>
                            </div>
                        </div>
                        </td>
                    <td class="cell">12-17-2021</td>
                    <td class="cell">
                        <div class="alert alert-success"><strong>Accepted</strong>
                    </td>
                </tr>
                <tr>
                    <td class="product-cell">
                        <div class="d-flex flex-column align-items-center text-center "><img src="images/index/product01.png" 
                                class="img-fluid d-block mx-auto">
                            <div class="product-info">
                                <span class="product-type" style="font-size: small;">
                                    Electronics & accessories
                                </span>
                                <a href="#" class="d-block text-dark text-decoration-none product-name" style="font-size: small;">pc
                                    windows</a>
                                <span class="product-price" style="font-size: medium;">$100.50</span>
                            </div>
                        </div>
                        </td>
                    <td class="cell">12-15-2021</td>
                    <td class="cell">
                        <div class="alert alert-danger"><strong>Refused</strong>
                    </td>
                </tr>
                <tr>
                    <td class="product-cell">
                        <div class="d-flex flex-column align-items-center text-center "><img src="images/index/product01.png" 
                                class="img-fluid d-block mx-auto">
                            <div class="product-info">
                                <span class="product-type" style="font-size: small;">
                                    Electronics & accessories
                                </span>
                                <a href="#" class="d-block text-dark text-decoration-none product-name" style="font-size: small;">pc
                                    windows</a>
                                <span class="product-price" style="font-size: medium;">$100.50</span>
                            </div>
                        </div>
                        </td>
                    <td class="cell">12-15-2021</td>
                    <td class="cell">
                        <div class="alert alert-warning"><strong>Pending</strong>
                    </td>
                </tr>
            </tbody>
        </table>
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