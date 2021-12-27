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
				s += "<input type=\"checkbox\"  name=\"" + opzioni[1][i] + "\" value=\"" + opzioni[1][i] + "\">"
					+ "<label for=\"vehicle1\">" +  opzioni[1][i] + "</label><br />";
			}
			break;
		case "Printers":
			for(let i = 0; i < opzioni[0].length; ++i) {
				s += "<input type=\"checkbox\"  name=\"" + opzioni[0][i] + "\" value=\"" + opzioni[0][i] + "\">"
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
					
					let product = new Product(name,category,tags,description,price,quantity);
					alert("prima ajax")
					$.ajax({
						type: "POST",
						url: "/addProduct",
						contentType: "application/json",
						data: JSON.stringify(product),
						success: function(data){}
					});
					alert("dopo ajax")
				}
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();


function Product(name,category,tags,description,price,quantity){
	this.name = name;
	this.category = category;
	this.tags = tags;
	this.description = description;
	this.price = price;
	this.quantity = quantity;
}