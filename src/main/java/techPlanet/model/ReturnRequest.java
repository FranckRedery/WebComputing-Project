package techPlanet.model;

import java.util.Objects;

public class ReturnRequest {
	
	long user;
	long prodId;
	String date;
	String status;
	float moneyReturned;
	
	public long getUser() {
		return user;
	}
	
	public void setUser(long user) {
		this.user = user;
	}
	
	public long getProdId() {
		return prodId;
	}
	public void setProdId(long prodId) {
		this.prodId = prodId;
	}
	
	public String getDate() {
		return date;
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
		return Objects.hash(prodId, user);
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
		return prodId == other.prodId && user == other.user;
	}
	
	
}
