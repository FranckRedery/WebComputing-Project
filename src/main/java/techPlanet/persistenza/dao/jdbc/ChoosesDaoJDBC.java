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
			String query = "update chooses " + "set quantity = ?" + "where id = ? and username = ?";
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
	public void saveOrUpdateProdInCart(Chooses chooses, String username) {
		if (!AlreadyInserted(chooses.getId().getId(), username)) {
			saveInCart(chooses.getId().getId(), username, chooses.getQuantity());
		} else {
			try {
				Long quantity = getQuantity(chooses.getId().getId(), username);
				String query = "update chooses " + "set quantity = ?" + "where id = ? and username = ?";
				PreparedStatement st;
				st = conn.prepareStatement(query);
				st.setLong(1, quantity + 1);
				st.setLong(2, chooses.getId().getId());
				st.setString(3, username);
				st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public Long getQuantity(Long id, String username) {
		Long quantity = 0L;
		try {
			String query = "select quantity from chooses where id = ? and username = ?";
			PreparedStatement st;
			st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.setString(2, username);
			ResultSet rs = st.executeQuery();
			rs.next();
			quantity = rs.getLong("quantity");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return quantity;
	}

	public void saveInCart(Long id, String username, Long quantity) {
		try {
			String query = "insert into chooses " + "values (?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.setString(2, username);
			st.setLong(3, quantity);
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
		reduceQuantity(products);
		for (int i = 0; i < products.size(); i++) {
			String query = "insert into my_order " + "values (?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement st = conn.prepareStatement(query);
				st.setLong(1, products.get(i).getId().getId());
				st.setString(2, products.get(i).getUsername().getUsername());
				st.setString(3, new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
				st.setLong(4, products.get(i).getQuantity());
				st.setBoolean(5, false);
				st.setBoolean(6, false);
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return;
			}
		}
	}

	private void reduceQuantity(List<Chooses> products) {
		try {
			for (Chooses prod : products) {
				String query = "update product " + "set quantity = ?" + "where id = ?";
				Product product = Database.getInstance().getProductsDao().findById(prod.getId().getId());
				PreparedStatement st = conn.prepareStatement(query);
				st.setLong(1, product.getQuantity() - prod.getQuantity());
				st.setLong(2, prod.getId().getId());
				st.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private boolean AlreadyInserted(Long id, String username) {
		String query = "select id from chooses where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				if (rs.getLong("id") == id) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void quantityBasedAddition(Chooses chooses, String username) {
		if (!AlreadyInserted(chooses.getId().getId(), username)) {
			saveInCart(chooses.getId().getId(), username, chooses.getQuantity());
		} else {
			try {
				Long quantity = getQuantity(chooses.getId().getId(), username);
				String query = "update chooses " + "set quantity = ?" + "where id = ? and username = ?";
				PreparedStatement st;
				st = conn.prepareStatement(query);
				st.setLong(1, quantity + chooses.getQuantity());
				st.setLong(2, chooses.getId().getId());
				st.setString(3, username);
				st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteChoosesByProductId(Long id) {

		try {
			String query = "delete from chooses where id = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
