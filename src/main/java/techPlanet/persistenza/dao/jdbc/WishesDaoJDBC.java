package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Chooses;
import techPlanet.model.Product;
import techPlanet.model.User;
import techPlanet.model.Wishes;
import techPlanet.persistenza.dao.WishesDao;

public class WishesDaoJDBC implements WishesDao {
	private Connection conn;

	public WishesDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Wishes> findByUser(String user) {
		List<Wishes> wishes = new ArrayList<Wishes>();
		String query = "select * from wishes where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				Wishes wish = new Wishes();
				Product product = Database.getInstance().getProductsDao().findById(rs.getLong("id"));
				wish.setId(product);
				User username = Database.getInstance().getUserDao().findByPrimaryKey(rs.getString("username"));
				wish.setUsername(username);
				wishes.add(wish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wishes;
	}

	@Override
	public void addToWishList(Wishes wishes, String username) {
		if (!AlreadyInserted(wishes.getId().getId(), username)) {
			try {
				String query = "insert into wishes " + "values (?, ?)";
				PreparedStatement st = conn.prepareStatement(query);
				st.setLong(1, wishes.getId().getId());
				st.setString(2, username);
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return;
			}
		}
	}

	public boolean AlreadyInserted(Long id, String username) {
		String query = "select id from wishes where username = ?";
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
	public int getNumProdForUser(String username) {
		String query = "Select count(id) as count from wishes where username = ?";
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
	public void removeProductFromWishList(Long id, String username) {
		try {
			String query = "delete from wishes where id = ? and username = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.setString(2, username);
			st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void deleteWishesByProductId(Long id) {
		
		try {
			String query = "delete from wishes where id = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
}
