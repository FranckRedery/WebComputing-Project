package techPlanet.persistenza.dao;

import java.util.List;


import techPlanet.model.User;

public interface UserDao {

	public List<User> findAll();
	public List<User> findByType(String type);
	public User findByPrimaryKey(String username);
	public boolean saveOrUpdate(User user);
	public boolean delete(User user);
	public void makeAdmin(User user);
	public void deleteAdmin(User user);
}
