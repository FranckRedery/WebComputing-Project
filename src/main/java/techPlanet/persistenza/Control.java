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

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


public class Control {
	
	private Connection conn;
	
	public Control(Connection conn) {
		super();
		this.conn = conn;
	}
	 
	public void controlEmailCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("codSic", "email");
		resp.sendRedirect("control.html");
	}
	
	public void takePass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		resp.sendRedirect("control.html");
	}
	
	public String recoverPass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		String check = "SELECT password FROM users WHERE username = '" + req.getParameter("username") + "'" + "AND email = '" + req.getParameter("email") + "'";
			try {
				Statement registerStatement = conn.createStatement();
				ResultSet rs;
				rs = registerStatement.executeQuery(check);
				if(rs.next()) {
					session.setAttribute("errore", "no");
					return rs.getString("password");
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
		String sql = "UPDATE users SET password = '" + req.getParameter("newPass") + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
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
		try {
			 PreparedStatement preparedStmt = conn.prepareStatement(sql);
			 preparedStmt.execute();
			 session.setAttribute("email", email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	resp.sendRedirect("/changeEmailCorrect");
	}
	
}
