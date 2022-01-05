$(document).ready(function() {
    $('#example').DataTable();
} );



// funzione che serve per gestire la richiesta reso 

$('table').on('click', '[class="btn btn-info"]', function(e){
	
	let id = $(this).closest("tr").attr('id');

	
	$.ajax({
			type: "POST",
			url: "/addReturnRequest",
			contentType: "application/json",
			data: JSON.stringify(id),
			success: function(){ window.location = "/itemReturn";}	
			});
	
	
});