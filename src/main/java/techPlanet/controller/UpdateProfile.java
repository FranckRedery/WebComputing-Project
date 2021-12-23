package techPlanet.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

}
