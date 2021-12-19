package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Security {

	@GetMapping("/control.html")
	public String control() {
		return "control";
	}
	
}
