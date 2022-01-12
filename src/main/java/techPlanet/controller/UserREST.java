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
	public void addNewProduct(HttpServletRequest req) {
		
		String quantity = req.getParameter("quantity");
		String idProd = req.getParameter("id");
		
		int qty = Integer.parseInt(quantity);
		int id = Integer.parseInt(idProd);
		
		Product returnProd = Database.getInstance().getProductsDao().findById(id);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("returnProd", returnProd);
		session.setAttribute("qty", qty);
	}
	
	@PostMapping("/addRequest")
	public void addRequest(@RequestBody ReturnRequest request, HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		
		User user = Database.getInstance().getUserDao().findByPrimaryKey(username);
		request.setUser(user);
		
		Product prod = Database.getInstance().getProductsDao().findById(request.getProduct().getId());
		request.setProduct(prod);
		
		String dateInString =new SimpleDateFormat(pattern).format(new Date());
		request.setDate(dateInString);
		
		Database.getInstance().getReturnRequestDao().addRequest(request);
		Database.getInstance().getMyOrderDao().setReturned(true,request.getProduct().getId());
		
	}
	
}
