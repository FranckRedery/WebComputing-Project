package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.util.List;

import techPlanet.model.Product;
import techPlanet.persistenza.dao.ReturnRequestDao;

public class ReturnRequestDaoJDBC implements ReturnRequestDao {

	private Connection conn;
	
	public ReturnRequestDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean saveOrUpdate(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Product product) {
		// TODO Auto-generated method stub
		return false;
	}
	


}
