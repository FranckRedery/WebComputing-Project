package techPlanet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import techPlanet.Database;

@Controller
//MVC
public class LoginSpringBoot {
	
	@GetMapping("/faiLogout")
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getLogin().logout(req, resp);
	}
	
	@GetMapping("/logoutG")
	public void logoutG(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getLogin().logoutG(req, resp);
	}
	
	
	@GetMapping("/resetError")
	public void resetError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getLogin().resetError(req, resp);
	}
	
	@GetMapping("/activeError")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getLogin().activeError(req, resp);
	}
	
	@PostMapping("/loginServices")
	public String faiLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return Database.getInstance().getLogin().faiLogin(req, resp);
	}

}
