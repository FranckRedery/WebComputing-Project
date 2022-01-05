$(document).ready(function() {
    $('#example').DataTable();
} );

$('table').on('click', '[class="btn btn-primary"]', function(e){
	
	let id = $(this).closest("tr").attr('id');

	$.ajax({
			type: "POST",
			url: "/publicReview",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function(){ window.location = "/review_purchase.html";}	
			});
	
	
});

// funzione che serve per gestire la richiesta reso 

$('table').on('click', '[class="btn btn-info"]', function(e){
	
	let id = $(this).closest("tr").attr('id');
	let quantity = $(this).closest("tr").find('#quantity').text();
	
	$.ajax({
			type: "POST",
			url: "/addReturnRequest",
			data: {
					id : id, 
					quantity : quantity,
				},
			success: function(){ window.location = "/itemReturn";}	
			});
	
	
});