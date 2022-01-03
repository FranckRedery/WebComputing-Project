$(".addProd").click(function(){
	let id = $(this).data("custom-value");
	let quantity = 1;
	let product = new Product(id);
	let chooses = new Chooses(product, quantity);
	$.ajax({
			type: "POST",
			url: "/addProductToCart",
			contentType: "application/json",
			data: JSON.stringify(chooses),
			success: function(){},
			});
});

$(".viewProd").click(function(){
	var id = $(this).data("custom-value");
	$.ajax({
			type: "POST",
			url: "/viewDetailsProdPage",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function(){
				window.location = "/product";
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