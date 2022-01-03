package techPlanet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import techPlanet.persistenza.Control;
import techPlanet.persistenza.Login;
import techPlanet.persistenza.SignUp;
import techPlanet.persistenza.UpdateProfile;
import techPlanet.persistenza.dao.ChoosesDao;
import techPlanet.persistenza.dao.CurriculumDao;
import techPlanet.persistenza.dao.JobDao;
import techPlanet.persistenza.dao.ObligatoryRequirementsDao;
import techPlanet.persistenza.dao.ProductDao;
import techPlanet.persistenza.dao.ReportDao;
import techPlanet.persistenza.dao.RequirementsDao;
import techPlanet.persistenza.dao.ReturnRequestDao;
import techPlanet.persistenza.dao.ReviewDao;
import techPlanet.persistenza.dao.UserDao;
import techPlanet.persistenza.dao.jdbc.ChoosesDaoJDBC;
import techPlanet.persistenza.dao.jdbc.CurriculumDaoJDBC;
import techPlanet.persistenza.dao.jdbc.JobDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ObligatoryRequirementsDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ProductDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ReportDaoJDBC;
import techPlanet.persistenza.dao.jdbc.RequirementsDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ReturnRequestDaoJDBC;
import techPlanet.persistenza.dao.jdbc.ReviewDaoJDBC;
import techPlanet.persistenza.dao.jdbc.UserDaoJDBC;

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
	
	public Login getSecurity() {
		return new Login(conn);
	}
	
	
	public Control getControl() {
		return new Control(conn);
	}

	public SignUp getSignUp() {
		return new SignUp(conn);
	}
	
	public UpdateProfile getUpdateProfile() {
		return new UpdateProfile(conn);
	}
	
	public CurriculumDao getCurriculumDao() {
		return new CurriculumDaoJDBC(conn);
	}
	
	public ReportDao getReportDao() {
		return new ReportDaoJDBC(conn);
	}
	
	public ReturnRequestDao getReturnRequestDao() {
		return new ReturnRequestDaoJDBC(conn);
	}
	
	public RequirementsDao getRequirementsDao() {
		return new RequirementsDaoJDBC(conn);
	}
	
	public ObligatoryRequirementsDao getObligatoryRequirementsDao() {
		return new ObligatoryRequirementsDaoJDBC(conn);
	}
	
	public UserDao getUserDao() {
		return new UserDaoJDBC(conn);
	}
	
	public ReviewDao getReviewDao() {
		return new ReviewDaoJDBC(conn);
	}
	
	public ChoosesDao getChoosesDao() {
		return new ChoosesDaoJDBC(conn);
	}
	
}
