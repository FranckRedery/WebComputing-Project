// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
            var sel = document.getElementById('validationReason')
            var opt = sel.options[sel.selectedIndex]
            if(opt.text === 'Other, specify in the description'){
                document.getElementById('textArea').setAttribute('required','required')
                document.getElementById('description').innerHTML = "Description required"
            }
            else{
                document.getElementById('textArea').removeAttribute('required')
            }
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
  		  else{
	        alert("The return request has been created. You will be able to view the status of the return on your personal returns page");
			createRequest();
		  }
          form.classList.add('was-validated')
        }, false)
      })
  })()




function createRequest(){
	

	let id = document.getElementById('prodId').innerHTML;

	let product = new Product(id);
	let quantity = document.getElementById('qty').innerHTML;
	let reason = document.getElementById('validationReason').value;
	let description = document.getElementById('textArea').value;
	
	let returnRequest = new ReturnRequest(product,reason,description,quantity);
	
	$.ajax({
			type: "POST",
			url: "/addRequest",
			contentType: "application/json",
			data: JSON.stringify(returnRequest),
			success: function(){ window.location.href = "/myOrder.html";}	
			});
	
}



function Product(id){
	this.id = id;
}


function ReturnRequest(product,reason,description,quantity){
	this.product = product;
	this.reason = reason;
	this.description = description;
	this.quantity = quantity;
}


