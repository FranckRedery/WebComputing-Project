package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class User {

		
	@GetMapping("/itemReturn")
	public String itemReturn() {
		return "itemReturn";
	}
		
	@GetMapping("/userReturns")
	public String userReturns() {
		return "userReturns";
	}

}

