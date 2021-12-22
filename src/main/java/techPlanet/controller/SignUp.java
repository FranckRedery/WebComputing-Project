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

@Controller
//MVC
public class SignUp {
	
	
	@PostMapping("/SignUpServices")
	public String faiSignUp(HttpServletRequest req, HttpServletResponse resp, String username ,String email, String password) throws IOException {
		String sql = "insert into users values ('"+ email +"' , '" + password + "', '" + username + "')";
		String check = "SELECT username FROM users WHERE username = '" + username + "'" + "OR email = '" + email + "'"; 
		HttpSession session = req.getSession(true);
		
		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", 
															"postgres", "postgres");
			
			Statement registerStatement = con.createStatement();
			ResultSet rs = registerStatement.executeQuery(check);
			
			if(rs.next()) {
				resp.sendRedirect("/signUp.html");
 				session.setAttribute("errore", "si");
				return "signUp";
			}
			else if(session.getAttribute("errore") == "no"){			
				PreparedStatement preparedStmt = con.prepareStatement(sql);
				preparedStmt.execute();
				session.setAttribute("errore", "no");
				return "login";
			}
			resp.sendRedirect("/signUp.html");
			session.setAttribute("errore", "si");
			return "signUp";
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
}

