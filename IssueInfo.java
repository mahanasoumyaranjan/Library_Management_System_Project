package Library;

import java.sql.Date;

public class IssueInfo {
	private String bname, email;
private Date today;
public IssueInfo(){
	
}
public IssueInfo(String bname, String email){
	this.bname = bname;
	this.email = email;
}
	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}
}
