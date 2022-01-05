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
			createRequest();
		  }
          form.classList.add('was-validated')
        }, false)
      })
  })()


function createRequest(){
	
	// serve creare la richiesta di reso ..
	let id = document.getElementById('prodId').innerHTML;
	// mi interessa il prodotto solamente con il suo id 
	let product = new Product(id);
	// l'user viene creato nel metodo post
	// la data va creata dentro il metodo post
	// lo status viene settato a pending in automatico nel metodo post
	// moneyreturned viene settato a 0 in automatico nel metodo post
	let reason = document.getElementById('validationReason').value;
	let description = document.getElementById('textArea').value;
	
	let returnRequest = new ReturnRequest(product,reason,description);
	
	$.ajax({
			type: "POST",
			url: "/addRequest",
			contentType: "application/json",
			data: JSON.stringify(returnRequest),
			success: function(){ window.location = "/userReturns";}	
			});
	
}


function Product(id){
	this.id = id;
}


function ReturnRequest(product,reason,description){
	this.product = product;
	this.reason = reason;
	this.description = description;
}


