package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import techPlanet.Database;

@Controller
public class Security {

	@GetMapping("/control.html")
	public String control() {
		return "control";
	}
	
}
