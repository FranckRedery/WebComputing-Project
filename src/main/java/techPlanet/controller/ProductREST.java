package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Product;

@RestController
public class ProductREST {
	
	@PostMapping("/addProductToCart") 
	public void addProdToCart(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getProductsDao().addProductToCart(id, username);
	}
	
	@PostMapping("/viewDetailsProdPage") 
	public Product viewProdPage(@RequestBody Long id, HttpServletRequest req) {
		Product product = Database.getInstance().getProductsDao().findById(id);

		HttpSession session = req.getSession(true);
		session.setAttribute("product", product);
		
		return product;
	}
}
