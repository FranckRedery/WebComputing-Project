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
	
	private Connection conn;
	
	public SignUp(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public SignUp() {}
	
	@PostMapping("/SignUpServices")
	public String faiSignUp(HttpServletRequest req, HttpServletResponse resp, String username ,String email, String password) throws IOException {
		
		Database.getInstance().getSignUp().faiSignUp(req, resp, username, email, password);
		
		return null;
	}
	
}

