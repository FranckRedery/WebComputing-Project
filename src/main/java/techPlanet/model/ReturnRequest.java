package techPlanet.model;

import java.util.Objects;

public class ReturnRequest {
	
	User user;
	Product product;
	String date;
	String status;
	float moneyreturned;
	String reason;
	String description;
	int quantity;
	

	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

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
	
	public float getMoneyreturned() {
		return moneyreturned;
	}

	public void setMoneyreturned(float moneyreturned) {
		this.moneyreturned = moneyreturned;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
