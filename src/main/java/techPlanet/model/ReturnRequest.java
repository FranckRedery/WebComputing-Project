package techPlanet.model;

import java.util.Objects;

public class ReturnRequest {
	
	User user;
	Product product;
	String date;
	String status;
	float moneyReturned;
	

	
	public ReturnRequest() {}
	
	public Product getProduct() {
		return product;
	}
	
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public String getDate() {
		return date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public float getMoneyReturned() {
		return moneyReturned;
	}
	
	public void setMoneyReturned(float moneyReturned) {
		this.moneyReturned = moneyReturned;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(product, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReturnRequest other = (ReturnRequest) obj;
		return Objects.equals(product, other.product) && Objects.equals(user, other.user);
	}
	
	
}
