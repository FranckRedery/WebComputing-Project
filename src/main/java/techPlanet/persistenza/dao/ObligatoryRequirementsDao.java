package techPlanet.persistenza.dao;

import techPlanet.model.Job;
import techPlanet.model.Requirements;

public interface ObligatoryRequirementsDao {
	public boolean checkUguale(Job job, Requirements requirements);
	public boolean save(Job job, Requirements requirements);
	public boolean delete(Job job);
}
