package techPlanet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String username = (String) req.getSession().getAttribute("username");
		List<MyOrder> orders = Database.getInstance().getMyOrderDao().findByUser(username);
		req.setAttribute("orders", orders);
		return "myOrder";
	}
	
	@GetMapping("/account")
	public String account() {
		return "account";
	}
	
	@GetMapping("/editProfile.html")
	public String editProfile() {
		return "editProfile";
	}
	
	@GetMapping("/security.html")
	public String security() {
		return "security";
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
	public String signUpCorrect() {
		return "signUpCorrect";
	}
	
	
}
