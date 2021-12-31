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

