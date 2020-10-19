package net.hb.crud;

public class LoginDTO {
	private String custid;
	private String custpassword;
	private int cnt;
	private String madal_id;
	
	
	public String getMadal_id() {
		return madal_id;
	}
	public void setMadal_id(String madal_id) {
		this.madal_id = madal_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getCustpassword() {
		return custpassword;
	}
	public void setCustpassword(String custpassword) {
		this.custpassword = custpassword;
	}
	
	
}
