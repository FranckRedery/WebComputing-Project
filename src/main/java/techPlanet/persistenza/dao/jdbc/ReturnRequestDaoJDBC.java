package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Product;
import techPlanet.model.ReturnRequest;
import techPlanet.model.User;
import techPlanet.persistenza.dao.ReturnRequestDao;

public class ReturnRequestDaoJDBC implements ReturnRequestDao {

	private Connection conn;

	public ReturnRequestDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<ReturnRequest> findAll() {

		List<ReturnRequest> returnRequest = new ArrayList<ReturnRequest>();
		String query = "select * from return_request";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				ReturnRequest r = new ReturnRequest();
				String username = rs.getString("user");
				User user = Database.getInstance().getUserDao().findByPrimaryKey(username);
				r.setUser(user);
				long idProd = rs.getLong("prod");
				Product prod = Database.getInstance().getProductsDao().findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyreturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				r.setQuantity(rs.getInt("quantity"));
				
				returnRequest.add(r);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnRequest;
	}

	@Override
	public List<ReturnRequest> findByStatusPending() {
		List<ReturnRequest> returnRequest = new ArrayList<ReturnRequest>();
		String query = "select * from return_request where status = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, "pending");
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				ReturnRequest r = new ReturnRequest();
				String username = rs.getString("username");
				User user2 = Database.getInstance().getUserDao().findByPrimaryKey(username);
				r.setUser(user2);
				long idProd = rs.getLong("prod");
				Product prod = Database.getInstance().getProductsDao().findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyreturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				r.setReason(rs.getString("reason"));
				r.setDescription(rs.getString("description"));
				r.setQuantity(rs.getInt("quantity"));
				
				returnRequest.add(r);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnRequest;
	}

	@Override
	public boolean update(ReturnRequest returnRequest) {
		try {
			String query = "update return_request "
			+ "set status = ?, moneyreturned = ? "
			+ "where username = ? and prod = ?";

			
			PreparedStatement st = conn.prepareStatement(query);
			
			st.setString(1, returnRequest.getStatus());
			st.setFloat(2, returnRequest.getMoneyreturned());
			st.setString(3,returnRequest.getUser().getUsername());
			st.setLong(4, returnRequest.getProduct().getId());
			st.executeUpdate();
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(ReturnRequest returnRequest) {
		// TODO Auto-generated method stub
		return false;
	}

	
	@Override
	public List<ReturnRequest> findByUser(String user) {
		List<ReturnRequest> returnRequest = new ArrayList<ReturnRequest>();
		String query = "select * from return_request where username = ?";
		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, user);

			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				ReturnRequest r = new ReturnRequest();
				String username = rs.getString("username");
				User user2 = Database.getInstance().getUserDao().findByPrimaryKey(username);
				r.setUser(user2);
				long idProd = rs.getLong("prod");
				Product prod = Database.getInstance().getProductsDao().findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyreturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				r.setReason(rs.getString("reason"));
				r.setDescription(rs.getString("description"));
				r.setQuantity(rs.getInt("quantity"));
				
				returnRequest.add(r);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnRequest;
	}
	
	
	@Override
	public void addRequest(ReturnRequest returnRequest) {
		
		try {
			String query = "insert into return_request "
					+ "values (?, ?, ?, ?, ?, ?, ?,?)";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, returnRequest.getUser().getUsername());
			st.setLong(2, returnRequest.getProduct().getId());
			st.setString(3, returnRequest.getDate());
			st.setString(4, "pending");
			st.setFloat(5,0);
			st.setString(6, returnRequest.getReason());
			st.setString(7, returnRequest.getDescription());
			st.setInt(8, returnRequest.getQuantity());
			
			st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		
		}
	}

	@Override
	public void deleteReturnRequestsByProductId(Long id) {
		// TODO Auto-generated method stub
		
		try {
			String query = "delete from return_request where prod = ?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}
