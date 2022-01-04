package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Chooses;
import techPlanet.model.Product;

public interface ProductDao {
	public List<Product> findAll();
	public List<Product> findByCategory(String category);
	public List<Product> findByLastNineInserted();
	public boolean saveOrUpdate(Product product);
	public void addProduct(Product product);
	public void modifyProduct(Product product);
	public boolean deleteProductById(long id);
	public Product findById(long id);
	public Product findByName(String name);
}
