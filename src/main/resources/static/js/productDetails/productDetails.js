$("button#addProd").click(function() {
	let id = $(this).val();
	let quantity = document.getElementById("quantity").value;
	let product = new Product(id);
	let chooses = new Chooses(product, quantity);
	$.ajax({
		type: "POST",
		url: "/quantityBasedAddition",
		contentType: "application/json",
		data: JSON.stringify(chooses),
		success: function() {
			setTimeout(function() {
				location.reload();
			}, 1000);
		}
	});
});

function RemoveReview(id) {
	if (confirm("Are you sure you want to delete this review?")) {
		$.ajax({
			type: "POST",
			url: "/removeReview",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function() {
				window.location = "/product";
			}
		});
	}
}

function Product(id) {
	this.id = id;
}

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;
}