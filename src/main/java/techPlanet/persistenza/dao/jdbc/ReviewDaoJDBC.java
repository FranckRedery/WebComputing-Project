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

public class ReviewDaoJDBC implements ReviewDao{

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
			while(rs.next()) {
				Review review = new Review();
				review.setDescription(rs.getString("description"));
				Product product = Database.getInstance().getProductsDao().findById(id);
				review.setId(product);
				User user = Database.getInstance().getUserDao().findByPrimaryKey(rs.getString("username"));
				review.setUsername(user);
				reviews.add(review);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reviews;
	}

}
