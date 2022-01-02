package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Chooses;
import techPlanet.model.Product;

public interface ProductDao {
	public List<Product> findAll();
	public List<Product> findByCategory(String category);
	public List<Product> findByUser(String user);
	public List<Product> findByLastNineInserted();
	public void removeProductFromCart(Long id, String username);
	public boolean saveOrUpdate(Product product);
	public int getNumProdForUser(String username);
	public void addProduct(Product product);
	public void modifyProduct(Product product);
	public boolean deleteProductById(long id);
	public Product findById(long id);
	public Product findByName(String name);
	public void addProductToCart(Chooses chooses, String username);
}
