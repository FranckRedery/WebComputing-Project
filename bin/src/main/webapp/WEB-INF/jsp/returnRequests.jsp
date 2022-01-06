<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link type="text/css" rel="stylesheet" href="css/admin/returnRequests.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Return Requests</title>
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
							<a href="#" class="logo">
								<img id="logo" src="images/index/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- ACCOUNT -->
					<div class="col-md-9">
						<div class="header-ctn">
							<div style="padding-right: 8%; padding-left:24%; margin-top: 3%" id="firstElement">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-user-plus" id="positions"></i></a>
							</div>
							<!-- Wishlist -->
							<div style="padding-right: 8%; margin-top: 3%">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-cart-plus" id="add"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>

							<div style="padding-right: 8%; margin-top: 3%">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-trash" id="trash"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>

							<!-- Cart -->
							<div style="padding-right: 8%; margin-top: 3%">
								<a href="#" style="text-decoration: none;">
									<i class="fas fa-users"></i>
									<!--<div class="qty">0</div>-->
								</a>
							</div>
							<!-- /Cart -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--/HEADER-->



    <div class="container requests" >
        <h2 style="margin-top: 5%" id="pageTitle">Return requests</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="thText">User</th>
                    <th class="thText">Product</th>
                    <th class="thText">Reason</th>
                    <th class="thText">Refund</th>
                    <th class="thText">Response</th>
                </tr>
            </thead>
            <tbody>
            
            <c:forEach items="${returns}" var="item">
               		<tr>
               		<td class="user-cell">
                        <div class="align-items-center text-center " id="user"><img class="rounded-circle"
                                width="120px"
                                src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                <br>
                                <span class="info" style="font-size: small;">Username : </span>
                                <span class="font-weight-bold;" id="username" style="font-size: small;">${item.user.username}</span>
                                <br>
                                <span class="info" style="font-size: small;">Email : </span>
                                <span class="font-weight-bold;" id="email" style="font-size: small;">${item.user.email}</span><span> </span>
                        </div>
                    </td>
                    <td class="product-cell">
                        <div class="d-flex flex-column align-items-center text-center "><img src="images/index/product01.png" 
                                class="img-fluid d-block mx-auto">
                            <div class="product-info">
                            	<span class="info" style="font-size: small;">Product ID : </span>
                            	<span class="product-id" id="prodId" style="font-size: small;">${item.product.id}</span>
                                <br>
                                <span class="info" style="font-size: small;">Category : </span>
                                <span class="product-type" style="font-size: small;">
                                    ${item.product.category}
                                </span>
                                <br>
                                <span class="info" style="font-size: small;">Name : </span>
                                <span class="product-name" style="font-size: small;">
                                    ${item.product.name}
                                </span>
                               <br>
                               <span class="info" style="font-size: small;">Quantity : </span>
                			   <span class="product-quantity" id="qty" style="font-size: medium;">${item.quantity}</span>
                			   <br>
                                 <span class="info" style="font-size: small;">Price : </span>
                                <span class="product-price" style="font-size: medium;">$${item.product.price * item.quantity}</span>
                            </div>
                        </div>
                        </td>
                        <td class ="reason-cell">
                        	<c:if test = "${item.description != ''}">
                        		<c:if test= "${item.reason != 'Other, specify in the description'}">
                 				<textarea class="form-control" id="textArea" rows="9" cols="9" readonly>${item.reason}&#13;&#10;${item.description}</textarea>
                 				</c:if>
						</c:if>
						<c:if test = "${item.description == ''}">
                        	<textarea class="form-control" id="textArea" rows="9" cols="9" readonly>${item.reason}</textarea>
                        </c:if>
                        <c:if test = "${item.reason == 'Other, specify in the description'}">
                        	<textarea class="form-control" id="textArea" rows="9" cols="9" readonly>${item.description}</textarea>
                        </c:if>
                        </td>
                        <td class="refund-cell">
                        
                        <div class="d-flex flex-column align-items-center text-center" id="amount-cell">Money to return<input type="number" value="0" class="text-center" step=".01"
                            min="0" max="${item.product.price * item.quantity}" oninput="validity.valid||(value='');" id="amount"></div>
                    </td>
                    <td class="response-cell">
                    
                        <div class="d-flex flex-column align-items-left text-center "><button type="button"
                                class="btn btn-success btn-lg">Accept</button><button type="button"
                                class="btn btn-danger btn-lg">Decline</button>
                        </div>
                    </td>
                </tr>
                </c:forEach>
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
    
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="js/admin/returnRequests.js"></script>
    
    
</body>

</html>