package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import techPlanet.Database;
import techPlanet.model.User;

@Controller
@RequestMapping("/lavoraConNoi")
public class LavoraConNoi {
	
	@GetMapping("/lavoraInAzienda")
	public String lavoraInAzienda() {		
		return "lavoraInAzienda";	
	}
	
	@GetMapping("/curriculum")
	public String curriculum() {		
		return "curriculum";	
	}
	
	@GetMapping("/curriculumSpontaneo")
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
	
}