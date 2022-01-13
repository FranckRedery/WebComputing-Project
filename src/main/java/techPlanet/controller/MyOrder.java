package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import techPlanet.Database;

@Controller
public class MyOrder {

	@GetMapping("review_purchase.html")
	public String reviewPurchasePage(HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			int numProdUser = Database.getInstance().getChoosesDao().getNumProdForUser(username);
			int numWishesUser = Database.getInstance().getWishesDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
			if (numWishesUser > 0)
				req.setAttribute("numWishList", numWishesUser);
		}
		return "review_purchase";
	}
}
