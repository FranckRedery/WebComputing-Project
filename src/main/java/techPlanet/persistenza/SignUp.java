package techPlanet.persistenza;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignUp {
	
	private Connection conn;
	
	public SignUp(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public String faiSignUp(HttpServletRequest req, HttpServletResponse resp, String username ,String email, String password) throws IOException {
		String sql = "insert into users values ('"+ email +"' , '" + password + "', '" + username + "')";
		String check = "SELECT username FROM users WHERE username = '" + username + "'" + "OR email = '" + email + "'"; 
		HttpSession session = req.getSession(true);
		
		try {
			
			Statement registerStatement = conn.createStatement();
			ResultSet rs = registerStatement.executeQuery(check);
			
			if(rs.next()) {
				session.setAttribute("errore", "si");
				resp.sendRedirect("/signUp.html");
				return "signUp";
			}
			else { 
			   if(session.getAttribute("errore") == "no" || session.getAttribute("errore") == null ){		
				PreparedStatement preparedStmt = conn.prepareStatement(sql);
				preparedStmt.execute();
				session.setAttribute("errore", "no");
				resp.sendRedirect("/login.html");
				return "login";
			   }
			   else {
				   session.setAttribute("errore", "si");
					resp.sendRedirect("/signUp.html");
					return "signUp";   
			   }
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
}
