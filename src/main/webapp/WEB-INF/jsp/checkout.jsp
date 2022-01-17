<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Checkout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/checkout/checkout.css">
<script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=ASGmzQFYx18CDf9Lu_NxWjMsWmjkugEzqzG-UK90RY2J1dnrRiR31TRnKVPNHs-wUX8sjz7J_LRiTNau"></script>
</head>
<body>
	<main>

		<!-- DEMO HTML -->
		<div class="container">
			<div class="py-5 text-center">

				<h2>Checkout form</h2>
			</div>

			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Your cart</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between total" id="${total}"><span>Total
								(USD)</span> <strong>${total}.00$</strong></li>
					</ul>
				</div>
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Billing address</h4>
					<form class="needs-validation">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="firstName">First name</label> <input type="text"
									class="form-control" id="firstName" placeholder="${name}"
									value="" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">Last name</label> <input type="text"
									class="form-control" id="lastName" placeholder="${surname}"
									value="" readonly>
							</div>
						</div>

						<div class="mb-3">
							<label for="username">Username</label>
							<div class="input-group">
								<input type="text" class="form-control" id="username"
									placeholder="${username}" readonly>
							</div>
						</div>

						<div class="mb-3">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" placeholder="${email}" readonly>
						</div>

						<div class="mb-3">
							<label for="address">Address</label> <input type="text"
								class="form-control" id="address" placeholder="${addressline1}"
								readonly>
						</div>

						<div class="mb-3">
							<label for="address2">Address 2</label> <input type="text"
								class="form-control" id="address2" placeholder="${addressline2}"
								readonly>
						</div>
						<hr class="mb-4">
						<h4 class="mb-3">Payment</h4>
						<div id="paypal-button-container"></div>
						<hr class="mb-4">
						<button class="btn btn-primary btn-lg btn-block"
							id="completeOrder" type="button" data-bs-toggle="modal"
							data-bs-target="#myModal" onclick="toEmptyCart()">proceed
							to order</button>
					</form>
				</div>
			</div>

			<footer class="my-5 pt-5 text-muted text-center text-small">
				<p class="mb-1">&copy; 2021 - 2045 Tech Planet</p>
				<ul class="list-inline">
					<li class="list-inline-item"><a href="/privacyPolicy">Privacy</a></li>
					<li class="list-inline-item"><a href="/termsAndConditions">Terms</a></li>
					<li class="list-inline-item"><a href="/customerSupport">Support</a></li>
				</ul>
			</footer>
		</div>
		<!-- End Demo HTML -->

	</main>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script src="js/checkout/checkout.js"></script>
</body>
</html>