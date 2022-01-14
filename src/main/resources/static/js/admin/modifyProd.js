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
		case "notebook":
			for(let i = 0; i < opzioni[1].length; ++i) {
				s += "<input type=\"checkbox\"  name=\"tags" + "\" value=\"" + opzioni[1][i] + "\">"
					+ "<label for=\"vehicle1\">" +  opzioni[1][i] + "</label><br />";
			}
			break;
		case "printers":
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
       
        var forms = document.getElementsByClassName('needs-validation-form-search');
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
						url: "/getProdByNameForModify",
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

(function () {
    'use strict';
    window.addEventListener('load', function () {

        var forms = document.getElementsByClassName('needs-validation-form-modify');
        // Loop over forms and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
				else{
					if(confirm("Are you sure you want to modify the product?")){ 
						alert("Product modified");
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
