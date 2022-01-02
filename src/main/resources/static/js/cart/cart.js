window.addEventListener("load", function(){
	calcTotal();	
});

function calcTotal() {
var text = $(".prod_price").text();
var myArray = text.split("$").map(Number);
var sum = 0.0;
for (var i = 0; i < myArray.length; i++){
	sum += parseFloat(myArray[i], 10.0);
}
document.getElementById("tot").innerHTML= "$" + sum.toFixed(2);

var iva = (sum * 22.0)/100.0;
document.getElementById("iva").innerHTML= "$" + iva.toFixed(2);

var totalWithIva = sum + iva;
document.getElementById("totWithIva").innerHTML= "$" + totalWithIva.toFixed(2);
}

/*function generatePayment(value) {
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
*/
$(".removeProd").click(function(){
	var id = $(this).data("custom-value");
	removeProductFromCart(id);
	$.ajax({
			type: "POST",
			url: "/removeProductFromCart",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function(){},
			});
	calcTotal();
});

function removeProductFromCart(id){
	var rowToRemove = document.querySelector("#row_" + id);
	rowToRemove.remove();
}
