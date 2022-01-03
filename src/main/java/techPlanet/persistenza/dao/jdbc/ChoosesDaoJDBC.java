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

}
