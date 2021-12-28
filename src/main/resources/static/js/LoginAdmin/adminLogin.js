function AdminLog(){		

var em = document.getElementById('typeEmailX').value;
var pas = document.getElementById('typePasswordX').value;

 if(em == "admin@admin.com" && pas == "adminadmin"){
	 window.location = document.getElementById('admi').href;
 }
 
}

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
     window.location = document.getElementById('sign').href;
}

function validateForm() {
  var email = document.forms["loginForm"]["email"].value;
  var password = document.forms["loginForm"]["pass"].value;
  
   if(email == "admin@admin.com" && password == "adminadmin"){
	console.log("errore")
	 window.location = "adminPage";
   }
   else{
	$.ajax({
		type: 'POST',
		url: "/loginServices",
		dataType: "json",
		data: {
			email: email,
			password: password
		}
	});
	window.location = "index.html";
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
}


