package techPlanet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import techPlanet.Database;
import techPlanet.model.MyOrder;

@Controller
public class Account {

	@GetMapping("/myOrder.html")
	public String myOrderPage(HttpServletRequest req) {
		showNumberProd(req);
		String username = (String) req.getSession().getAttribute("username");
		List<MyOrder> orders = Database.getInstance().getMyOrderDao().findByUser(username);
		req.setAttribute("orders", orders);
		return "myOrder";
	}
	
	@GetMapping("/account")
	public String account(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") != null) {
			if(session.getAttribute("loggato").equals("si"))
				return "account";
			else 
				return "index";
		}
		else {
			return "index";
		}
	}
	
	@GetMapping("/editProfile.html")
	public String editProfile(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") != null) {
			if(session.getAttribute("loggato").equals("si")) {
				showNumberProd(req);
				return "editProfile";
			}
			else 
				return "index";
		}
		else {
			return "index";
		}
	}
	
	@GetMapping("/security.html")
	public String security(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si")) {
					showNumberProd(req);
					return "security";
				}
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "security";
			}
		}
	}
	
	@GetMapping("/index.html")
	public String index() {
		return "index";
	}
	
	@GetMapping("/aboutUs.html")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@GetMapping("/signUpCorrect.html")
	public String signUpCorrect(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "signUpCorrect";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "index";
				else
					return "signUpCorrect";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "index";
				else
					return "signUpCorrect";
			}
		}
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
