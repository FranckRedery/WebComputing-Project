window.onload = function() {
	pulsanteCancella();
	popolaMinAge();
}

var aggiungi = false;

function pulsanteAggiungi() {

	var divForm = document.getElementById("divForm");

	document.getElementById("titoloForm").value = "";
	document.getElementById("descrizioneForm").value = "";
	document.getElementById("requisitiForm"). value = "";
	document.getElementById("checkBoxForm").checked = false;
	
	document.getElementById("min").options.selectedIndex = 0;
	caricaOpzioniAge();
	svuotaEliminaSection();

	if(!aggiungi)
		divForm.style.display = "inline-block";
	else 
		divForm.style.display = "none";
	
	aggiungi = !aggiungi;
}

function inviaLavoro() {
	
	var titolo = document.getElementById("titoloForm");
	var descrizione = document.getElementById("descrizioneForm");
	var requisiti = document.getElementById("requisitiForm");
	var attivo = document.getElementById("checkBoxForm");
	

	var min = document.getElementById("min").value;
	var max = document.getElementById("max").value;
	
	var select = document.getElementsByClassName("studio");
	
	var obbligatori = new Array();
	obbligatori.push(new Obbligatorio(0, "Age range", min, max));
	
	for(let i = 0; i < select.length - 1; i += 2)
		if(select[i].value != "" && select[i].value != " -- select an option -- ")
			obbligatori.push(new Obbligatorio(0, "Study title", select[i].value, select[i + 1].value));
	
	var posizioneLavoro = new PosizioneLavoro(titolo.value, descrizione.value, requisiti.value, obbligatori, attivo.checked)
	
	if(controllaSeFormVuoti(titolo.value, descrizione.value, requisiti.value)) {
	
		controllaTitoloUnico(posizioneLavoro);
		
	} else
		alert("Fill in all fields");
}

function continuaInvioLavoro(data, lavoro) {
	
	let s = "Do you really want to add the new job position?";
	if(data == "titolo")
		s = "A job with the same title already exists. Continuing will overwrite the previous one. To continue?";
		
	
	if(confirm(s)) {
			
		if(data != "titolo")
			aggiungiLavoroTabella(lavoro);
		else
			modificaLavoroTabella(lavoro);
				
		salvaLavoro(lavoro);
		
		document.getElementById("titoloForm").value = "";
		document.getElementById("descrizioneForm").value = "";
		document.getElementById("requisitiForm").value = "";
		document.getElementById("checkBoxForm").checked = false;
		
		document.getElementById("min").options.selectedIndex = 0;
		caricaOpzioniAge();
		svuotaEliminaSection();
		
	}
}

function modificaLavoroTabella(lav) {

	let check = "<input type=\"checkbox\" id = \"lavoroCheckBox\" value = \"true\"/>";
	let immagine = "si";
	if(!lav.active) {
		check = "<input type=\"checkbox\" id = \"lavoroCheckBox\" value = \"false\"/>";
		immagine = "no";
	}
	let img = "<figure>"
				+ "<img src = \"images/admin/posizioniLavoro/" + immagine + ".png\">"
			+ "</figure>";
	
	$(".titoloLavoro").each(function() {
		if($(this).html() == lav.title) {
			$(this).next().html(lav.description);
			$(this).next().next().html(lav.requirements);
			$(this).next().next().next().html("");
			for(let i = 0; i <= lav.obligatory.length; ++i) {
				if(i == lav.obligatory.length)
					$(this).next().next().next().append("<div></div>");
				
				else
					$(this).next().next().next().append(lav.obligatory[i].name + ": " + lav.obligatory[i].value1 + " - " + lav.obligatory[i].value2 + "<br /><br />");
			}
			$(this).next().next().next().next().html("<br />" + check + img);
		}
			
	});
	
}


