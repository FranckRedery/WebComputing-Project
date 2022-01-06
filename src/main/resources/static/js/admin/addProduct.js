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
				s += "<input type=\"checkbox\"  name=\"tags"  + "\" value=\"" + opzioni[1][i] + "\">"
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
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
				else{
					document.querySelector('#addProd').submit;
				}
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();