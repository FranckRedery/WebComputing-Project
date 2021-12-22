package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Product;
import techPlanet.model.ReturnRequest;

public interface ReturnRequestDao {

	public List<ReturnRequest> findAll();
	public List<ReturnRequest> findByType(String type);
	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);

}
