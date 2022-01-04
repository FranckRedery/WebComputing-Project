package techPlanet.model;

import java.util.Objects;

public class MyOrder {
	private Product id;
	private User username;
	private String date_of_purchase;
	
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
	public String getDate_of_purchase() {
		return date_of_purchase;
	}
	public void setDate_of_purchase(String date_of_purchase) {
		this.date_of_purchase = date_of_purchase;
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
		MyOrder other = (MyOrder) obj;
		return Objects.equals(id, other.id) && Objects.equals(username, other.username);
	}
	
	
}
