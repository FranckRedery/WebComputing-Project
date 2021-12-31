package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@PostMapping("/viewCounterProdCart")
	public void viewProdCart(HttpServletRequest req, HttpServletResponse res) {
		String username = (String) req.getSession().getAttribute("username");
		int numProdUser = 0;
		if (username != null) {
			numProdUser = Database.getInstance().getProductsDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
		HttpSession session = req.getSession(false);
		session.setAttribute("numProd", numProdUser);
	}
}
