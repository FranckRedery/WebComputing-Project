package techPlanet.model;

import java.util.Objects;

public class Chooses {
	private Long id;
	private User username;
	private Long quantity;
	
	public Chooses() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUsername() {
		return username;
	}

	public void setUsername(User username) {
		this.username = username;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
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
		Chooses other = (Chooses) obj;
		return Objects.equals(id, other.id) && Objects.equals(username, other.username);
	}
	

}
