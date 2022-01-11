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
import techPlanet.model.Chooses;
import techPlanet.model.Product;
import techPlanet.model.Review;
import techPlanet.model.Wishes;

@RestController
public class ProductREST {
	
	@PostMapping("/addProductToCart") 
	public void addProdToCart(@RequestBody Chooses chooses, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getChoosesDao().saveOrUpdateProdInCart(chooses, username);
	}
	
	@PostMapping("/addProductToWishList")
	public void addProdToWishList(@RequestBody Wishes wishes, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getWishesDao().addToWishList(wishes, username);
	}
	
	@PostMapping("/quantityBasedAddition") 
	public void addProdToCartBasedQuantity(@RequestBody Chooses chooses, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getChoosesDao().quantityBasedAddition(chooses, username);
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
			numProdUser = Database.getInstance().getChoosesDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
		HttpSession session = req.getSession(false);
		session.setAttribute("numProd", numProdUser);
	}
	
	@PostMapping("/removeProductFromCart")
	public void removeProdFromCart(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getChoosesDao().removeProductFromCart(id, username);
	}
	
	@PostMapping("/removeProductFromWishList")
	public void removeProdFromWishList(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getWishesDao().removeProductFromWishList(id, username);
	}
	
	@PostMapping("/updateQuantity")
	public void updateQuantity(@RequestBody Chooses chooses, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getChoosesDao().updateQuantity(chooses, username);
	}
	
	@PostMapping("/removeReview") 
	public void removeReview(@RequestBody Long id, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getReviewDao().removeReview(id, username);
		List<Review> review = Database.getInstance().getReviewDao().findByProduct(id);
		HttpSession session = req.getSession(true);
		session.setAttribute("review", review);
	}
}
