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


