package techPlanet.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Product;
import techPlanet.model.ReturnRequest;
import techPlanet.model.User;

@RestController
public class UserREST {

	private String pattern = "dd-MM-yyyy";
	
	//addReturnRequest
	@PostMapping("/addReturnRequest")
	public void addNewProduct(@RequestBody Long id, HttpServletRequest req) {
		
		Product returnProd = Database.getInstance().getProductsDao().findById(id);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("returnProd", returnProd);
		
	}
	
	@PostMapping("/addRequest")
	public void addRequest(@RequestBody ReturnRequest request, HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		
		User user = new User();
		user.setUsername(username);
		request.setUser(user);

		
		String dateInString =new SimpleDateFormat(pattern).format(new Date());
		request.setDate(dateInString);
		
		Database.getInstance().getReturnRequestDao().addRequest(request);
		Database.getInstance().getMyOrderDao().setReturned(true,request.getProduct().getId());
		
		
	}
	
}
