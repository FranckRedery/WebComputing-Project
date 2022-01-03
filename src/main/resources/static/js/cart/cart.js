window.addEventListener("load", function(){
	calcTotal();	
});

function calcTotal() {
	let prices = document.getElementsByClassName("prod_price");
	let myArray = [];
	let price = 0;
	let sum = 0;
	let quantity = document.getElementsByClassName("currentQuantity");
	for (let i = 0; i < prices.length; i++) {
		myArray[i] = prices[i].id;
		price += (parseFloat(myArray[i], 10.0)*parseFloat(quantity[i].value, 10.0));
		sum += (parseFloat(myArray[i], 10.0)*parseFloat(quantity[i].value, 10.0));
		prices[i].innerHTML = "$" + price.toFixed(2);
		price = 0;
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

$(":input").bind('keyup mouseup', function () {
    alert("changed");            
});

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
