var opzioni = new Array();
opzioni.push(new Array("personal use", "home office", "small business", "large company", 
			"print", "copy", "scanner", "fax", "color", "black and white", "few", "a little", "often", "always",
			"usb", "wifi", "parallel port"));
opzioni.push(new Array("gaming", "daily use", "editing", "amd", "intel",
		"13", "14", "15", "17", "wifi 6", "backlit keyboard", "fingerprint", "touchscreen"));

function caricaOpzioni() {
	var categoria = document.getElementById("productCategory").value;
	var tag = document.getElementById("tag");
	tag.innerHTML = "";
	let s = "";
	switch(categoria) {
		case "Notebook":
			for(let i = 0; i < opzioni[1].length; ++i) {
				s += "<input type=\"checkbox\"  name=\"tags" + "\" value=\"" + opzioni[1][i] + "\">"
					+ "<label for=\"vehicle1\">" +  opzioni[1][i] + "</label><br />";
			}
			break;
		case "Printers":
			for(let i = 0; i < opzioni[0].length; ++i) {
				s += "<input type=\"checkbox\"  name=\"tags" + "\" value=\"" + opzioni[0][i] + "\">"
					+ "<label for=\"vehicle1\">" +  opzioni[0][i] + " </label><br />";
			}
			break;
		default:
			return;
	}
	
	tag.innerHTML = "<label class=\"form-label\" for=\"productTag\">Tag</label><br />"
					+ s;
}


(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation-form-search');
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
						url: "/getProdByName",
						contentType: "application/json",
						data: name,
						async: false,
						success: function(){
							window.location.reload(); }
					});
				}
                form.classList.add('was-validated');
			}, false);
		});
	}, false);
})();

(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation-form-modify');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
				else{
					//modifyFunction();
					if(confirm("Are you sure you want to modify the product?")){ 
						//document.querySelector('#modifyProduct').submit;
						}
		 			else{ 
						event.preventDefault();
						return false; 
						}
				}
                form.classList.add('was-validated');
			}, false);
		});
	}, false);
})();


/*function modifyFunction(){
	
	
	let id = document.getElementById('prodId').innerText;
	let name = document.getElementById('productNameModify').value;
	let category = document.getElementById('productCategory').value;
	let selectedCheckBoxes = document.querySelectorAll("input:checked");
	let tags = "";
	let nuovaTag;
	if (selectedCheckBoxes.length > 0){
		selectedCheckBoxes.forEach(function(checkBox, indice){
		nuovaTag = checkBox.value;
		tags += nuovaTag;
		if(indice != selectedCheckBoxes.length-1){
			tags += ',';
			}
		});}
	let description = document.getElementById('description').value;
	// TO DO.. take images... in the future maybe , when we will realize how to store img xD
	let price = document.getElementById('amount').value;
	let quantity = document.getElementById('quantity').value;
					
	let product = new Product(id,name,category,tags,description,price,quantity);



	$.ajax({
		type: "POST",
		url: "/modifyProd",
		contentType: "application/json",
		data: JSON.stringify(product),
		beforeSend:function(){
        	if(confirm("Are you sure you want to modify the product?")){ 
				document.getElementById("riga").remove();
			}
		 	else{ return false; }
      	},
		success: function(){}
		});
	//document.getElementById("riga").remove();
	
}

function Product(id,name,category,tags,description,price,quantity){
	this.id = id;
	this.name = name;
	this.category = category;
	this.tags = tags;
	this.description = description;
	this.price = price;
	this.quantity = quantity;
}*/
