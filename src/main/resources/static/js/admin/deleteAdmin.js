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
					let username = document.getElementById('userName').value;
					$.ajax({
						type: "POST",
						url: "/getUserByUsername",
						contentType: "application/json",
						data: username,
						async: false,
						success: function(data){
							if (!$.trim(data)){   
   								 alert("The user you are looking for does not exist");
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


function deleteAdmin(){
	
	let username = document.getElementById("username").innerText;

	$.ajax({
		type: "POST",
		url: "/deleteAdminByUsername",
		contentType: "application/json",
		data: username,
		beforeSend:function(){
        	if(confirm("Are you sure you want to delete this administrator?")){ 
				alert("The user "+ username +" is no longer an administrator");
				document.getElementById("riga").remove();
			}
		 	else{ return false; }
      	},
		success: function(){}
		});
}