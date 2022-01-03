$("button#addProd").click(function(){
	let id = $(this).val();
	let quantity = document.getElementById("quantity").value;
	let product = new Product(id);
	let chooses = new Chooses(product,quantity);
		$.ajax({
			type: "POST",
			url: "/addProductToCart",
			contentType: "application/json",
			data: JSON.stringify(chooses),
			success: function(){
				setTimeout(function() {
   					location.reload();}, 2000);
			}
			});
});

function Product(id) {
	this.id = id;
}

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;	
}