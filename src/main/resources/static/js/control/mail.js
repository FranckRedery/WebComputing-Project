var x = getRand();
var conf = x;

function getRand(){		
	var code = Math.floor(Math.random() * 999999) +100000
	return code;
}

function sendEmail() {

	Email.send({
		Host: "smtp.gmail.com",
		Username : "techplanet2022@gmail.com",
		Password : "progettoweb2021",
		To : document.getElementById('EmailX').value,
		From : "techplanet22@gmail.com",
		Subject : "Verification Code",
		Body : "Il tuo codice di conferma è: " + conf,
	})
}
 
 
$('#emailCard').click(function(){ 
	
	$.ajax({  
         type : 'GET',  
         url : "/setMailCode",  
    });
});
