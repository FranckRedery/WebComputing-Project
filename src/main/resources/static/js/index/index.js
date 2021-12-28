$('.owl-carousel').owlCarousel({
  loop: true,
  margin: 0,
  responsiveClass:true,
  responsive: {
    0: {
      items: 1,
    },
    768:{
      items: 2,
    },
    1100: {
      items: 3,
    },
    1400: {
      items: 4,
      loop: false,
    }
  }
});

/*function addToCart() {
	var bottonClicked = $("button").val();
	console.log(bottonClicked);
	/*document.getElementById("cart").innerHTML = "Added to cart";
	setTimeout(function() {
		document.getElementById("cart").innerHTML=""; },2000)	
	
	});
}*/

$("button").click(function(){
	var id = $(this).val();
	document.getElementById("cart_" + id).innerHTML = "Added to cart";
	/*$.ajax({
			type: "POST",
			url: "/addProductToCart",
			contentType: "application/json",
			data: id,
			success: function(data){}	
			});*/
	setTimeout(function() {
		document.getElementById("cart_" + id).innerHTML=""; },2000)	
	
	//console.log(idProduct);
});

/*var x = document.getElementsByClassName("product-type")[0].id;
console.log(x);*/

/*$("#bottone").on("click", function(e){ 
	//alert("worka");
	//$(this).closest('div').find('#cart').html('Added to cart');
	let idProduct = $("button").closest("div").find(".idHidden").text();
	console.log(idProduct);
});*/