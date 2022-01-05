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
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	@GetMapping("/logoutG")
	public void logoutG(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.invalidate();
	}
	
	
	@GetMapping("/resetError")
	public void resetError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	@GetMapping("/activeError")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("errore", "si");
		resp.sendRedirect("/");
	}
	
	@PostMapping("/loginServices")
	@ResponseBody
	public String loginServices(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return Database.getInstance().getLogin().loginServices(req, resp);
	}

}
