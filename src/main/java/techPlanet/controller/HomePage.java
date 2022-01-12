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
import techPlanet.model.Wishes;

@Controller
public class HomePage {

	@GetMapping("/")
	public String homePage(HttpServletRequest req) {
		showNumberProd(req);
		String username = (String) req.getSession().getAttribute("username");
		List<Product> product = Database.getInstance().getProductsDao().findByLastNineInserted();
		List<Wishes> wishes = Database.getInstance().getWishesDao().findByUser(username);
		req.setAttribute("wishes", wishes);
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
			showNumberProd(req);
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
	public String accountPage(HttpServletRequest req) {
		showNumberProd(req);
		return "account";
	}

	@GetMapping("/notebooksGallery.html")
	public String notebooksGalleryPage(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("laptop");
		req.setAttribute("products", products);
		req.getSession().removeAttribute("notFound");
		return "productGallery";
	}
	
	@GetMapping("/notebooksGallerySearch.html")
	public String notebooksGalleryPageSearch(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("laptop");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/smartphonesGallery.html")
	public String smartphonesGalleryPage(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("smartphone");
		req.setAttribute("products", products);
		req.getSession().removeAttribute("notFound");
		return "productGallery";
	}
	
	@GetMapping("/smartphonesGallerySearch.html")
	public String smartphonesGalleryPageSearch(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("smartphone");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/printersGallery.html")
	public String printersGalleryPage(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("printer");
		req.setAttribute("products", products);
		req.getSession().removeAttribute("notFound");
		return "productGallery";
	}
	
	@GetMapping("/printersGallerySearch.html")
	public String printersGalleryPageSearch(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("printer");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/camerasGallery.html")
	public String camerasGalleryPage(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("camera");
		req.setAttribute("products", products);
		req.getSession().removeAttribute("notFound");
		return "productGallery";
	}
	
	@GetMapping("/camerasGallerySearch.html")
	public String camerasGalleryPageSearch(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("camera");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/accessoriesGallery.html")
	public String accessoriesGalleryPage(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("accessory");
		req.setAttribute("products", products);
		req.getSession().removeAttribute("notFound");
		return "productGallery";
	}
	
	@GetMapping("/accessoriesGallerySearch.html")
	public String accessoriesGalleryPageSearch(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findByCategory("accessory");
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/allProductGallery.html")
	public String allProductGallery(HttpServletRequest req) {
		showNumberProd(req);
		List<Product> products = Database.getInstance().getProductsDao().findAll();
		req.setAttribute("products", products);
		return "productGallery";
	}
	
	@GetMapping("/login.html")
	public String login() {
		return "login";
	}

	@GetMapping("/product")
	public String ProductDetailsPage(HttpServletRequest req) {
		showNumberProd(req);
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
	
	@GetMapping("/wishList.html")
	public String wishListPage(HttpServletRequest req) {
		if (req.getSession().getAttribute("username") != null) {
			showNumberProd(req);
			String username = (String) req.getSession().getAttribute("username");
			List<Wishes> wishes = Database.getInstance().getWishesDao().findByUser(username);
			req.setAttribute("wishes", wishes);
			return "wishList";
		}
		else 
			return "login";

	}

	public void showNumberProd(HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			int numProdUser = Database.getInstance().getChoosesDao().getNumProdForUser(username);
			int numWishesUser = Database.getInstance().getWishesDao().getNumProdForUser(username);
			if (numProdUser > 0)
				req.setAttribute("numProd", numProdUser);
			if (numWishesUser > 0)
				req.setAttribute("numWishList", numWishesUser);
		}
	}
}
