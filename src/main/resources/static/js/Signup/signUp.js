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

function validateFormSignUp() {
  var exp = '\s*'
  var username = document.forms["SignUpForm"]["username"].value;
  var email = document.forms["SignUpForm"]["email"].value;
  var password = document.forms["SignUpForm"]["password"].value;
  if (username.match(exp)) {
	document.getElementById("fail").innerHTML = "username must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
    return false;
  }
  if (email.match(exp)) {
	document.getElementById("fail").innerHTML = "email must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
    return false;
  }
  if (password.match(exp)){
	document.getElementById("fail").innerHTML = "password must be filled out";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
    return false;
  }
  if (password.length < 6) {
	document.getElementById("fail").innerHTML = "password must be at least 6 character";
	$.ajax({  
         type : 'GET',  
         url : "/activeError",  
    });
    return false;
  }
}