package techPlanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Chooses;

@RestController
public class CartREST {

	@PostMapping("/getTotal")
	public void getTotal(@RequestBody Long price, HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.setAttribute("total", price);	
	}
	
	@PostMapping("/ToEmptyCart")
	public void ToEmptyCart(HttpServletRequest req) {
		String username = (String) req.getSession().getAttribute("username");
		List<Chooses> chooses = Database.getInstance().getChoosesDao().findByUser(username);
		Database.getInstance().getChoosesDao().addProductToMyOrder(chooses);
		Database.getInstance().getChoosesDao().toEmptyCart(username);
	}
}
