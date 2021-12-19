function AdminLog(){		

var em = document.getElementById('typeEmailX').value;
var pas = document.getElementById('typePasswordX').value;

 if(em == "admin@admin.com" && pas == "admin"){
	 window.location = document.getElementById('admi').href;
 }
 else{
  window.location = document.getElementById('acc').href;	
 }

}