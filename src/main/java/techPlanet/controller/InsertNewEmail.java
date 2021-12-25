package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InsertNewEmail {

	@GetMapping("/account.htmls")
	public String account() {
		return "account.html";
	}
}
