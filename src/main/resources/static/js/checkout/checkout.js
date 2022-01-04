function toEmptyCart() {
	$.ajax({
			type: "POST",
			url: "/ToEmptyCart",
			contentType: "application/json",
			success: function(){},
			});
}