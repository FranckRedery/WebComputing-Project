package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Chooses;
import techPlanet.model.MyOrder;
import techPlanet.model.Product;
import techPlanet.model.User;
import techPlanet.persistenza.dao.MyOrderDao;

public class MyOrderDaoJDBC implements MyOrderDao{

	private Connection conn;
	
	public MyOrderDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public List<MyOrder> findByUser(String user) {
		List<MyOrder> orders = new ArrayList<MyOrder>();
		String query = "select * from my_order where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				MyOrder order = new MyOrder();
				Product product = Database.getInstance().getProductsDao().findById(rs.getLong("id"));
				order.setId(product);
				order.setDate_of_purchase(rs.getString("date_of_purchase"));
				User username = Database.getInstance().getUserDao().findByPrimaryKey(rs.getString("username"));
				order.setUsername(username);
				order.setQuantity(rs.getLong("quantity"));
				order.setReturned(rs.getBoolean("returned"));
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void setReturned(boolean b, Long id) {
		try {
			String query = "update my_order "
			+ "set returned = ?"
			+ "where id = ?";

			
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setBoolean(1, b);
			st.setLong(2, id);
			st.executeUpdate();
			return;
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	@Override
	public void deleteMyOrdersByProductId(Long id) {
		
		try {
			String query = "delete from my_order where id = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
