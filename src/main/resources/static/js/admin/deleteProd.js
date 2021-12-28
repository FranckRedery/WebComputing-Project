(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
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
						url: "/deleteProduct",
						contentType: "application/json",
						data: name,
						success: function(){}
					});
				}
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();


function deleteFunction(){
	
	let id = document.getElementById("prodId").innerText;
	alert(id);
	$.ajax({
		type: "POST",
		url: "/deleteProdById",
		contentType: "application/json",
		data: id,
		success: function(){}
		});
}