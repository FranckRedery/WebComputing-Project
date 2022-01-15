package techPlanet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import techPlanet.Database;

@Controller
public class Control {

	@GetMapping("/InsertCodeSecurity.html")
	public String codeSecurity(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "InsertCodeSecurity";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "InsertCodeSecurity";
			}
		}
	}
	
	@GetMapping("/insertNewPass.html")
	public String insertNewPass(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "insertNewPass";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "insertNewPass";
			}
		}
	}
	
	@GetMapping("/recoverPasswordSent")
	public String recoverPasswordSent(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "recoverPasswordSent";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "recoverPasswordSent";
			}
		}
	}
	
	@GetMapping("/changePassCorrect")
	public String changePassCorrect(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "changePassCorrect";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "changePassCorrect";
			}
		}
	}
	
	@GetMapping("/changeEmailCorrect")
	public String changeEmailCorrect(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "changeEmailCorrect";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "changeEmailCorrect";
			}
		}
	}
	
	@GetMapping("/recoverPassword")
	public String recoverPassword(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "recoverPassword";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "index";
				else
					return "recoverPassword";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "index";
				else
					return "index";
			}
		}
	}
	
	@GetMapping("/setMailCode")
	public void activeError(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		session.setAttribute("codSic", "email");
		resp.sendRedirect("control.html");
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
	
	@GetMapping("/insertNewEmail.html")
	public String insertNewEmail(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("loggato") == null) 
			return "index";
		else {
			if(session.getAttribute("loggatoGoogle") == null) {
				if(session.getAttribute("loggato").equals("si"))
					return "insertNewEmail";
				else
					return "index";
			}
			else {
				if(session.getAttribute("loggatoGoogle").equals("si"))
					return "account";
				else
					return "insertNewEmail";
			}
		}
	}
	
}
