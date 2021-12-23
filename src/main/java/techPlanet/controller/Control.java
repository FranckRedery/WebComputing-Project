package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import techPlanet.Database;

@Controller
public class Control {

	@GetMapping("/InsertCodeSecurity.html")
	public String codeSecurity() {
		return "InsertCodeSecurity";
	}
	
	@GetMapping("/setMailCode")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("bu");
		Database.getInstance().getControl().controlEmailCode(req, resp);
	}
	
}
