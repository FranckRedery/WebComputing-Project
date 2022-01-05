function stoppedTyping(){
    if($(".title").val().length > 0) {
       	$("#start_button").prop("disabled",false);
	} else { 
 		$("#start_button").prop("disabled",true);
       	}
    }
