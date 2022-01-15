function checkRefresh(logged){
	
  if (logged == "si"){
	 $.ajax({  
         type : 'GET',  
         url : "/logoutG",  
    });
  }	
	
  if (performance.navigation.type == 1) {
	if (location.hash !== (location.hash = "#loaded")) {
 	  window.location.reload();
    }
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
  }
}

function errorBox(){
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
     window.location = "login.html"
}

function resetSignUp(){	
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
    
    signOutStand();
    
     window.location = document.getElementById('sign').href;
}

function resetLogin(){	
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
    
    signOutStand();
    
     window.location = document.getElementById('log').href;
}

function validateFormSignUp() {
  var exp = '\s*';
  var username = document.forms["SignUpForm"]["username"].value;
  var email = document.forms["SignUpForm"]["email"].value;
  var password = document.forms["SignUpForm"]["password"].value;
	console.log(username);
  if (username.match(exp)) {
	document.getElementById("fail").innerHTML = "username must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
  }
  if (email.match(exp)) {
	document.getElementById("fail").innerHTML = "email must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
  }
  if (password.match(exp)){
	document.getElementById("fail").innerHTML = "password must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
  }
}

function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  var username = profile.getName();
  var email = profile.getEmail();
  var image = profile.getImageUrl();
  var id = profile.getId();
  console.log('ID: ' + profile.getId()); 
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); 
  
  $.ajax({
		type: 'POST',
		url: "/loginGoogle",
		dataType: "json",
		data: {
			id:id,
			username: username,
			email: email,
			image: image,
		}	
	});
	
	window.location = "/";
	
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
    
    $.ajax({  
         type : 'GET',  
         url : "/faiLogout",  
    });
    
    window.location = "/";
}


function signOutStand() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
    
    $.ajax({  
         type : 'GET',  
         url : "/faiLogout",  
    });
    
}

 function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
 }

function check(){
	if(document.referrer == "http://localhost:8080/login.html" || document.referrer == "http://localhost:8080/signUp.html"){
		wait(200);
		window.location.reload();
	}
}

function timeOut(logStatus){
	if(logStatus == null || logStatus == "no" || logStatus == ""){
		window.location = "/";
	}
}

function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}
