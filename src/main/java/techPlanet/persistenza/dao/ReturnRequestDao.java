package techPlanet.persistenza.dao;

import java.util.List;


import techPlanet.model.ReturnRequest;

public interface ReturnRequestDao {

	public List<ReturnRequest> findAll();
	public List<ReturnRequest> findByStatusPending();
	public boolean update(ReturnRequest returnRequest);
	public boolean delete(ReturnRequest returnRequest);
	public List<ReturnRequest> findByUser(String user);
	
}
