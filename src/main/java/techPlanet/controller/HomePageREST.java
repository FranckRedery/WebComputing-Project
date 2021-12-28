package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import techPlanet.Database;

@Controller
public class HomePageREST {

	@PostMapping("/addProductToCart") 
	public void addProductToCart(HttpServletRequest req, @RequestParam Long id) {
		System.out.println(id);
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getProductsDao().addProductToCart(id, username);
	}
}
