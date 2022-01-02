$("button#addProd").click(function(){
	let id = $(this).val();
	var quantity = document.getElementById("quantity").value;
	let chooses = new Chooses(id,quantity);
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

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;	
}