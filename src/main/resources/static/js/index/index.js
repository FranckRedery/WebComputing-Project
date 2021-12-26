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

function addToCart() {
	document.getElementById("cart").innerHTML = "Added to cart";
	setTimeout(function() {
		document.getElementById("cart").innerHTML=""; },3000)
}

/*$('button').on('click', '[class="col-6 py-2"]', function(e){ 
	alert("worka");
	$(this).closest('div').find('#cart').html('Added to cart');
});*/