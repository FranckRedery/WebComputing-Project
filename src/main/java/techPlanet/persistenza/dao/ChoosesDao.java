package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Chooses;

public interface ChoosesDao {
	public void updateQuantity(Chooses chooses, String username);
	public List<Chooses> findByUser(String user);
	public void toEmptyCart(String username);
	public void removeProductFromCart(Long id, String username);
	public void saveOrUpdateProdInCart(Chooses chooses, String username);
	public void quantityBasedAddition(Chooses chooses, String username);
	public int getNumProdForUser(String username);
	public void addProductToMyOrder(List<Chooses> product);
}
