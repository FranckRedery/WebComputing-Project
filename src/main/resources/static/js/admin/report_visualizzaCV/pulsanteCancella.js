function pulsanteCancella() {
	btnCancella.addEventListener("click", function(){
		var selectedCheckBoxes = document.querySelectorAll("input.report:checked");
		
		if (selectedCheckBoxes.length > 0){
			if(confirm("Are you sure you want to delete?")) {
				selectedCheckBoxes.forEach(function(checkBox, indice){
				
					checkBox.checked = false;
					
					checkBox.parentNode.parentNode.remove();
						
					var id = checkBox.getAttribute("id");
					
					elimina(id);
					
				});
				
				$("#checkBoxTh").prop("checked", false);
				
			}
			
		} else
			alert("Select at least one element!");
		
	});
}

function checkBoxTh() {
	if($("#checkBoxTh").attr('checked')) {
		selezionaDeselezionaTuttiCheckBox(false);
		$("#checkBoxTh").attr('checked', false);
	}
	else {
		selezionaDeselezionaTuttiCheckBox(true);
		$("#checkBoxTh").attr('checked', true);
	}	
}

function selezionaDeselezionaTuttiCheckBox(selezionare) {
	$("input[type=checkbox]").each(function() {
		$(this).prop("checked", selezionare);
	});
}

