package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Product;

public interface ReturnRequestDao {

	public List<Product> findAll();
	public List<Product> findByType(String type);
	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);

}
