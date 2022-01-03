package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Chooses;

public interface ChoosesDao {
	public void updateQuantity(Chooses chooses, String username);
	public List<Chooses> findByUser(String user);
}
