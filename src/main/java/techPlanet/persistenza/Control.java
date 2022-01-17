package techPlanet.persistenza;

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

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


public class Control {
	
	private Connection conn;
	
	public Control(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public String loginGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String cryptedID = BCrypt.hashpw(req.getParameter("id"), BCrypt.gensalt(12));
		String sql = "insert into users values ('"+ req.getParameter("email") +"' , '" + cryptedID + "', '" + req.getParameter("username") + "', '" + false + "')";
		String check = "SELECT * FROM users WHERE username = '" + req.getParameter("username") + "'" + "OR email = '" + req.getParameter("email") + "'"; 
		HttpSession session = req.getSession(true);
		session.setMaxInactiveInterval(10*60);
		session.setAttribute("errore", "no");
		try {
			Statement registerStatement = conn.createStatement();
			ResultSet rs = registerStatement.executeQuery(check);
			
			if(rs.next()) {
				session.setAttribute("loggato", "si");
				session.setAttribute("loggatoGoogle", "si");
				session.setAttribute("errore", "no");
				session.setAttribute("isAdmin", rs.getString("isadmin"));
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("image", rs.getString("image"));
				return "index";
			}
			else { 
			   if(session.getAttribute("errore") == "no" || session.getAttribute("errore") == null ){		
				PreparedStatement preparedStmt = conn.prepareStatement(sql);
				preparedStmt.execute();
				session.setAttribute("loggato", "si");
				session.setAttribute("loggatoGoogle", "si");
				session.setAttribute("isAdmin", false);
				session.setAttribute("errore", "no");
				session.setAttribute("email", req.getParameter("email"));
				session.setAttribute("username", req.getParameter("username"));
				session.setAttribute("image","images/account/avatar.png");
				return "index";
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
		
		return "index";
	}
	
	public String recoverPass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String newPass = generatePassword();
		String cryptedPass = BCrypt.hashpw(newPass, BCrypt.gensalt(12));
		HttpSession session = req.getSession();
		String check = "SELECT * FROM users WHERE username = '" + req.getParameter("username") + "'" + "AND email = '" + req.getParameter("email") + "'";
		String sql = "UPDATE users SET password = '" + cryptedPass + "'" + "WHERE username = '" + req.getParameter("username") + "'" + "AND email = '" + req.getParameter("email") + "'";
			try {
				Statement registerStatement = conn.createStatement();
				ResultSet rs = registerStatement.executeQuery(check);
				if(rs.next()) {
					session.setAttribute("errore", "no");
					PreparedStatement preparedStmt = conn.prepareStatement(sql);
					 preparedStmt.execute();
					return newPass;
				}
				else { 
					session.setAttribute("errore", "si");
					return "null";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "null";
	}
	
	public void setPassCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("codSic", "pass");
		resp.sendRedirect("control.html");
	}
	
	public void insertSCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		String sql = "UPDATE users SET code = '" + req.getParameter("code") + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
			
			 try {
				 PreparedStatement preparedStmt = conn.prepareStatement(sql);
				 preparedStmt.execute();
				 session.setAttribute("codeS", req.getParameter("code"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		resp.sendRedirect("/");
	}
	
	public void updatePass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		String cryptedPass = BCrypt.hashpw(req.getParameter("newPass"), BCrypt.gensalt(12));
		String sql = "UPDATE users SET password = '" + cryptedPass + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
			 try {
				 PreparedStatement preparedStmt = conn.prepareStatement(sql);
				 preparedStmt.execute();
				 session.setAttribute("password", req.getParameter("newPass"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		resp.sendRedirect("/account.html");
	}
	
	
	public void updateEmail(HttpServletRequest req, HttpServletResponse resp, String email) throws IOException {
		HttpSession session = req.getSession();
		String sql = "UPDATE users SET email = '" + email + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
		String check = "SELECT * FROM users WHERE email = '" + email + "'";
		try {
			Statement registerStatement = conn.createStatement();
			ResultSet rs = registerStatement.executeQuery(check);
			if(rs.next()) {
				session.setAttribute("errore", "si");
				resp.sendRedirect("/insertNewEmail.html");
			}
			else { 
				PreparedStatement preparedStmt = conn.prepareStatement(sql);
				preparedStmt.execute();
				session.setAttribute("errore", "no");
				session.setAttribute("email", email);
				resp.sendRedirect("/changeEmailCorrect");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String generatePassword() {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
			StringBuilder sb = new StringBuilder(9);
				for (int i = 0; i < 9; i++) {
					int index = (int)(AlphaNumericString.length() * Math.random());
					sb.append(AlphaNumericString.charAt(index));
				}
		return sb.toString();
	}
	
	
}
