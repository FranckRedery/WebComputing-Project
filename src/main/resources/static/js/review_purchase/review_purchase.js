function stoppedTyping(){
    if($(".title").val().length > 0) {
       	$("#start_button").prop("disabled",false);
	} else { 
 		$("#start_button").prop("disabled",true);
    }
}

function postReview() {
	var star = $('input:checked').attr('id');
	if (star == undefined) {
		star = 5;
	}
	else {
		var starNumber = star.split("_");
		starNumber.shift();
		star = starNumber;
	}
	starInt = parseInt(star);
	const titleText = document.getElementById('titleText').value;
	const descriptionText = document.getElementById('descriptionText').value; 
	const id = $('tbody').closest('table').attr('id');
	let product = new Product(id);	
	let reviews = new Review(product,titleText,descriptionText, starInt);
	$.ajax({
			type: "POST",
			url: "/addReview",
			contentType: "application/json",
			data: JSON.stringify(reviews),
			success: function(){
				checkLocation();
			},
			});
}

function postUpdateReview() {
	var star = $('input:checked').attr('id');
	if (star == undefined) {
		star = 5;
	}
	else {
		var starNumber = star.split("_");
		starNumber.shift();
		star = starNumber;
	}
	starInt = parseInt(star);
	const titleText = document.getElementById('titleText').value;
	const descriptionText = document.getElementById('descriptionText').value; 
	const id = $('tbody').closest('table').attr('id');
	let product = new Product(id);	
	let reviews = new Review(product,titleText,descriptionText, starInt);
	$.ajax({
			type: "POST",
			url: "/addReview",
			contentType: "application/json",
			data: JSON.stringify(reviews),
			success: function(){
				$('#updateReview').modal('show');
			},
			});
}

function checkLocation() {
	if (document.referrer == "http://localhost:8080/myOrder.html") {
		$('#addedReview').modal('show');
	}
	else {
		$('#updateReview').modal('show');
	}
}

function redirectPage() {
	if (document.referrer == "http://localhost:8080/myOrder.html")
		document.location = "/myOrder.html";
	else 
		document.location = "/";
}

function Product(id) {
	this.id = id;
}

function Review(id, title, description, stars) {
	this.id = id;
	this.title = title;
	this.description = description;
	this.stars = stars;	
}
