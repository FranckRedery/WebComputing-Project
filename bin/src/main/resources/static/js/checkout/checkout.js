function toEmptyCart() {
	$.ajax({
			type: "POST",
			url: "/ToEmptyCart",
			contentType: "application/json",
			success: function(){},
			});
}

function stoppedTyping(){
    if($("#cc-number").val().length > 0 && $("#cc-name").val().length > 0 && $("#cc-expiration").val().length > 0 && $("#cc-cvv").val().length > 0) {
       	$("#completeOrder").prop("disabled",false);
	} else { 
 		$("#completeOrder").prop("disabled",true);
       	}
    }
