(function () {
    'use strict';
    window.addEventListener('load', function () {
        
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over forms and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
				else{
					let name = document.getElementById('productName').value;
					$.ajax({
						type: "POST",
						url: "/getProdByName",
						contentType: "application/json",
						data: name,
						async: false,
						success: function(data){
							if (!$.trim(data)){   
   								 alert("The product you are looking for does not exist");
								}
							else{   
    							window.location.reload();;
								}
							}
					});
				}
                form.classList.add('was-validated');
			}, false);
		});
	}, false);
})();


function deleteFunction(){
	
	let id = document.getElementById("prodId").innerText;

	$.ajax({
		type: "POST",
		url: "/deleteProdById",
		contentType: "application/json",
		data: id,
		beforeSend:function(){
        	if(confirm("Are you sure you want to delete this product?")){ 
				alert("Product deleted");
				document.getElementById("riga").remove();
			}
		 	else{ return false; }
      	},
		success: function(){}
		});
	
}