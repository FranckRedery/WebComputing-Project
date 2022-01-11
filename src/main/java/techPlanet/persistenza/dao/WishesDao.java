package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Wishes;


public interface WishesDao {
	public List<Wishes> findByUser(String user);
	public void addToWishList(Wishes wishes, String username);
	public int getNumProdForUser(String username);
	public void removeProductFromWishList(Long id, String username);
}
