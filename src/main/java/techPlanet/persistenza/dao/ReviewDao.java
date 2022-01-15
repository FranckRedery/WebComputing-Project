package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Review;

public interface ReviewDao {
	public List<Review> findByProduct(Long id);
	public void saveOrUpdate(Review review, String username);
	public void removeReview(Long id, String username);
	public void deleteReviewsByProductId(Long id);
}
