package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Product;

public interface ProductDao {
	public List<Product> findAll();
	public List<Product> findByCategory(String category);
	public List<Product> findByUser(String user);
	public List<Product> findByLastNineInserted();
	public boolean saveOrUpdate(Product product);
	public void addProduct(Product product);
	public boolean delete(Product product);
	public Product findById(long id);
	public Product findByName(String name);
	public void addProductToCart(Long id, String username);
}
