package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Curriculum;
import techPlanet.model.Job;

public interface CurriculumDao {
	public List<Curriculum> findAll();
	public List<Curriculum> findByJob(Job job);
	public boolean saveOrUpdate(Curriculum cv);
	public boolean delete(Curriculum cv);
}
