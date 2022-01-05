package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Chooses;
import techPlanet.model.Product;
import techPlanet.model.User;
import techPlanet.persistenza.dao.ChoosesDao;

public class ChoosesDaoJDBC implements ChoosesDao {

	private Connection conn;
	
	public ChoosesDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public List<Chooses> findByUser(String user) {
		List<Chooses> chooses = new ArrayList<Chooses>();
		String query = "select * from chooses where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);

			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Chooses chosen = new Chooses();
				Product product = Database.getInstance().getProductsDao().findById(rs.getLong("id"));
				chosen.setId(product);
				chosen.setQuantity(rs.getLong("quantity"));
				User username = Database.getInstance().getUserDao().findByPrimaryKey(rs.getString("username"));
				chosen.setUsername(username);
				chooses.add(chosen);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return chooses;
	}
	
	@Override
	public void updateQuantity(Chooses chooses, String username) {
		try {
			String query = "update chooses "
				+ "set quantity = ?"
				+ "where id = ? and username = ?";
			PreparedStatement st;
			st = conn.prepareStatement(query);
			st.setLong(1, chooses.getQuantity());
			st.setLong(2, chooses.getId().getId());
			st.setString(3, username);
			st.executeUpdate();
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void toEmptyCart(String username) {
		String query = "delete from chooses where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void removeProductFromCart(Long id, String username) {
		try {
			String query = "delete from chooses where id = ? and username = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.setString(2, username);
			st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}
	
	@Override
	public void addProductToCart(Chooses chooses, String username) {
		try {
			String query = "insert into chooses "
					+ "values (?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);			
			st.setLong(1,chooses.getId().getId());
			st.setString(2,username);
			st.setLong(3, chooses.getQuantity());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		}
	}
	
	@Override
	public int getNumProdForUser(String username) {
		String query = "Select count(id) as count from chooses where username = ?";
		int num = 0;
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			rs.next();
			num = rs.getInt("count");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	@Override
	public void addProductToMyOrder(List<Chooses> products) {
		for (int i = 0; i < products.size(); i++) {
			String query = "insert into my_order " + "values (?, ?, ?, ?)";
			try {
				PreparedStatement st = conn.prepareStatement(query);			
				st.setLong(1,products.get(i).getId().getId());
				st.setString(2,products.get(i).getUsername().getUsername()); 
				st.setString(3, new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
				st.setLong(4, products.get(i).getQuantity());
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return;
			}
		}
	}

}
