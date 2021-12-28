package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;

@RestController
public class HomePageREST {

	@PostMapping("/addProductToCart") 
	public void addProdToCart(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getProductsDao().addProductToCart(id, username);
	}
}
