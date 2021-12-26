package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		String query = "select * from products";
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
		String query = "select * from products where category = ?";
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
	public boolean delete(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Product> findByUser(String user) {
		List<Product> product = new ArrayList<Product>();
		String query = "select * from bought where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);

			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Product prodotto = new Product();
				prodotto.setId(rs.getLong("id"));;
				prodotto.setName(rs.getString("name"));
				prodotto.setQuantity(rs.getInt("quantity"));
				prodotto.setTags(rs.getString("tags"));
				prodotto.setDescription(rs.getString("description"));
				prodotto.setCategory(rs.getString("category"));
				prodotto.setReviews(rs.getFloat("reviews"));
				prodotto.setPrice(rs.getFloat("price"));
				product.add(prodotto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	@Override
	public Product findById(long id) {
		String query = "select * from products where id = ?";
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
			String query = "insert into products "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			//st.setLong(1, report.getId());
			//st.setString(2, report.getProblem_origin());
			//st.setString(3, report.getDescription());
			st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		
		}
	}
	
	public List<Product> findByLastNineInserted() {
		List<Product> product = new ArrayList<Product>();
		String query = "select * from (select * from products order by id desc limit 9)var1 order by id asc";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Product prodotto = new Product();
				prodotto.setId(rs.getLong("id"));;
				prodotto.setName(rs.getString("name"));
				prodotto.setQuantity(rs.getInt("quantity"));
				prodotto.setTags(rs.getString("tags"));
				prodotto.setDescription(rs.getString("description"));
				prodotto.setCategory(rs.getString("category"));
				prodotto.setReviews(rs.getFloat("reviews"));
				prodotto.setPrice(rs.getFloat("price"));
				product.add(prodotto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	

}
