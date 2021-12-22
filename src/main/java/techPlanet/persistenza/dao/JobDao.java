package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Job;

public interface JobDao {
	public List<Job> findAll();
	public List<Job> findAllStatus(boolean active);
	public Job findByPrimaryKey(String nome);
	public boolean saveOrUpdate(Job job);
	public boolean delete(Job job);
}