function aggiungiLavoroTabella(lav) {
	var tableElement = document.querySelector("#tabella tbody");

	var riga = tableElement.insertRow(-1);
		
	var cellaCheckBox = riga.insertCell(0);
	cellaCheckBox.setAttribute('data-title', "Select deselect");
	cellaCheckBox.innerHTML = "<input type=\"checkbox\" class = \"lavoro\"/>";
	
	
	var cellaTitolo = riga.insertCell(1);
	
	cellaTitolo.setAttribute('data-title', "Title");
	cellaTitolo.setAttribute('class', "titoloLavoro");
	cellaTitolo.textContent = lav.title;
	
	var cellaDescrizione = riga.insertCell(2);
	cellaDescrizione.textContent = lav.description;
	
	var cellaRequisiti = riga.insertCell(3);
	cellaRequisiti.textContent = lav.requirements;
	

	var cellaObbligatori = riga.insertCell(4);
	for(let i = 0; i <= lav.obligatory.length; ++i) {
		if(i == lav.obligatory.length)
			cellaObbligatori.innerHTML += "<div></div>";
		else
			cellaObbligatori.innerHTML += lav.obligatory[i].name + ": " + lav.obligatory[i].value1 + " - " + lav.obligatory[i].value2 + "<br /><br />";
	}
	
	let check = "<input type=\"checkbox\" id = \"lavoroCheckBox\" value = \"true\"/>";
	let immagine = "si";
	if(!lav.active) {
		check = "<input type=\"checkbox\" id = \"lavoroCheckBox\" value = \"false\"/>";
		immagine = "no";
	}
		
	
	var cellaAttivo = riga.insertCell(5);
	cellaAttivo.setAttribute('data-title', "Active");
	cellaAttivo.innerHTML = "<br />"
							+ check
							+ "<figure>"
								+ "<img src = \"images/admin/posizioniLavoro/" + immagine +  ".png\">"
							+ "</figure>";
}

function controllaSeFormVuoti(titolo, descrizione, requisiti) {
	
	if(titolo == "" || descrizione == "" || requisiti == "")
		return false;
	
	return true;
}

function pulsanteModifica() {
	
	var checkBox = document.querySelectorAll('tbody input.lavoro:checked');
	
	if (checkBox.length == 1) {
		
		document.getElementById("checkBoxTh").checked = false;

		checkBox[0].checked = false;
		
		if(!aggiungi)
			divForm.style.display = "inline-block";
		
		let titolo = checkBox[0].parentNode.nextElementSibling;
		let descrizione = titolo.nextElementSibling;
		let requisiti = descrizione.nextElementSibling;
		let obbligatori = requisiti.nextElementSibling;
		let attivo = obbligatori.nextElementSibling;
		
		
		obb = new Array();

		for(let j = 0; j < obbligatori.childNodes.length - 3; j += 3) {
			
			let stringa = obbligatori.childNodes[j].nodeValue.replaceAll("\t", "");
			stringa = stringa.replaceAll("\n", "");
			let diviso = stringa.split(': ');
			stringa = diviso[1].split(" - ");
			
			obb.push(new Obbligatorio(0, diviso[0], stringa[0], stringa[1]));
		}
		

		var titoloForm = document.getElementById("titoloForm");
		var descrizioneForm = document.getElementById("descrizioneForm");
		var requisitiForm = document.getElementById("requisitiForm");
		var attivoForm = document.getElementById("checkBoxForm");
		
		titoloForm.value = titolo.innerHTML;
		descrizioneForm.value = descrizione.innerHTML;
		requisitiForm.value = requisiti.innerHTML;
		
		svuotaEliminaSection();
		
		
		for(let i = 0, j = 1; i < obb.length; ++i) {
			

			if(obb[i].name == "Age range") {
				document.getElementById("min").value = obb[i].value1;
				document.getElementById("max").value = obb[i].value2;
			} else {
				if(j == 2)
					++j;
				caricaTitoloStudio();
				document.getElementById("titoloStudio" + j).value = obb[i].value1;
				caricaOpzioni("titoloStudio" + j, "materiaStudio" + j);
				document.getElementById("materiaStudio" + j).value = obb[i].value2;
				 ++j;
			}
		}
		
		attivoForm.checked = false;
		if(attivo.childNodes[1].value == "true")
			attivoForm.checked = true;
			
		
	} else
		alert("You have to select only one element!");
	
}


