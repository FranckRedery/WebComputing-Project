package techPlanet.persistenza.dao;

import java.util.List;

import techPlanet.model.Report;

public interface ReportDao {
	public List<Report> findAll();
	public boolean saveOrUpdate(Report report);
	public boolean delete(Report report);
}
