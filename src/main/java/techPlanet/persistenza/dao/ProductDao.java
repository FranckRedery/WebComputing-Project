package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Product;

public interface ProductDao {
	public List<Product> findAll();
	public List<Product> findByType(String type);
	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);
	public Product findById(long id);
	public List<Product> findByLastNineInserted();
}
