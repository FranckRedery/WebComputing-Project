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

function reload(){
  window.location = "editProfile.html";
}

