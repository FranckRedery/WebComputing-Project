package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Account {

	
	@GetMapping("/account")
	public String account() {
		return "account";
	}
	
	@GetMapping("/editProfile.html")
	public String editProfile() {
		return "editProfile";
	}
	
	@GetMapping("/security.html")
	public String security() {
		return "security";
	}
	
	@GetMapping("/index.html")
	public String index() {
		return "index";
	}
	
	@GetMapping("/aboutUs.html")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@GetMapping("/signUpCorrect.html")
	public String signUpCorrect() {
		return "signUpCorrect";
	}
	
}
