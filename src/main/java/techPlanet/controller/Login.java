package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login {

	@GetMapping("/signUp.html")
	public String signUp() {
		return "signUp";
	}
	
}
