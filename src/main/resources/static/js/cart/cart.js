var text = $(".prod_price").text();
var myArray = text.split("$").map(Number);
var sum = 0.0;
for (var i = 0; i < myArray.length; i++){
	sum += parseInt(myArray[i], 10);
}
document.getElementById("tot").innerHTML= "$" + sum + ".00";

var iva = (sum * 22)/100;
document.getElementById("iva").innerHTML= "$" + iva + ".00";

var totalWithIva = sum + iva;
document.getElementById("totWithIva").innerHTML= "$" + totalWithIva + ".00";


