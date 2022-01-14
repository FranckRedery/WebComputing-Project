package techPlanet.persistenza.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import techPlanet.Database;
import techPlanet.model.Product;
import techPlanet.model.Review;
import techPlanet.model.User;
import techPlanet.persistenza.dao.ReviewDao;

public class ReviewDaoJDBC implements ReviewDao {

	private Connection conn;

	public ReviewDaoJDBC(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public List<Review> findByProduct(Long id) {
		List<Review> reviews = new ArrayList<Review>();
		String query = "select * from reviews where id = ?";

		try {
			PreparedStatement st = conn.prepareStatement(query);
			st.setLong(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Review review = new Review();
				review.setDescription(rs.getString("description"));
				Product product = Database.getInstance().getProductsDao().findById(id);
				review.setId(product);
				User user = Database.getInstance().getUserDao().findByPrimaryKey(rs.getString("username"));
				review.setUsername(user);
				review.setTitle(rs.getString("title"));
				review.setStars(rs.getFloat("stars"));
				reviews.add(review);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviews;
	}

	@Override
	public void saveOrUpdate(Review review, String username) {
		if (!AlreadyInserted(review.getId().getId(), username)) {
			try {
				String query = "insert into reviews " + "values (?, ?, ?, ?, ?)";
				PreparedStatement st = conn.prepareStatement(query);
				st.setLong(1, review.getId().getId());
				st.setString(2, username);
				st.setString(3, review.getDescription());
				st.setString(4, review.getTitle());
				st.setFloat(5, review.getStars());
				st.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return;
			}
		}
		else {
			try {
				String query = "update reviews " +
						"set title = ?, description = ?, stars = ?" + 
						"where id = ? and username = ?";
				PreparedStatement st;
				st = conn.prepareStatement(query);
				st.setString(1, review.getTitle());
				st.setString(2,review.getDescription());
				st.setFloat(3, review.getStars());
				st.setLong(4, review.getId().getId());
				st.setString(5, username);
				st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		saveOrupdateStars(review.getId().getId());
	}

	@Override
	public void removeReview(Long id, String username) {
		Database.getInstance().getMyOrderDao().setReviewed(false, id, username);
		try {
			String query = "delete from reviews where id = ? and username = ?"; 
			PreparedStatement st;
			st = conn.prepareStatement(query);
			st.setLong(1, id);
			st.setString(2, username);
			st.executeUpdate();
			saveOrupdateStars(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean AlreadyInserted(Long id, String username) {
		String query = "select id from reviews where username = ?";
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
	
	
	
	public void saveOrupdateStars(Long id) {
		String getOverall = "select stars from reviews where id = ?";
		float overall = 0.0f;
		int cont = 0;
		try {
			PreparedStatement st = conn.prepareStatement(getOverall);
			st.setLong(1,id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				overall += rs.getFloat("stars");
				cont++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String updateOverallProduct = "update product " +
				"set reviews = ?" + 
				"where id = ?";
		try {
			PreparedStatement st;
			st = conn.prepareStatement(updateOverallProduct);
			if(overall == 0) {
				st.setFloat(1, 0);
			}
			else {
				st.setFloat(1, overall/cont);
			}
			st.setLong(2,id);
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
