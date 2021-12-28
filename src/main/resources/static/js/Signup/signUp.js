function checkRefresh(){
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
     window.location = document.getElementById('logi').href;
}

function resetSignUp(){	
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
     window.location = document.getElementById('sign').href;
}

function resetLogin(){	
	 $.ajax({  
         type : 'GET',  
         url : "/resetError",  
    });
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
			image: image
		}	
	});
  
  window.location = "index.html";
  
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
    
    window.location = "index.html";
}

 function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
 }

