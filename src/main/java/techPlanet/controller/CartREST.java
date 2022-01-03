package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CartREST {

	@PostMapping("/getTotal")
	public void getTotal(@RequestBody Long price, HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		System.out.println(price);
		session.setAttribute("total", price);	
	}
}
