package techPlanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import techPlanet.Database;
import techPlanet.model.Report;
import techPlanet.model.ReturnRequest;


@Controller
public class User {

		
	@GetMapping("/itemReturn")
	public String itemReturn() {
		return "itemReturn";
	}
		

	@GetMapping("/userReturns")
	public String userReturns(HttpServletRequest req) {
		
		String username = (String) req.getSession().getAttribute("username");
		List<ReturnRequest> returns = Database.getInstance().getReturnRequest().findByUser(username);
		HttpSession session = req.getSession(true);
		session.setAttribute("returns", returns);
		
		return "userReturns";
	}

}

