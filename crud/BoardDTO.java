package net.hb.crud;

import org.springframework.web.multipart.MultipartFile; //새로추가

public class BoardDTO {
	private int custcode;
	private String custname;
	private String custid;
	private String custpassword;
	private String clevel;
	private int cpoint;
	
	private int mid;

	private  int hobby_idx; //추가
	private  String hobby; //추가
	private  String img_file_name ; //추가
	private  MultipartFile upload_f ;  //추가 <input type=file name=uplaod_f

	
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
	public int getCustcode() {
		return custcode;
	}
	public void setCustcode(int custcode) {
		this.custcode = custcode;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getClevel() {
		return clevel;
	}
	public void setClevel(String clevel) {
		this.clevel = clevel;
	}
	public int getCpoint() {
		return cpoint;
	}
	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getHobby_idx() { return hobby_idx;}
	public void setHobby_idx(int hobby_idx) {this.hobby_idx = hobby_idx;}
	public String getHobby() {return hobby;}
	public void setHobby(String hobby) {this.hobby = hobby;}
	public String getImg_file_name() {return img_file_name;}
	public void setImg_file_name(String img_file_name) {this.img_file_name = img_file_name;	}
	public MultipartFile getUpload_f() {return upload_f;}
	public void setUpload_f(MultipartFile upload_f) {this.upload_f = upload_f;	}


	//페이징,검색
	private int start, end;  
	private String skey, sval;
	private int  rcnt;

	public int getStart() {return start;}
	public void setStart(int start) {this.start = start;}
	public int getEnd() {return end;	}
	public void setEnd(int end) {	this.end = end;	}
	public String getSkey() {	return skey;	}
	public void setSkey(String skey) {	this.skey = skey;	}
	public String getSval() {return sval;	}
	public void setSval(String sval) {this.sval = sval;	}
	public int getRcnt() {return rcnt;	}
	public void setRcnt(int rcnt) {this.rcnt = rcnt;} 
	
	
}//class END
