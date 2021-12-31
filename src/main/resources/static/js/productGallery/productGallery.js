$(".addProd").click(function(){
	var id = $(this).data("custom-value");
	$.ajax({
			type: "POST",
			url: "/addProductToCart",
			contentType: "application/json",
			data: JSON.stringify(id),
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