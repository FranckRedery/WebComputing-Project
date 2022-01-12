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
public class UserController {
		
	@GetMapping("/itemReturn")
	public String itemReturn(HttpServletRequest req) {
		showNumberProd(req);
		return "itemReturn";
	}

	@GetMapping("/userReturns")
	public String userReturns(HttpServletRequest req) {
		showNumberProd(req);
		String username = (String) req.getSession().getAttribute("username");
		List<ReturnRequest> returns = Database.getInstance().getReturnRequestDao().findByUser(username);
		HttpSession session = req.getSession(true);
		session.setAttribute("returns", returns);
		return "userReturns";
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
