package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Cart {

	@GetMapping("/checkout.html")
	public String checkoutPage() {
		return "checkout";
	}
}
