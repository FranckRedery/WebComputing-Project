package techPlanet.persistenza;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

public class Login {
	
	private Connection conn;
	
	public Login(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean faiLoginCurriculum(HttpServletRequest req, HttpServletResponse resp, String username, String pass) {
		String sql = "select * from users where username = '" + username + "'";
		HttpSession session = req.getSession(true);
		
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				session.setAttribute("username", rs.getString("username"));
				return true;
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

//--------------------------------------------------	
	
	public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("loggato", "no");
		session.setAttribute("errore", "no");
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	public void resetError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("errore", "no");
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("errore", "si");
		session.invalidate();
		resp.sendRedirect("/");
	}
	
	
	public boolean faiLogin(HttpServletRequest req, HttpServletResponse resp, String email, String pass, String username) throws IOException {
		String sql = "select * from users where email = '" + email + "'" + "and password = '" + pass + "'";
		HttpSession session = req.getSession(true);
		
		try {
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", 
															"postgres", "wizard09...");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("loggato", "si");
				session.setAttribute("errore", "no");
				resp.sendRedirect("/");
			}else {
				session.setAttribute("errore", "si");
				resp.sendRedirect("login.html");
				return true;
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
//-----------------------------------------------------------------------------
}
