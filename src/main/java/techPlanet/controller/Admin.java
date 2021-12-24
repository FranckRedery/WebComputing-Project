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
public class Admin {

	
	@GetMapping("/adminPage")
	public String adminPage() {
		return "adminPage";
	}
	
	@GetMapping("/returnRequests")
	public String returnRequests(HttpServletRequest req) {
		
		List<ReturnRequest> returns = Database.getInstance().getReturnRequest().findByStatusPending();
		HttpSession session = req.getSession(true);
		session.setAttribute("returns", returns);
		
		return "returnRequests";
	}
	
	@GetMapping("/addProduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@GetMapping("/visualizzaReports")
	public String visualizzaReports(HttpServletRequest req) {
		
		List<Report> reports = Database.getInstance().getReport().findAll();
		
		HttpSession session = req.getSession(true);
		session.setAttribute("report", reports);
		
		return "visualizzaReports";
	}
	
}
