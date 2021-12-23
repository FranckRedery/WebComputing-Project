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

import org.springframework.web.bind.annotation.PostMapping;

public class UpdateProfile {

	private Connection conn;

	public UpdateProfile(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public String faiUpdate(HttpServletRequest req, HttpServletResponse resp, String name, String surname, String phonenumber, String addressline1, String addressline2, String postcode, String country, String stateregion ) throws IOException {
		HttpSession session = req.getSession(true);
		String sql = "UPDATE users SET name = '" + name + "', " + "surname = '" + surname + "', " + "phonenumber = '" + phonenumber + "', " + "addressline1 = '" + addressline1 + "', " + "addressline2 = '" + addressline2 + "', " + "postcode = '" + postcode + "', " + "country = '" + country + "', " + "stateregion = '" + stateregion + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
		try {
		
			PreparedStatement preparedStmt = conn.prepareStatement(sql);
			 preparedStmt.execute();
			if (!sql.isEmpty()) {
				session.setAttribute("name", name);
				session.setAttribute("surname", surname);
				session.setAttribute("phonenumber", phonenumber);
				session.setAttribute("addressline1", addressline1);
				session.setAttribute("addressline2", addressline2);
				session.setAttribute("postcode", postcode);
				session.setAttribute("country", country);
				session.setAttribute("stateregion", stateregion);
				session.setAttribute("loggato", "si");
				resp.sendRedirect("account.html");
			}else {
				resp.sendRedirect("editProfile.html");
				return "editProfile.html";
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
