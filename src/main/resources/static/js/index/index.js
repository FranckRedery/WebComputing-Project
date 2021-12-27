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
	document.getElementById("cart").innerHTML = "Added to cart";
	setTimeout(function() {
		document.getElementById("cart").innerHTML=""; },2000)	
}*/
/*var x = document.getElementsByClassName("product-type")[0].id;
console.log(x);*/

$('div').on('click', '[class="col-6 py-2 bottone"]', function(e){ 
	alert("worka");
	$(this).closest('div').find('#cart').html('Added to cart');
});