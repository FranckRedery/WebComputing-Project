package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.MyOrder;

public interface MyOrderDao {
	public List<MyOrder> findByUser(String username);

	public void setReturned(boolean b, Long id);
}
