function AdminLog(){		
var email = document.getElementById('typeEmailX').value;
var password = document.getElementById('typePasswordX').value;
 if(email == "admin@admin.com" && password == "adminadmin"){
	 window.location = "adminPage";
	 return;
 }
  $.ajax({
		type: 'POST',
		url: "/loginServices",
		data: {
			email: email,
			password: password
		},
		success: function(data){
		   if(data == "correct"){
			window.location = "/";
		   }
		   else{			
			window.location = "/login.html";
		   }
		}
	})
		
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
  
    window.location = "/";
    
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

 function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
 }
 
 function error(){
	document.getElementById('errore').style.display='block';
}

function close(){
	modal.style.display = "none";
}

function sendEmailS(){
	
	Email.send({
		Host: "smtp.gmail.com",
		Username: "techplanet2022@gmail.com",
		Password: "progettoweb2021",
		To: "dwondxoasjndoasw@jwvadvsad.com",
		From: "techplanet22@gmail.com",
		Subject: "Welcome to the Future",
		Body: "dsawa"
	})
}

