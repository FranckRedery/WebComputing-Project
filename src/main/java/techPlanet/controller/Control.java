package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import techPlanet.Database;

@Controller
public class Control {

	@GetMapping("/InsertCodeSecurity.html")
	public String codeSecurity() {
		return "InsertCodeSecurity";
	}
	
	@GetMapping("/insertNewPass.html")
	public String insertNewPass() {
		return "insertNewPass";
	}
	
	@GetMapping("/recoverPasswordSent")
	public String recoverPasswordSent() {
		return "recoverPasswordSent";
	}
	
	@GetMapping("/changePassCorrect")
	public String changePassCorrect() {
		return "changePassCorrect";
	}
	
	@GetMapping("/changeEmailCorrect")
	public String changeEmailCorrect() {
		return "changeEmailCorrect";
	}
	
	@GetMapping("/recoverPassword")
	public String recoverPassword() {
		return "recoverPassword";
	}
	
	@GetMapping("/setMailCode")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getControl().controlEmailCode(req, resp);
	}
	
	
	@PostMapping("/loginGoogle")
	public String loginGoogle(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return Database.getInstance().getControl().loginGoogle(req, resp);
	}
	
	@GetMapping("/setPassCode")
	public void setPassCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getControl().setPassCode(req, resp);
	}
	
	@PostMapping("/insertSCode")
	public void insertSCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getControl().insertSCode(req, resp);
	}
	
	@GetMapping("/updateEmail")
	public void updateEmail(HttpServletRequest req, HttpServletResponse resp, String email) throws IOException {
		Database.getInstance().getControl().updateEmail(req, resp, email);
	}
	
	@PostMapping("/updatePass")
	public void updatePass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Database.getInstance().getControl().updatePass(req, resp);
	}
	
	@PostMapping("/recoverPass")
	@ResponseBody
	public String recoverPass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return Database.getInstance().getControl().recoverPass(req, resp);
	}
	
}
