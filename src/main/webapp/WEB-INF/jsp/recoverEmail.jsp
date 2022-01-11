<!DOCTYPE html>
<html lang="it">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/login/login_style.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="js/control/mail.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
    <script src="https://smtpjs.com/v3/smtp.js"></script>
</head>
<title>TechPlanet</title>
</head>
<body id="b" class="gradient-custom">
		<div class="container py-3 h-100">
		  <div class="row d-flex justify-content-center align-items-center h-10">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
			  <div class="card bg-dark text-white" style="border-radius: 1rem;">
				<div class="card-body p-3 text-center">
				  <div class="mb-md-10 mt-md-2 pb-4">
					  <h2 style="color: cornsilk;" class="fw-bold mb-2 text-uppercase">RECOVER EMAIL</h2>
					<img src="/images/index/logo.png" alt="">
					 <form action="javascript:sendEmailRecovery()">
					<div class="form-outline form-white mb-3">
					<h3 style=" font-size: 20px; color: gray; text-align: center;">Enter the email address associated with your TeachPlanet account.</h1>
						<label class="form-label" for="typeEmailX">Email</label>
					  <input type="email" id="EmailX" placeholder="Enter email" class="form-control form-control-lg" required>
					</div>
					<div class="form-outline form-white mb-3">
						<label class="form-label" for="typeEmailX">username</label>
					  <input type="email" id="EmailX" placeholder="Enter username" class="form-control form-control-lg" required pattern=".{6,15}" title="Minimo 6 e Massimo 15 caratteri">
					</div>
					<a>
						<button class="btn btn-outline-light btn-lg px-5" type="submit">Continue</button>
					</a>
					 </form>	
				</div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
</body>

</html>