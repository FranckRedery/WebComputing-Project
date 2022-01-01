package techPlanet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import techPlanet.Database;

@Controller
//MVC
public class SignUp {
	
	public SignUp() {}
	
	@PostMapping("/SignUpServices")
	public String faiSignUp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return Database.getInstance().getSignUp().faiSignUp(req, resp);
	}
	
	@PostMapping("/activeError")
	public String activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		Database.getInstance().getLogin().activeError(req, resp);
		return null;
	}
}

