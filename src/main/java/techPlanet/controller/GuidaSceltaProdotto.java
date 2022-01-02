package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guidaSceltaProdotto")
public class GuidaSceltaProdotto {

	@GetMapping("/guidaSceltaProdotto")
	public String guidaProdotto(HttpServletRequest req) {
		return "guidaSceltaProdotto";
	}

}