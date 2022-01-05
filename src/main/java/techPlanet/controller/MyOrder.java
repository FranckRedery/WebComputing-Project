package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyOrder {

	@GetMapping("review_purchase.html")
	public String reviewPurchasePage() {
		return "review_purchase";
	}
}
