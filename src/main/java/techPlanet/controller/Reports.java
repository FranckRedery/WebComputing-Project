package techPlanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import techPlanet.Database;
import techPlanet.model.Report;

@Controller
public class Reports {
	
	@PostMapping("/salvaReportHelp")
	public String salvaReportAssistenza(String origin, String description) {
		
		Database.getInstance().getReportDao().saveOrUpdate(new Report(origin, description));
		return "index";
	}
}
