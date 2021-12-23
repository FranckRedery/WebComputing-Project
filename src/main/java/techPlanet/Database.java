package techPlanet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


import techPlanet.persistenza.Login;
import techPlanet.persistenza.SignUp;
import techPlanet.persistenza.UpdateProfile;
import techPlanet.persistenza.dao.CurriculumDao;
import techPlanet.persistenza.dao.JobDao;
import techPlanet.persistenza.dao.ProductDao;
import techPlanet.persistenza.dao.ReportDao;
import techPlanet.persistenza.dao.ReturnRequestDao;
import techPlanet.persistenza.dao.jdbc.CurriculumDaoJDBC;
import techPlanet.persistenza.dao.jdbc.JobDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ProductDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ReportDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ReturnRequestDaoJDBC;

public class Database {
	
	private static Database instance = null;
	private Connection conn;
	
	public static Database getInstance() {
		if (instance == null) {
			instance = new Database();
		}
		return instance;
	}
	
	private Database() {
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", 
											"postgres", "postgres");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ProductDao getProductsDao() {
		return new ProductDaoJDBC(conn);
	}

	public JobDao getJobDao() {
		return new JobDaoJDBC(conn);
	}
	
	public Login getLogin() {
		return new Login(conn);
	}

	public SignUp getSignUp() {
		return new SignUp(conn);
	}
	
	public UpdateProfile getUpdateProfile() {
		return new UpdateProfile(conn);
	}
	
	public CurriculumDao getCurriculum() {
		return new CurriculumDaoJDBC(conn);
	}
	
	public ReportDao getReport() {
		return new ReportDaoJDBC(conn);
	}
	
	public ReturnRequestDao getReturnRequest() {
		return new ReturnRequestDaoJDBC(conn);
	}
	
}
