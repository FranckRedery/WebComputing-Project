package techPlanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import techPlanet.Database;
import techPlanet.model.Product;

@Controller
public class HomePage {
	
	@GetMapping("/")
	public String homePage(HttpServletRequest req) {
		List<Product> product = Database.getInstance().getProductsDao().findByLastNineInserted();
		req.setAttribute("prodotti", product);
		return "index";
	}
	
	@GetMapping("/cart.html")
	public String cartPage() {
		return "cart";
	}

	@GetMapping("/account.html")
	public String accountPage() {
		return "account";
	}
	
	@GetMapping("/login.html")
	public String login() {
		return "login";
	}
	
	@GetMapping("/productDetails.html")
	public String ProductDetailsPage(HttpServletRequest req) {
		Product product = Database.getInstance().getProductsDao().findById(0);
		req.setAttribute("prodotto", product);
		return "product";
	}
	
}
