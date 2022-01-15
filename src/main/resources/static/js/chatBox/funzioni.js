indice = nodo1;

function scelta(i) {
	
	if(indice.testo.risposte[i] == "Restart" && indice.discendenti[i] == undefined) {
		
		svuotaTuttaChatBox();
		
		indice = nodo1;
		
	} else {
			
		eliminaDivSceltePossibili();
		
		inserisciRispostaUtenteSelezionata(i);
		
		indice = indice.discendenti[i];
		
	}
	
	caricaTesto();
	
}

function eliminaDivSceltePossibili() {
	
	var sceltePossibili = document.getElementById("sceltePossibili");
	
	sceltePossibili.parentNode.removeChild(sceltePossibili);
}
