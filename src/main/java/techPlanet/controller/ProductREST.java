package techPlanet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.boot.sql.init.DatabaseInitializationSettings;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Product;
import techPlanet.model.Review;

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
		List<Review> review = Database.getInstance().getReviewDao().findByProduct(id);
		HttpSession session = req.getSession(true);
		session.setAttribute("product", product);
		session.setAttribute("review", review);
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
	
	@PostMapping("/removeProductFromCart")
	public void removeProdFromCart(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getProductsDao().removeProductFromCart(id, username);
	}
}
