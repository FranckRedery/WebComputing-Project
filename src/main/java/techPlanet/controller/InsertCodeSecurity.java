package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InsertCodeSecurity {

	
	@GetMapping("/insertNewEmail.html")
	public String insertNewEmail() {
		return "insertNewEmail";
	}
	
}
