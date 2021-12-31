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
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			int numProdUser = Database.getInstance().getProductsDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
		List<Product> product = Database.getInstance().getProductsDao().findByLastNineInserted();
		req.setAttribute("prodotti", product);
		return "index";
	}

	@GetMapping("/cart.html")
	public String cartPage(HttpServletRequest req) {
		if (req.getSession().getAttribute("username") != null) {
			String username = (String) req.getSession().getAttribute("username");
			List<Product> product = Database.getInstance().getProductsDao()
					.findByUser(username);
			req.setAttribute("prodotti", product);
			return "cart";
		}
		else 
			return "login";
	}

	@GetMapping("/account.html")
	public String accountPage() {
		return "account";
	}

	@GetMapping("/laptopsGallery.html")
	public String LaptopsGalleryPage(HttpServletRequest req) {
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("laptop");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/smartphonesGallery.html")
	public String SmartphonesGalleryPage(HttpServletRequest req) {
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("smartphone");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/printersGallery.html")
	public String PrintersGalleryPage(HttpServletRequest req) {
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("printers");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/login.html")
	public String login() {
		return "login";
	}

	@GetMapping("/product")
	public String ProductDetailsPage(HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			int numProdUser = Database.getInstance().getProductsDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
		return "product";
	}

}
