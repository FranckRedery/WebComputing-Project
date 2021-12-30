package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Product;
import techPlanet.model.Report;
import techPlanet.model.ReturnRequest;

@RestController
public class AdminREST {

	@PostMapping("/eliminaReport")
	public void eliminaReport(@RequestParam String id) {
		
		Report report = Database.getInstance().getReport().findById(Long.parseLong(id));
		
		Database.getInstance().getReport().delete(report);
	}
	
	
	
	@PostMapping("/updateRequest")
	public void updateRequest(@RequestBody ReturnRequest returnRequest) {
		Database.getInstance().getReturnRequestDao().update(returnRequest);
	}
	
	@PostMapping("/addNewProduct")
	public void addNewProduct(@RequestBody Product product) {
		Database.getInstance().getProductsDao().addProduct(product);
	}
	
	@PostMapping("/getProdByName")
	public Product getProdByName(@RequestBody String name, HttpServletRequest req) {
		
		
		Product product = Database.getInstance().getProductsDao().findByName(name);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("product", product);

		
		return product;
		
	}

	@PostMapping("/deleteProdById")
	public void deleteProdById(@RequestBody Long id, HttpServletRequest req) {
		if(Database.getInstance().getProductsDao().deleteProductById(id)) {
			req.getSession().removeAttribute("product");
		}
	}
	
}
