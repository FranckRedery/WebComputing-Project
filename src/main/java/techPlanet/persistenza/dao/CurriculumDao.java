package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Curriculum;
import techPlanet.model.Job;

public interface CurriculumDao {
	public List<Curriculum> findAll();
	public Curriculum findById(Long id);
	public List<Curriculum> findByJob(Job job);	
	public Curriculum findByNameSurnameDateSpontaneous(String name, String surname, String date);
	public Long checkEsisteCurriculum(Curriculum cv);
	public boolean saveOrUpdate(Curriculum cv);
	public boolean delete(Curriculum cv);
}
