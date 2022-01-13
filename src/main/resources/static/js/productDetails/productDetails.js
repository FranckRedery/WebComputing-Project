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

$("button#addProd").click(function() {
	let id = $(this).val();
	let quantity = document.getElementById("quantity").value;
	let product = new Product(id);
	let chooses = new Chooses(product, quantity);
	$.ajax({
		type: "POST",
		url: "/quantityBasedAddition",
		contentType: "application/json",
		data: JSON.stringify(chooses),
		success: function() {
			setTimeout(function() {
				location.reload();
			}, 1000);
		}
	});
});

$("button#addProdWishes").click(function() {
	let id = $(this).val();
	let product = new Product(id);
	let wishes = new Wishes(product);
	$.ajax({
		type: "POST",
		url: "/addProductToWishList",
		contentType: "application/json",
		data: JSON.stringify(wishes),
		success: function() {
			setTimeout(function() {
				location.reload();
			}, 1000);
		}
	});
});

function RemoveReview(id) {
		$.ajax({
			type: "POST",
			url: "/removeReview",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function() {
				window.location = "/product";
			}
		});
	}

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