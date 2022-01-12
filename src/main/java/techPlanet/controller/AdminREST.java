package techPlanet.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import techPlanet.Database;
import techPlanet.model.Curriculum;
import techPlanet.model.GestisciCartelle;
import techPlanet.model.Job;
import techPlanet.model.Product;
import techPlanet.model.Report;
import techPlanet.model.ReturnRequest;
import techPlanet.model.User;

@RestController
public class AdminREST {
	
	@PostMapping("/updateRequest")
	public void updateRequest(@RequestBody ReturnRequest returnRequest) {
		Database.getInstance().getReturnRequestDao().update(returnRequest);
	}
	
	
	@PostMapping("/addNewProduct")
	public void addNewProduct(String productName, String productCategory,String tags, String productDescription, MultipartFile image, float productPrice, int productQuantity, HttpServletResponse res) {
		
		Product product = new Product();
		product.setName(productName);
		product.setCategory(productCategory);
		product.setTags(tags);
		product.setDescription(productDescription);
		product.setPrice(productPrice);
		product.setQuantity(productQuantity);
		product.setImage("images/prodotti/" + image.getOriginalFilename());
		
		String path = System.getProperty("user.dir") + "/src/main/resources/static/images/prodotti";
		
		try {
			image.transferTo(new File(path+ "/" + image.getOriginalFilename()));
		} catch (IllegalStateException e) {
			System.out.println("Can't transfer the photo");
		} catch (IOException e) {
			System.out.println("Can't transfer the photo");
		}
		
		Database.getInstance().getProductsDao().addProduct(product);
		try {
			res.sendRedirect("/addProduct");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	@PostMapping("/getProdByName")
	public Product getProdByName(@RequestBody String name, HttpServletRequest req) {
		

		Product product = Database.getInstance().getProductsDao().findByName(name);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("product", product);

		return product;
		
	}
	
	@PostMapping("/getProdByNameForModify")
	public Product getProdByNameForModify(@RequestBody String name, HttpServletRequest req) {
		
		Product prod = Database.getInstance().getProductsDao().findByName(name);
		
		HttpSession session = req.getSession(true);
		session.setAttribute("prod", prod);

		return prod;
		
	}
	
	@PostMapping("/getUserByUsername")
	public User getUserByUsername(@RequestBody String username, HttpServletRequest req) {
		
		User user = Database.getInstance().getUserDao().findByPrimaryKey(username);
		HttpSession session = req.getSession(true);
		session.setAttribute("user", user);
		
		return user;
	}
	
	@PostMapping("/makeAdminByUsername")
	public void makeAdminByUsername(@RequestBody String username, HttpServletRequest req) {

		User user = Database.getInstance().getUserDao().findByPrimaryKey(username);
		Database.getInstance().getUserDao().makeAdmin(user);
		req.getSession().removeAttribute("user");
		
		
	}
	
	@PostMapping("/deleteAdminByUsername")
	public void deleteAdminByUsername(@RequestBody String username, HttpServletRequest req) {

		User user = Database.getInstance().getUserDao().findByPrimaryKey(username);
		Database.getInstance().getUserDao().deleteAdmin(user);
		req.getSession().removeAttribute("user");
		
	}
	

	@PostMapping("/deleteProdById")
	public void deleteProdById(@RequestBody Long id, HttpServletRequest req) {
		
		
		Database.getInstance().getMyOrderDao().deleteMyOrdersByProductId(id);	
		Database.getInstance().getReturnRequestDao().deleteReturnRequestsByProductId(id);
		Database.getInstance().getProductsDao().deleteProductById(id);
		req.getSession().removeAttribute("product");
	}
	
	@PostMapping("/modifyProduct")
	public void modifyProduct(int productID, String productName, String productCategory,String tags, String productDescription, MultipartFile image, float productPrice, int productQuantity, HttpServletResponse res, HttpServletRequest req) {
		
		Product product = new Product();
		product.setId(productID);
		product.setName(productName);
		product.setCategory(productCategory);
		product.setTags(tags);
		product.setDescription(productDescription);
		product.setPrice(productPrice);
		product.setQuantity(productQuantity);
		product.setImage("images/prodotti/" + image.getOriginalFilename());
		
		String path = System.getProperty("user.dir") + "/src/main/resources/static/images/prodotti";
		Database.getInstance().getProductsDao().modifyProduct(product);
		try {
			image.transferTo(new File(path+ "/" + image.getOriginalFilename()));
			req.getSession().removeAttribute("prod");
			res.sendRedirect("/modifyProd");		
		} catch (IllegalStateException e) {
			System.out.println("Can't transfer the photo or can't redirect to page addProduct");
		} catch (IOException e) {
			System.out.println("Can't transfer the photo or can't redirect to page addProduct");
		}
	
	}
	
	
	@PostMapping("/eliminaReport")
	public void eliminaReport(@RequestParam String id) {
		
		Report report = Database.getInstance().getReportDao().findById(Long.parseLong(id));
		
		Database.getInstance().getReportDao().delete(report);
	}
	
	@PostMapping("/eliminaLavoro")
	public void eliminaLavoro(@RequestParam String titolo) {
		
		Job lavoro = Database.getInstance().getJobDao().findByPrimaryKey(titolo);
		
		List<Curriculum> curriculum = Database.getInstance().getCurriculumDao().findByJob(lavoro);
		
		for(var i : curriculum) {
			
			String nomeCartella = i.getLast_name() + "_" + i.getFirst_name() + "_" + i.getDate_birth();
			
			String s = GestisciCartelle.scriviCartella("curriculumRicevuti/Spontaneous Candidature", 
					nomeCartella);

			if(s != null) {
//				System.out.println("qui");

				File foto =  new File(System.getProperty("user.dir") + "/src/main/resources/static/" + i.getPhoto());
				File cv = new File(System.getProperty("user.dir") + "/src/main/resources/static/" + i.getCurriculum());
				
				GestisciCartelle.copiaFile(foto, s);
				GestisciCartelle.copiaFile(cv, s);
				
				i.setPhoto("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + foto.getName());
				i.setCurriculum("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + cv.getName());
//				System.out.println("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + foto.getName());
				Database.getInstance().getCurriculumDao().saveOrUpdate(i);
	//			System.out.println(i.getPhoto());
			} else {

				Curriculum c1 = Database.getInstance().getCurriculumDao().findByNameSurnameDateSpontaneous(i.getFirst_name(), 
						i.getLast_name(), i.getDate_birth());
				
				if(c1.getId() < i.getId()) {
					File foto = new File(System.getProperty("user.dir") + "/src/main/resources/static/" + c1.getPhoto());
					foto.delete();
					
					File cv = new File(System.getProperty("user.dir") + "/src/main/resources/static/" + c1.getCurriculum());
					cv.delete();
					
					foto =  new File(System.getProperty("user.dir") + "/src/main/resources/static/" + i.getPhoto());
					cv = new File(System.getProperty("user.dir") + "/src/main/resources/static/" + i.getCurriculum());
					
					
					s = System.getProperty("user.dir") + "/src/main/resources/static/curriculumRicevuti/Spontaneous Candidature/" + 
					i.getLast_name() + "_" + i.getFirst_name() + "_" + i.getDate_birth();

					GestisciCartelle.copiaFile(foto, s);
					GestisciCartelle.copiaFile(cv, s);
					

					i.setPhoto("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + foto.getName());
					i.setCurriculum("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + cv.getName());
//					System.out.println("curriculumRicevuti/Spontaneous Candidature/" + nomeCartella + "/" + foto.getName());
					Database.getInstance().getCurriculumDao().saveOrUpdate(i);
				}
			}
				
		}	

		GestisciCartelle.eliminaCartella("curriculumRicevuti", titolo);
				

		Database.getInstance().getJobDao().delete(lavoro);
	}
	

	@PostMapping("/salvaModificaPosizioneLavoro")
	public void salvaModificaPosizioneLavoro(@RequestBody Job lavoro) {

		if(Database.getInstance().getJobDao().saveOrUpdate(lavoro))
			GestisciCartelle.scriviCartella("curriculumRicevuti", lavoro.getTitle());
		
	}	

	@PostMapping("/checkPosizioneLavoro")
	public String checkPosizioneLavoro(@RequestBody Job lavoro) {
		
		Job job = Database.getInstance().getJobDao().findByPrimaryKeyWithRequirements(lavoro.getTitle());

		if(job == null)
			return "nuovo";
		else {	
			if(job.ugualiTotalmente(lavoro))
				return "uguale";
			else
				return "titolo";
		}
	}
	
	@PostMapping("/eliminaCV")
	public void eliminaCV(@RequestParam Long id) {
		
		Curriculum cv = Database.getInstance().getCurriculumDao().findById(id);
	
//		System.out.println(cv.getLast_name() + "_" + cv.getFirst_name() + "_" + cv.getDate_birth()
//					+ "_" + cv.getJob().getTitle());
		

		GestisciCartelle.eliminaCartella("curriculumRicevuti/" + cv.getJob().getTitle(), cv.getLast_name() + "_" + cv.getFirst_name() + "_" + cv.getDate_birth());
		
		Database.getInstance().getCurriculumDao().delete(cv);
	}
	
	@PostMapping("/prendiCurriculum")
	public List<Curriculum> prendiCurriculum(@RequestParam String titoloLavoro) {
				
		List<Curriculum> cv = null;
		
		
		if(titoloLavoro.equals("all"))
			cv = Database.getInstance().getCurriculumDao().findAll();
		else {
			
			Job lavoro = Database.getInstance().getJobDao().findByPrimaryKey(titoloLavoro);
			
//			System.out.println(lavoro.getTitle());
			
			cv = Database.getInstance().getCurriculumDao().findByJob(lavoro);
		}
		
		return cv;
	}
}
