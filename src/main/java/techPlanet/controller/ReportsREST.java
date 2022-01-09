package techPlanet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import techPlanet.Database;
import techPlanet.model.Report;

@RestController
public class ReportsREST {
	
	@PostMapping("/salvaReportHelp")
	public void salvaReportAssistenza(HttpServletRequest req, HttpServletResponse res, String origin, String description) {
		
		Database.getInstance().getReportDao().saveOrUpdate(new Report(origin, description));
/*
		try {
			res.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
*/		
	}
}
