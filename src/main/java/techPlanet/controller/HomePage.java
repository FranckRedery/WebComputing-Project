package techPlanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import techPlanet.Database;
import techPlanet.model.Chooses;
import techPlanet.model.Product;
import techPlanet.model.Review;

@Controller
public class HomePage {

	@GetMapping("/")
	public String homePage(HttpServletRequest req) {
		setNumberCart(req);
		List<Product> product = Database.getInstance().getProductsDao().findByLastNineInserted();
		req.setAttribute("prodotti", product);
		return "index";
	}
	
	@GetMapping("/privacyPolicy")
	public String privacyPolicy() {
		return "privacyPolicy";
	}
	
	@GetMapping("/termsAndConditions")
	public String termsAndConditions() {
		return "termsAndConditions";
	}

	@GetMapping("/cart.html")
	public String cartPage(HttpServletRequest req) {
		if (req.getSession().getAttribute("username") != null) {
			String username = (String) req.getSession().getAttribute("username");
			List<Chooses> chooses = Database.getInstance().getChoosesDao()
					.findByUser(username);
			req.setAttribute("chooses", chooses);
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
		setNumberCart(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("laptop");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/smartphonesGallery.html")
	public String SmartphonesGalleryPage(HttpServletRequest req) {
		setNumberCart(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("smartphone");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/printersGallery.html")
	public String PrintersGalleryPage(HttpServletRequest req) {
		setNumberCart(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("printer");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/camerasGallery.html")
	public String camerasGalleryPage(HttpServletRequest req) {
		setNumberCart(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("camera");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/accessoriesGallery.html")
	public String AccessoriesGalleryPage(HttpServletRequest req) {
		setNumberCart(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("accessory");
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
			int numProdUser = Database.getInstance().getChoosesDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
		return "product";
	}
	
	@GetMapping("/viewProduct")
	public String guidaProdotto(HttpServletRequest req) {
		
		Long id = Long.parseLong(req.getParameter("id"));
		
		Product prodotto = Database.getInstance().getProductsDao().findById(id);
//		List<Review> review = Database.getInstance().getReviewDao().findByProduct(id);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("product", prodotto);
//		session.setAttribute("review", review);

		return "product";
	}	
	
	@GetMapping("/contactUs")
	public String contattaci() {
		return "contattaci";
	}
	
	@GetMapping("/customerSupport")
	public String supportoClienti() {
		return "supportoClienti";
	}

	public void setNumberCart(HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			int numProdUser = Database.getInstance().getChoosesDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
		}
	}
}
