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
	public String adminPage(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "adminPage";
	}
	
	
	@GetMapping("/deleteProd")
	public String deleteProd(HttpServletRequest req){
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "deleteProd";
	}
	
	@GetMapping("/addAdmin")
	public String addAdmin(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "addAdmin";
	}
	
	@GetMapping("/deleteAdmin")
	public String deleteAdmin(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "deleteAdmin";
		
	}
	
	@GetMapping("/modifyProd")
	public String modifyProd(HttpServletRequest req){
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "modifyProd";
	}
	
	@GetMapping("/returnRequests")
	public String returnRequests(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		
		List<ReturnRequest> returns = Database.getInstance().getReturnRequestDao().findByStatusPending();
		session.setAttribute("returns", returns);
		return "returnRequests";
	}
	
	@GetMapping("/addProduct")
	public String addProduct(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		return "addProduct";
	}
	
	@GetMapping("/viewReports")
	public String visualizzaReports(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		
		List<Report> reports = Database.getInstance().getReportDao().findAll();
		session.setAttribute("report", reports);
		
		return "visualizzaReports";
	}
	
	@GetMapping("/viewJobs")
	public String visualizzaPosizioniLavoro(HttpServletRequest req) {
		
		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		
		List<Job> jobs = Database.getInstance().getJobDao().findAll();
		session.setAttribute("lavori", jobs);
		
		return "posizioniLavoro";
	}
	
	@GetMapping("/viewCurriculum")
	public String visualizzaCurriculum(HttpServletRequest req) {

		HttpSession session = req.getSession(true);
		if(!Database.getInstance().getUserDao().findByPrimaryKey((String) session.getAttribute("username")).isIsadmin()) {
			return "index";
		}
		List<Job> job = Database.getInstance().getJobDao().findAll();

		session.setAttribute("lavori", job);

		return "visualizzaCV";
	}
	
}