function pulsanteCancella() {
	btnCancella.addEventListener("click", function(){
		var selectedCheckBoxes = document.querySelectorAll("tbody input.lavoro:checked");
		
		if (selectedCheckBoxes.length > 0){
			if(confirm("Are you sure you want to delete?")) {
				selectedCheckBoxes.forEach(function(checkBox, indice){
					
					document.getElementById("checkBoxTh").checked = false;
					

					checkBox.checked = false;
					

					checkBox.parentNode.parentNode.remove();
						
					var title = checkBox.parentNode.nextElementSibling;
					
					$.ajax({
						type: "POST",
						url: "/eliminaLavoro",
						data: {
							titolo: title.innerHTML
						},
						success: function(){
//							alert("tutto ok");
						},
						error: function(xhr){
							alert("tutto male");
						}
					});
						
				});
				
				$("#checkBoxTh").prop("checked", false);
				
			}
			
		} else
			alert("Select at least one element!");
		
	});
}

function textAreaAdjust(element) {
  element.style.height = "1px";
  element.style.height = (25+element.scrollHeight)+"px";
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
	
function popolaMinAge() {
	var min = document.getElementById("min");
	
	for(let i = 18; i < 100; ++i) {
		let opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		min.appendChild(opt);	
	}
	
	caricaOpzioniAge();
}

function caricaOpzioniAge() {
	var max = document.getElementById("max");
	max.innerHTML = "";
	
	var min = document.getElementById("min");
	
	for(let i = parseInt(min.value) + 1; i <= 100; ++i) {
		let opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		max.appendChild(opt);	
	}	
	
	max.options.selectedIndex = max.options.length-1
}

function svuotaEliminaSection() {

	while(ind > 1) {
		--ind;
		
		if(ind != 2)
			eliminaTitoloStudio(ind); 
			
	}
}

var ind = 1;

function caricaTitoloStudio() {

	var precInd = ind - 1;
	if(precInd == 2)
		--precInd; 

	var titolo = document.getElementById("titoloStudio" + precInd);
	
	if(titolo != null && titolo.value == " -- select an option -- ")
		return;
	
	var div = document.getElementById("requisitoTitoloStudio");
	
	var titolo = "titoloStudio" + ind;
	var materia = "materiaStudio" + ind;
	
	div.childNodes[ind].innerHTML = "<div class = \"row\" id = \"" + ind + "\">"
					+ "<div class=\"col-2\">"
						+ "<a class = \"piuMeno\" href = \"javascript:eliminaTitoloStudio(" + ind + ")\">"
							+ "<img src = \"../images/admin/posizioniLavoro/meno.png\">"
						+ "</a>"
					+ "</div>"
	 				+ "<div class=\"col-5\">"
						+ "<label for=\"titoloStudio\">Study title</label>"
						+ "<br />"
						+ "<select class = \"studio\" name=\"titoloStudio\" onchange = \"caricaOpzioni('" + titolo + "', '" + materia + "')\" id = \"" + titolo + "\"></select>"
					+ "</div>"
					+ "<div class=\"col-5\">"
						+ "<label for=\"materiaStudio\">Study subject</label>"
						+ "<br />"
						+ "<select class = \"studio\" name=\"materiaStudio\" id = \"" + materia + "\"></select>"
					+ "</div>"
				+ "</div>";
				
	popolaVisualizzaPosizioniLavoro(titolo);		
	
	var creaNodo = document.createElement('div');
	creaNodo.className = 'row';

	if(ind == 1)
		++ind;
	++ind;
	
	div.appendChild(creaNodo);
	
	div.childNodes[ind].innerHTML = "<div class = \"row\" id = \"" + ind + "\">"
						+ "<div class=\"col-2\">"
							+ "<a class = \"piuMeno\" href = \"javascript:caricaTitoloStudio()\">"
								+ "<img src = \"../images/admin/posizioniLavoro/piu.png\">"
							+ "</a>"
						+ "</div>"
					+ "</div>";
	
}

function eliminaTitoloStudio(ind) {
	var div = document.getElementById(ind);
	
	if(ind == 0)
		div.innerHTML = "<div class=\"col-2\">"
							+ "<a class = \"piuMeno\" href = \"javascript:caricaTitoloStudio()\">"
								+ "<img src = \"../images/admin/posizioniLavoro/piu.png\">"
							+ "</a>"
						+ "</div>";
	else
		div.innerHTML = ""
}
