package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.MyOrder;
import techPlanet.model.Review;

public interface MyOrderDao {
	public List<MyOrder> findByUser(String username);
	public void setReturned(boolean b, Long id,String username);
	public MyOrder findOrder(Long id, String username);
	public void setReviewed(boolean b, Long id);
	public void deleteMyOrdersByProductId(Long id);
}
