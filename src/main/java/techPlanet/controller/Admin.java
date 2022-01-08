package techPlanet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import techPlanet.Database;
import techPlanet.model.Job;
import techPlanet.model.Report;
import techPlanet.model.ReturnRequest;


@Controller
public class Admin {
	
	@GetMapping("/adminPage")
	public String adminPage() {
		return "adminPage";
	}
	
	
	@GetMapping("/deleteProd")
	public String deleteProd(){
		return "deleteProd";
	}
	
	@GetMapping("/addAdmin")
	public String addAdmin() {
		return "addAdmin";
	}
	
	@GetMapping("/modifyProd")
	public String modifyProd(){
		return "modifyProd";
	}
	
	@GetMapping("/returnRequests")
	public String returnRequests(HttpServletRequest req) {
		
		List<ReturnRequest> returns = Database.getInstance().getReturnRequestDao().findByStatusPending();
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
		
		List<Report> reports = Database.getInstance().getReportDao().findAll();
		
		HttpSession session = req.getSession(true);
		session.setAttribute("report", reports);
		
		return "visualizzaReports";
	}
	
	@GetMapping("/visualizzaPosizioniLavoro")
	public String visualizzaPosizioniLavoro(HttpServletRequest req) {
		
		List<Job> jobs = Database.getInstance().getJobDao().findAll();
		
		HttpSession session = req.getSession(true);
		session.setAttribute("lavori", jobs);
		
		return "posizioniLavoro";
	}
	
	@GetMapping("/visualizzaCurriculum")
	public String visualizzaCurriculum(HttpServletRequest req) {

		List<Job> job = Database.getInstance().getJobDao().findAll();

		HttpSession session = req.getSession(true);
		session.setAttribute("lavori", job);

		return "visualizzaCV";
	}
	
}
