<!DOCTYPE html>
<html lang="it">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link type="text/css" rel="stylesheet" href="css/login/login_style.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/LoginAdmin/adminLogin.js"></script>
</head>
<title>TechPlanet</title>
</head>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-3 h-100">
		  <div class="row d-flex justify-content-center align-items-center h-10">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
			  <div class="card bg-dark text-white" style="border-radius: 1rem;">
				<div class="card-body p-3 text-center">
				  <div class="mb-md-3 mt-md-2 pb-4">
					  <h2 style="color: cornsilk;" class="fw-bold mb-2 text-uppercase">Login</h2>
					<img src="images/index/logo.png" alt="">
					<div class="form-outline form-white mb-3">
						<label class="form-label" for="typeEmailX">Email</label>
					  <input type="email" id="typeEmailX" class="form-control form-control-lg" />
					</div>
					<div class="form-outline form-white mb-3">
						<label class="form-label" for="typePasswordX">Password</label>
					  <input type="password" id="typePasswordX" class="form-control form-control-lg" />
					</div>
					<p class="small mb-3 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>
					<button onclick="AdminLog()" class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
					<div class="d-flex justify-content-center text-center mt-3 pt-1">
					  <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
					  <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
					  <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
					</div>
					<p class="mt-2">Don't have an account? <a href="signUp.html" class="text-white-50 fw-bold"> Sign Up</a></p>
					<a id="admi" href="adminPage"></a>
					<a id="acc" href="account.html"></a>
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</div>
</body>

</html>