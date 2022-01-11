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
	var i = 0;
	  $('#closeB').prop('disabled', true);
	  $('#closeB').off('click');
	move(i);
	}
}

function reload(){
  window.location = "editProfile.html";
}

function move(i) {
  if (i == 0) {
    i = 1;
    var elem = document.getElementById("myBar");
    var width = 10;
    var id = setInterval(frame, 40);
    function frame() {
      if (width >= 100) {
 		changeMessage();
        clearInterval(id);
 		 $("#closeB").prop('disabled',true);
        i = 0;
      } else {
        width++;
        elem.style.width = width + "%";
        elem.innerHTML = width  + "%";
      }
    }
  }
}

function changeMessage(){
	document.getElementById("imgStatus").src = "images/account/greenCheck.gif";
	document.getElementById("closeB").href = "javascript:reload()";
	document.getElementById("msgAlert").innerHTML = "Image Update correctly press close button to view your new Profile Picture";
}

