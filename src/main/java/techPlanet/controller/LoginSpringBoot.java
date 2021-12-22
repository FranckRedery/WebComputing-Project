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

import techPlanet.Database;

@Controller
//MVC
public class LoginSpringBoot {
/*	
	@GetMapping("/faiLogout")
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("loggato", "no");
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	@PostMapping("/loginServices")
	public String faiLogin(HttpServletRequest req, HttpServletResponse resp, String email, String pass, String username) throws IOException {
		String sql = "select * from users where email = '" + email + "'" + "and password = '" + pass + "'";
		HttpSession session = req.getSession(true);
		
		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", 
															"postgres", "postgres");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("loggato", "si");
				resp.sendRedirect("/");
			}else {
				return "login";
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	*/
	
	@GetMapping("/faiLogout")
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getLogin().logout(req, resp);
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
	public String faiLogin(HttpServletRequest req, HttpServletResponse resp, String email, String pass, String username) throws IOException {
		if(Database.getInstance().getLogin().faiLogin(req, resp, email, pass, username))
			return "login";
		return null;
	}

}
