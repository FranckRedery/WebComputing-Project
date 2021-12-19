package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Control {

	@GetMapping("/insertCodeSecurity.html")
	public String codeSecurity() {
		return "insertCodeSecurity";
	}
	
}
