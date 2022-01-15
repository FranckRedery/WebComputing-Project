<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
            <link type="text/css" rel="stylesheet" href="css/admin/deleteAdmin.css" />
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
                integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <!-- CSS only -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <title>Delete admin</title>
        </head>

        <body>
            <!-- HEADER -->
            <header>
                <!-- TOP HEADER -->
                <div id="top-header">
                    <div class="container">
                        <ul class="header-links pull-left">
                            <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> techPlanet2022@gmail.com</a></li>
                            <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
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

            <h2 style="margin-top:2%;" id="pageTitle">Delete admin</h2>


            <form class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label" for="userName" style="margin-top: 3%;">Username</label>
                    <input type="text" class="form-control" id="userName" placeholder="User's username" required>
                    <div class="invalid-feedback">Please enter a valid username.</div>
                </div>
                <button type="submit" class="btn btn-primary" id="btnSearch">Search the user</button>
            </form>

            <c:if test="${user != null}">
                <c:if test="${user.isadmin == true}">
                    <div class="row" id="riga">
                        <div class="col-md-7">
                            <label class="selectedUser" id="selectedUser">Selected user</label>
                            <div class="align-items-center text-center " id="user">
                                <c:if test="${user.image != null}">
                                    <img class="rounded-circle" width="120px" height="auto" src="${user.image}">

                                </c:if>
                                <c:if test="${user.image == null}">
                                    <img class="rounded-circle" width="120px" height="auto"
                                        src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                </c:if>
                                <br>
                                <span class="info" style="font-size: small;">Username : </span>
                                <span class="font-weight-bold;" id="username"
                                    style="font-size: small;">${user.username}</span>
                                <br>
                                <span class="info" style="font-size: small;">Email : </span>
                                <span class="font-weight-bold;" id="email"
                                    style="font-size: small;">${user.email}</span>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <button type="button" class="btn btn-danger" onclick="deleteAdmin();">Delete admin</button>
                            <br>
                            <a href="/adminPage"><button type="button" class="btn btn-secondary" id="btnHome">Back to
                                    homepage</button></a>
                        </div>

                    </div>
                </c:if>

                <c:if test="${user.isadmin == false}">
                    <div class="row" id="riga">
                        <div class="col-md-7">
                            <label class="selectedUser" id="selectedUser">Selected user</label>
                            <div class="align-items-center text-center " id="user">
                                <c:if test="${user.image != null}">
                                    <img class="rounded-circle" width="120px" height="auto" src="${user.image}">

                                </c:if>
                                <c:if test="${user.image == null}">
                                    <img class="rounded-circle" width="120px" height="auto"
                                        src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                </c:if>
                                <br>
                                <span class="info" style="font-size: small;">Username : </span>
                                <span class="font-weight-bold;" id="username"
                                    style="font-size: small;">${user.username}</span>
                                <br>
                                <span class="info" style="font-size: small;">Email : </span>
                                <span class="font-weight-bold;" id="email"
                                    style="font-size: small;">${user.email}</span>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <br><br><br>
                            <span class="info" style="font-size: 20px ; text-align: middle;">This user is not an
                                administrator</span>
                            <br>
                            <a href="/adminPage"><button type="button" class="btn btn-secondary" id="btnHome2">Back to
                                    homepage</button></a>
                        </div>

                    </div>


                </c:if>
            </c:if>

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
            <script src="js/admin/deleteAdmin.js"></script>
        </body>

        </html>