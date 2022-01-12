window.addEventListener("load", function(){
		
});

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

$("button#addProd").click(function(){
	let id = $(this).val();
	let quantity = 1;
	let product = new Product(id);
	let chooses = new Chooses(product,quantity);
	document.getElementById("cart_" + id).innerHTML = "Added to cart";
	setTimeout(function() {
		document.getElementById("cart_" + id).innerHTML=""; },1000)	
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
});

$("button.addProdWishes").click(function(){
	let id = $(this).val();
	let product = new Product(id);
	let wishes = new Wishes(product);
	$.ajax({
		type: "POST",
		url: "/addProductToWishList",
		contentType: "application/json",
		data: JSON.stringify(wishes),
		success: function(){
				document.getElementById(id).innerHTML = "<i class=\"fas fa-heart\"></i>";
				setTimeout(function() {
   					location.reload();}, 1000);
			}
			});
});

function Product(id) {
	this.id = id;
}

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;	
}

function Wishes(id) {
	this.id = id;
}

$("button#viewProd").click(function(){
	let id = $(this).val();
		$.ajax({
			type: "POST",
			url: "/viewDetailsProdPage",
			contentType: "application/json",
			data: id,
			success: function(){
				window.location = "/product";
			}
			});
});

$(".product-name").click(function(){
	let id = $("button#viewProd").val();
		$.ajax({
			type: "POST",
			url: "/viewDetailsProdPage",
			contentType: "application/json",
			data: id,
			success: function(){
				window.location = "/product";
			}
			});
});

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
    
    $.ajax({  
         type : 'GET',  
         url : "/faiLogout",  
    });
    
    window.location.reload();
    
}

 function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
 }
