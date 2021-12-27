function AdminLog(){		

var em = document.getElementById('typeEmailX').value;
var pas = document.getElementById('typePasswordX').value;

 if(em == "admin@admin.com" && pas == "admin"){
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
  if (email == "") {
	document.getElementById("fail").innerHTML = "email must be filled out";
    return false;
  }
  if (password == "") {
	document.getElementById("fail").innerHTML = "password must be filled out";
    return false;
  }
}