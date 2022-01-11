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

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import techPlanet.Database;

@Controller
//MVC
public class SignUp {
	
	public SignUp() {}
	
	@PostMapping("/SignUpServices")
	@ResponseBody
	public String faiSignUp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	    return Database.getInstance().getSignUp().faiSignUp(req, resp);
	}
	
	@PostMapping("/activeError")
	public String activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("errore", "si");
		resp.sendRedirect("/");
		return null;
	}
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
	    return new BCryptPasswordEncoder();
	}
	
}

