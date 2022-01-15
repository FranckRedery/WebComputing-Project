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

function generatePayment(value) {
	if (value==""){
		alert("inserire un prodotto nel carrello");
		return;
	}
	paypal.Buttons({
		styles: {
    'input': {
      'font-size': '16pt',
      'color': '#3A3A3A'
     },
    '.number': {
      'font-family': 'monospace'
     },
    '.valid':  {
      'color': 'green'
     }
   },
	createOrder: function(data,actions) {
		return actions.order.create ({
			purchase_units: [{
				amount: {
					value: value
				}
			}]
		});
	},
	onApprove: function(data,actions) {
		toEmptyCart();
		window.location = "/purchaseCompleted.html";
		return actions.order.capture().then(function(details){
			document.getElementById("transition").style.display = "block";
		});
	}
	}).render('#paypal-button-container');
}