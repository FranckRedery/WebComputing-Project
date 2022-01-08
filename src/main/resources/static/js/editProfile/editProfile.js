function timeOutS(logStatus,update){
	if(logStatus == null || logStatus == "no" || logStatus == ""){
		window.location = "/";
	}
	console.log(update)
	if(update == "si"){
		$.ajax({  
         type : 'GET',  
         url : "/resetUpdate",  
    	});
	document.getElementById('errore').style.display='block';	
	}
}

function formImage(){
	document.getElementById('ImageForm').submit();	
}

function saveProfile(){
	document.getElementById('infoForm').submit();	
	
	
	if(document.referrer == "http://localhost:8080/checkout.html"){
		window.location = "/checkout.html";
	}
	else{
	  window.location = "editProfile.html"	
	}
	
}

function reload(){
  window.location = "editProfile.html";
}

