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
import techPlanet.persistenza.dao.ReturnRequestDao;

public class ReturnRequestDaoJDBC implements ReturnRequestDao {

	private Connection conn;
	private UserDaoJDBC userDaoJDBC;
	private ProductDaoJDBC productDaoJDBC;
	
	public ReturnRequestDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
		userDaoJDBC = new UserDaoJDBC(conn);
		productDaoJDBC = new ProductDaoJDBC(conn);
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
				User user = userDaoJDBC.findByPrimaryKey(username);
				r.setUser(user);
				long idProd = rs.getLong("prod");
				Product prod = productDaoJDBC.findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyReturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				
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
				User user2 = userDaoJDBC.findByPrimaryKey(username);
				r.setUser(user2);
				long idProd = rs.getLong("prod");
				Product prod = productDaoJDBC.findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyReturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				
				
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
			st.setFloat(2, returnRequest.getMoneyReturned());
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
				User user2 = userDaoJDBC.findByPrimaryKey(username);
				r.setUser(user2);
				long idProd = rs.getLong("prod");
				Product prod = productDaoJDBC.findById(idProd);
				r.setProduct(prod);
				r.setDate(rs.getString("date"));
				r.setMoneyReturned(rs.getFloat("moneyreturned"));
				r.setStatus(rs.getString("status"));
				
				
				returnRequest.add(r);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnRequest;
	}
	
	


}
