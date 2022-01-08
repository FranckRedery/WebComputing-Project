package techPlanet.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import techPlanet.Database;
import techPlanet.model.Curriculum;
import techPlanet.model.GestisciCartelle;
import techPlanet.model.User;

@Controller
@RequestMapping("/workWithUs")
public class LavoraConNoi {
	
	@GetMapping("/workInCompany")
	public String lavoraInAzienda() {		
		return "lavoraInAzienda";	
	}
	
	@GetMapping("/curriculum")
	public String curriculum() {		
		return "curriculum";	
	}
	
	@GetMapping("/curriculumSpontaneous")
	public String curriculumSpontaneo(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.setAttribute("posizioneLavoro", null);
		return "curriculum";	
	}
	
	@PostMapping("/loginCurriculum")
	public String faiLogin(HttpServletRequest req, HttpServletResponse resp, String username, String pass) throws IOException {
		
		if(Database.getInstance().getLogin().faiLoginCurriculum(username, pass)) {
			User utente = Database.getInstance().getUserDao().findByPrimaryKey(username);
			
			HttpSession session = req.getSession(true);
			session.setAttribute("user", utente);
		}
		
		return "curriculum";
	}
	
	@PostMapping("/saveCurriculum")
	public String salvaPresentazione(HttpServletRequest req, HttpServletResponse res, MultipartFile foto, MultipartFile cv) {

/*		
		System.out.println(req.getParameter("lavoro") + " " + req.getParameter("nome") + " " + req.getParameter("cognome") + " " + req.getParameter("dataNascita") + " " + req.getParameter("email") + " " + req.getParameter("titoloStudio") + " " + req.getParameter("materiaStudio") + " " 
			+ req.getParameter("classificazioneLavoro") + " " + req.getParameter("funzioneLavoro") + " " + foto.getOriginalFilename() + " " 
				+ cv.getOriginalFilename() + " " + req.getParameter("letteraPresentazione")letteraPresentazione);
*/		
		
		String lavoro = req.getParameter("lavoro");
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String dataNascita = req.getParameter("dataNascita");
		
		try {
			
			Curriculum curriculum = new Curriculum(Database.getInstance().getJobDao().findByPrimaryKey(lavoro), nome, cognome, dataNascita,
					req.getParameter("email"), req.getParameter("titoloStudio"), req.getParameter("materiaStudio"), req.getParameter("funzioneLavoro"), req.getParameter("classificazioneLavoro"), 
					"curriculumRicevuti/" + lavoro + "/" + cognome + "_" + nome + "_" + dataNascita + "/" + foto.getOriginalFilename(), 
					"curriculumRicevuti/" + lavoro + "/" + cognome + "_" + nome + "_" + dataNascita + "/" + cv.getOriginalFilename(), 
					req.getParameter("letteraPresentazione"), req.getParameter("phone"));
			
			Long id = Database.getInstance().getCurriculumDao().checkEsisteCurriculum(curriculum);
			
			curriculum.setId(id);
			
			Database.getInstance().getCurriculumDao().saveOrUpdate(curriculum);

			if(id != 0)
				GestisciCartelle.eliminaCartella("curriculumRicevuti/" + lavoro, cognome + "_" + nome + "_" + dataNascita);
			
			
			String percorso = GestisciCartelle.scriviCartella("curriculumRicevuti/" + lavoro, cognome + "_" + nome + "_" + dataNascita);
			foto.transferTo(new File(percorso + "/" + foto.getOriginalFilename()));
			cv.transferTo(new File(percorso + "/" + cv.getOriginalFilename()));
			
			res.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}