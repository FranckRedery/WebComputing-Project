window.addEventListener("load", function(){
	//showReviews();	
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
		document.getElementById("cart_" + id).innerHTML=""; },2000)	
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

function Product(id) {
	this.id = id;
}

function Chooses(id, quantity) {
	this.id = id;
	this.quantity = quantity;	
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

function showReviews() {
	var reviews = document.getElementsByClassName("reviews");
	for (let i = 0; i < reviews.length; i++) {
		/*while (star < reviews[i].id) {
			let span;
			if (star == 0)
				span = document.getElementById(reviews[i].id);
			else 
				span = document.getElementById(star);
			star++;
			console.log(span);
			span.innerHTML = "<span> <i class=\"fas fa-star\" id=\""+ star +"\"></i></span>"
		}*/
		if (reviews[i].id == 5.0) {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span>(25 reviews)</span>"
		}
		else if (reviews[i].id == 4.0) {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span>(25 reviews)</span>"
		}
		else if (reviews[i].id == 3.0) {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span>(25 reviews)</span>"
		}
		else if (reviews[i].id == 2.0) {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"fas fa-star\"></i></span><span> <i class=\"fas fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span>(25 reviews)</span>"
		}
		else if (reviews[i].id == 1.0) {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"fas fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span>(25 reviews)</span>"
		}
		else {
			let span = document.getElementById(reviews[i].id);
			span.innerHTML = "<span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span> <i class=\"far fa-star\"></i></span><span>(25 reviews)</span>"
		}
	}
}

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

