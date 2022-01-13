package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.MyOrder;
import techPlanet.model.Product;
import techPlanet.model.Review;

@RestController
public class MyOrderREST {
	
	@PostMapping("/publicReview")
	public void publicReviewPage(@RequestBody Long id,HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Product product = Database.getInstance().getProductsDao().findById(id);
		MyOrder order = Database.getInstance().getMyOrderDao().findOrder(id, username);
		HttpSession session = req.getSession(true);
		session.setAttribute("product", product);	
		session.setAttribute("order", order);
	}
	
	@PostMapping("/addReview") 
	public void addReview(@RequestBody Review review, HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		Database.getInstance().getReviewDao().saveOrUpdate(review, username);
		Database.getInstance().getMyOrderDao().setReviewed(true,review.getId().getId());
	}
	
}
