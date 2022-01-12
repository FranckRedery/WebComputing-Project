function removeFromWishList(id) {
	removeProducFromWishList(id);
		$.ajax({
			type: "POST",
			url: "/removeProductFromWishList",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function(){},
			});
}

function removeProducFromWishList(id){
	var rowToRemove = document.querySelector("#col_" + id);
	rowToRemove.remove();
}

function moveToCart(id) {
	let quantity = 1;
	let product = new Product(id);
	let chooses = new Chooses(product,quantity);
	$.ajax({
		type: "POST",
		url: "/addProductToCart",
		contentType: "application/json",
		data: JSON.stringify(chooses),
		success: function(){
					setTimeout(function() {
   					location.reload();}, 1000);
			}
			});
}

function Product(id) {
	this.id = id;
}

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;	
}
