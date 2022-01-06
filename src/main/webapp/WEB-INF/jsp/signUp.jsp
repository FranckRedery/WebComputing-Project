<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="it">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link type="text/css" rel="stylesheet" href="css/login/login_style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/Signup/signUpLog.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="397262973292-raelfe22asjtmti3g7f4idddbjl30mn3.apps.googleusercontent.com">
<script src="js/Signup/signUp.js"></script>
</head>
<title>TechPlanet</title>
</head>
<body id="b" onload="checkRefresh(${loggato});">
	<div class="container py-3 h-100">
		<div class="row d-flex justify-content-center align-items-center h-10">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<div class="card-body p-3 text-center">
						<div class="mb-md-3 mt-md-2 ">
							<h2 style="color: cornsilk;" class="fw-bold mb-2 text-uppercase">SIGN
								UP</h2>
							<img src="images/index/logo.png" alt="">
							<div class="form-outline form-white mb-3">
							  <c:if test="${errore == 'si'}">
								<form name="SignUpForm" method="post"  action="javascript:SignUp()">
									<label class="form-label">Username</label> <input type="text"
										name="username" id="typeUsernameX"
										class="form-control form-control-lg" required
										pattern=".{6,15}" title="Minimo 6 e Massimo 15 caratteri" />
									<div class="form-outline form-white mb-3">
										<label class="form-label" for="typeEmailX">Email</label> <input
											type="email" name="email" id="typeEmailX"
											class="form-control form-control-lg" required />
									</div>
									<div class="form-outline form-white mb-4">
										<label class="form-label" for="typePasswordX">Password</label>
										<input type="password" name="password" id="typePasswordX"
											class="form-control form-control-lg" required pattern=".{6,}"
											title="Minimo 6 caratteri" />
										<div style="margin-top: 5%;" id="fail"
											class="alert-box failure">Username or Password alredy
											exist</div>
										<p class="small mb-5 pb-lg-2">
											<a class="text-white-50" href="#!">Forgot password?</a>
										</p>
										<div id="bottoni">
											<button id="log" style="margin: 20px"
												class="btn btn-outline-light btn-lg px-4" type="submit">Sign
												Up</button>
											<a id="G" class="g-signin2" data-onsuccess="onSignIn"
												data-theme="dark" class="text-white"><i
												class="fab fa-google fa-lg"></i></a>
										</div>
									</div>
								</form>
								</c:if>
								<c:if test="${errore != 'si'}">
								<form name="SignUpForm" method="post" action="javascript:SignUp()">
									<label class="form-label">Username</label> <input type="text"
										name="username" id="typeUsernameX"
										class="form-control form-control-lg" required
										pattern=".{6,15}" title="Minimo 6 e Massimo 15 caratteri" />
									<div class="form-outline form-white mb-3">
										<label class="form-label" for="typeEmailX">Email</label> <input
											type="email" name="email" id="typeEmailX"
											class="form-control form-control-lg" required />
									</div>
									<div class="form-outline form-white mb-3">
										<label class="form-label" for="typePasswordX">Password</label>
										<input type="password" name="password" id="typePasswordX"
											class="form-control form-control-lg" required pattern=".{6,}"
											title="Minimo 6 caratteri" />
										<p class="small mb-3 pb-lg-2"></p>
										</div>
										<div id="bottoni">
											<button id="log" style="margin: 20px"
												class="btn btn-outline-light btn-lg px-4" type="submit">Sign
												Up</button>
											<a id="G" class="g-signin2" data-onsuccess="onSignIn"
												data-theme="dark" class="text-white"><i
												class="fab fa-google fa-lg"></i></a>
										</div>
								</form>
							</c:if>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center text-center">
						<p>Already registered? 
						    <button style="text-decoration: underline; color: grey; background: transparent; border: 0;" onclick="errorBox()">Log In</button>
							or back to <a href="/"style="color: grey; background: transparent; border: 0;">Home </a>
						</p>
						<a id="logi" href="login.html"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>