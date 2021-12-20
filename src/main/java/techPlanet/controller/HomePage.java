package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePage {
	
	@GetMapping("/")
	public String homePage() {
		return "index";
	}
	
	@GetMapping("/cart.html")
	public String cartPage() {
		return "cart";
	}

	@GetMapping("/account.html")
	public String accountPage() {
		return "account";
	}
	
	@GetMapping("/login.html")
	public String login() {
		return "login";
	}
	
	@GetMapping("/productDetails.html")
	public String ProductDetailsPage() {
		return "product";
	}
	
	
}
