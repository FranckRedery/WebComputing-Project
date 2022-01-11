package techPlanet.model;

import java.util.Objects;

public class Wishes {
	private Product id;
	private User username;
	
	public Wishes() {}
	
	public Product getId() {
		return id;
	}
	public void setId(Product id) {
		this.id = id;
	}
	public User getUsername() {
		return username;
	}
	public void setUsername(User username) {
		this.username = username;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id, username);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Wishes other = (Wishes) obj;
		return Objects.equals(id, other.id) && Objects.equals(username, other.username);
	}
	
	
}
