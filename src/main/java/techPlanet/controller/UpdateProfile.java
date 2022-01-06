package techPlanet.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import techPlanet.Database;

@Controller
//MVC
public class UpdateProfile {
	
	public UpdateProfile() {}
	

	@PostMapping("/update")
	public String faiUpdate(HttpServletRequest req, HttpServletResponse resp, String name, String surname, String phonenumber, String addressline1, String addressline2, String postcode, String country, String stateregion ) throws IOException {		
		Database.getInstance().getUpdateProfile().faiUpdate(req, resp, name, surname, phonenumber, addressline1, addressline2, postcode, country, stateregion);
			return null;
	}

	@PostMapping("/updateImage")
	public String updateImage(HttpServletRequest req, HttpServletResponse resp, MultipartFile image ) throws IOException {	
		Database.getInstance().getUpdateProfile().updateImage(req, resp,image);
			return null;
	}
	
	@GetMapping("/resetUpdate")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("update", "no");
	}
	
}
