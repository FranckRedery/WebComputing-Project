package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Review;

public interface ReviewDao {
	public List<Review> findByProduct(Long id);
}
