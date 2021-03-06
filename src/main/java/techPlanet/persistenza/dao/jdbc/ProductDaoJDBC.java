package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Chooses;
import techPlanet.model.Product;
import techPlanet.model.ReturnRequest;
import techPlanet.model.User;
import techPlanet.persistenza.dao.ProductDao;


public class ProductDaoJDBC implements ProductDao {
	
	private Connection conn;
		
	public ProductDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Product> findAll() {
		List<Product> prodotti = new ArrayList<Product>();
		String query = "select * from product order by reviews DESC";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Product prodotto = new Product();
				prodotto.setId(rs.getLong("id"));
				prodotto.setName(rs.getString("name"));
				prodotto.setQuantity(rs.getInt("quantity"));
				prodotto.setTags(rs.getString("tags"));
				prodotto.setDescription(rs.getString("description"));
				prodotto.setCategory(rs.getString("category"));
				prodotto.setReviews(rs.getFloat("reviews"));
				prodotto.setPrice(rs.getFloat("price"));
				prodotto.setImage(rs.getString("image"));
				prodotti.add(prodotto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prodotti;
	}

	
	@Override
	public List<Product> findByCategory(String category) {
		List<Product> prodotti = new ArrayList<Product>();
		String query = "select * from product where category = ? order by reviews DESC";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, category);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Product prodotto = new Product();
				prodotto.setId(rs.getLong("id"));
				prodotto.setName(rs.getString("name"));
				prodotto.setQuantity(rs.getInt("quantity"));
				prodotto.setTags(rs.getString("tags"));
				prodotto.setDescription(rs.getString("description"));
				prodotto.setCategory(rs.getString("category"));
				prodotto.setReviews(rs.getFloat("reviews"));
				prodotto.setPrice(rs.getFloat("price"));
				prodotto.setImage(rs.getString("image"));
				prodotti.add(prodotto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prodotti;
	}

	@Override
	public boolean saveOrUpdate(Product product) {
		// TODO Auto-generated method stub
		return false;
	}
		
	@Override
	public Product findById(long id) {
		String query = "select * from product where id = ?";
		Product prod = new Product();
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				prod.setDescription(rs.getString("description"));
				prod.setId(rs.getLong("id"));
				prod.setName(rs.getString("name"));
				prod.setPrice(rs.getFloat("price"));
				prod.setQuantity(rs.getInt("quantity"));
				prod.setReviews(rs.getFloat("reviews"));
				prod.setTags(rs.getString("tags"));
				prod.setCategory(rs.getString("category"));
				prod.setImage(rs.getString("image"));
				return prod;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prod;
	}

	@Override
	public void addProduct(Product product) {
		
		try {
			product.setId(IdProduct.getId(conn));
			String query = "insert into product "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1,product.getId());
			st.setString(2, product.getName());
			st.setInt(3, product.getQuantity());
			st.setString(4, product.getTags());
			st.setString(5, product.getDescription());
			st.setString(6, product.getCategory());
			// at the beginning reviews star i think should be 0
			st.setFloat(7,0);
			st.setFloat(8, product.getPrice());
			st.setString(9, product.getImage());
			st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		
		}
	}
	
	@Override
	public List<Product> findByLastNineInserted() {
		List<Product> product = new ArrayList<Product>();
		String query = "select * from (select * from product order by id desc limit 9)var1 order by id asc";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Product prodotto = new Product();
				prodotto.setId(rs.getLong("id"));
				prodotto.setName(rs.getString("name"));
				prodotto.setQuantity(rs.getInt("quantity"));
				prodotto.setTags(rs.getString("tags"));
				prodotto.setDescription(rs.getString("description"));
				prodotto.setCategory(rs.getString("category"));
				prodotto.setReviews(rs.getFloat("reviews"));
				prodotto.setPrice(rs.getFloat("price"));
				prodotto.setImage(rs.getString("image"));				
				product.add(prodotto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	@Override
	public Product findByName(String name) {
		String query = "select * from product where name = ?";
		Product prod = new Product();
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, name);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				prod.setDescription(rs.getString("description"));
				prod.setId(rs.getLong("id"));
				prod.setName(rs.getString("name"));
				prod.setPrice(rs.getFloat("price"));
				prod.setQuantity(rs.getInt("quantity"));
				prod.setReviews(rs.getFloat("reviews"));
				prod.setTags(rs.getString("tags"));
				prod.setCategory(rs.getString("category"));
				prod.setImage(rs.getString("image"));
				return prod;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean deleteProductById(long id) {
		
		try {
		String query = "delete from product where id = ?";
		PreparedStatement st = conn.prepareStatement(query);
		st.setLong(1, id);
		st.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
	}

	@Override
	public void modifyProduct(Product product) {
		
		try {
			String query = "update product "
				+ "set name = ?, quantity = ? , tags = ?, description = ?, category = ?, price = ?, image =  ?"
				+ "where id = ?";
			PreparedStatement st;
			st = conn.prepareStatement(query);
			st.setString(1, product.getName());
			st.setInt(2,product.getQuantity());
			st.setString(3, product.getTags());
			st.setString(4, product.getDescription());
			st.setString(5, product.getCategory());
			st.setFloat(6,product.getPrice());
			st.setString(7, product.getImage());
			st.setLong(8,product.getId());
			
			st.executeUpdate();
			return;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	



}