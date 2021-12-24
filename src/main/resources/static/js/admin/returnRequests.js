$('table').on('click', '[class="btn btn-success btn-lg"]', function(e){
	let usernameField = $(this).closest("tr").find("#username").text();
	let productID = $(this).closest("tr").find("#prodId").text();
    let moneyReturned = $(this).closest("tr").find("#amount").val();
	let status = "accepted";
	let user = new User(usernameField);
	let product = new Product(productID);
	let returnRequest = new ReturnRequest(user,product,moneyReturned,status);
	
	if(moneyReturned == ""){
		console.log("è null");
		//$(this).closest("tr").find("#amount-cell").innerHTML = "Insert a valid number"; non funziona, poi da risolvere insomma... al momento non accetta il valore vuoto
	}
	else{
		$.ajax({
			type: "POST",
			url: "/updateRequest",
			contentType: "application/json",
			data: JSON.stringify(returnRequest),
			success: function(data){}	
			});
		$(this).closest('tr').remove();
	}

	
     });

$('table').on('click', '[class="btn btn-danger btn-lg"]', function(e){
       

	let usernameField = $(this).closest("tr").find("#username").text();
	let productID = $(this).closest("tr").find("#prodId").text();
    let moneyReturned = 0;
	let status = "declined";
	let user = new User(usernameField);
	let product = new Product(productID);
	let returnRequest = new ReturnRequest(user,product,moneyReturned,status);
	
	$.ajax({
			type: "POST",
			url: "/updateRequest",
			contentType: "application/json",
			data: JSON.stringify(returnRequest),
			success: function(data){}	
			});
		$(this).closest('tr').remove();
     });



function ReturnRequest(user,product,moneyReturned,status){
	this.user = user;
	this.product = product;
	this.moneyReturned = moneyReturned;
	this.status = status;
}

function User(username){
	this.username = username;
}

function Product(id){
	this.id = id;
}