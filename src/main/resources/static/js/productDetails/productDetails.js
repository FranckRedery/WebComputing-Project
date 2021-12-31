$("button#addProd").click(function(){
	let id = $(this).val();
	document.getElementById("cart_" + id).innerHTML = "Added to cart";
	setTimeout(function() {
		document.getElementById("cart_" + id).innerHTML=""; },2000)	
		$.ajax({
			type: "POST",
			url: "/addProductToCart",
			contentType: "application/json",
			data: id,
			success: function(){
				setTimeout(function() {
   					location.reload();}, 2000);
			}
			});
});