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
		session.setAttribute("CodSic", "email");
		resp.sendRedirect("control.html");
	}
	
	public void insertSCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		String sql = "UPDATE users SET code = '" + req.getParameter("code") + "'" + "WHERE username = '" + session.getAttribute("username") + "'";;
			
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
	
}
