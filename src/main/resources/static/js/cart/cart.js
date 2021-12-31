var text = $(".prod_price").text();
var myArray = text.split("$").map(Number);
var sum = 0.0;
for (var i = 0; i < myArray.length; i++){
	sum += parseInt(myArray[i], 10);
}
document.getElementById("tot").innerHTML= "$" + sum + ".00";

var iva = (sum * 22)/100;
document.getElementById("iva").innerHTML= "$" + iva;

var totalWithIva = sum + iva;
document.getElementById("totWithIva").innerHTML= "$" + totalWithIva;

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
		return actions.order.capture().then(function(details){
			document.getElementById("transition").style.display = "block";
		});
	}
	}).render('#paypal-button-container');
}
