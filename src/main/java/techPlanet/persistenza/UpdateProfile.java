package techPlanet.persistenza;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

public class UpdateProfile {

	private Connection conn;

	public UpdateProfile(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public String updateImage(HttpServletRequest req, HttpServletResponse resp, MultipartFile image ) throws IOException {
		HttpSession session = req.getSession(true);
		String percorso = System.getProperty("user.dir") + "/src/main/resources/static/images/profilePic";
		String pathTemp = image.getOriginalFilename();
		String path = null;
		if(pathTemp.contains(".png")){
			path = req.getParameter("username") + ".png";
		}
		if(pathTemp.contains(".jpg")){
			path = req.getParameter("username") + ".jpg";
		}
		if(pathTemp.contains(".gif")){
			path = req.getParameter("username") + ".gif";
		}
		image.transferTo(new File(percorso + "/" + path));
		
		String pathcomplete = "images/profilePic/" + path;
		String sql = "UPDATE users SET image = '" + pathcomplete + "'" + "WHERE username = '" + req.getParameter("username") + "'";
		try {
			 PreparedStatement preparedStmt = conn.prepareStatement(sql);
			 preparedStmt.execute();
			 session.setAttribute("image", pathcomplete);
			 session.setAttribute("update", "si");
			 resp.sendRedirect("/editProfile.html");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	 
	public String faiUpdate(HttpServletRequest req, HttpServletResponse resp, String name, String surname, String phonenumber, String addressline1, String addressline2, String postcode, String country, String stateregion ) throws IOException {
		HttpSession session = req.getSession(true);
		String sql = "UPDATE users SET name = '" + name + "', " + "surname = '" + surname + "', " + "phonenumber = '" + phonenumber + "', " + "addressline1 = '" + addressline1 + "', " + "addressline2 = '" + addressline2 + "', " + "postcode = '" + postcode + "', " + "country = '" + country + "', " + "stateregion = '" + stateregion + "'" + "WHERE username = '" + session.getAttribute("username") + "'";
		try {
		 System.out.println("entra");
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
				resp.sendRedirect("editProfile.html");
				return null;
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
