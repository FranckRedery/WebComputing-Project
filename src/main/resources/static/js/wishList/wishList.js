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