package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Product;
import techPlanet.model.ReturnRequest;

public interface ReturnRequestDao {

	public List<ReturnRequest> findAll();
	public List<ReturnRequest> findByType(String type);
	public boolean saveOrUpdate(ReturnRequest returnRequest);
	public boolean delete(ReturnRequest returnRequest);
	public List<ReturnRequest> findByUser(String user);

}
