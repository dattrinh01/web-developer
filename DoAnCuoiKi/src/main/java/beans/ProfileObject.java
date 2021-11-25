package beans;

public class ProfileObject {
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private String fname;
	private String lname;
	private String phone;
	private String description;
	private Integer id;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public ProfileObject(String fname, String lname, String phone, String description, Integer id) {
		this.fname = fname;
		this.lname = lname;
		this.phone = phone;
		this.description = description;
		this.id = id;
	}
	
	public ProfileObject() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
