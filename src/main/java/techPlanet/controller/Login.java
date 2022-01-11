package techPlanet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Login {

	@GetMapping("/signUp.html")
	public String signUp(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "signUp";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "index";
				else
					return "signUp";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "index";
				else
					return "index";
			}
		}
	}
	
}
