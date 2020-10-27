package net.hb.crud;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile; //새로추가

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class BoardDTO {

	private int custcode;
	private String custname;
	private String custid;
	private String custpassword;
	private String clevel;
	private int cpoint;
	
	private int board_idx;
	private String topic;
	private String title;
	private String bcontent;
	private String wdate;
	private int hit;
	private int blike;
	
	/*추천해요*/
	private int heart_idx;
	private String hwriter;
	
	/*단어리스트*/
	private String fword;
	private String kword;
	private String wlevel;
	private int wrn;
	
	/*단어외우기 예문*/
	private String exam;
	
	/*댓글*/
	private String rcontent;
	private String rwriter;
	private String rdate;
	
	
	private int mid;

	private  int hobby_idx; //추가
	private  String hobby; //추가
	private  String img_file_name ; //추가
	private  MultipartFile upload_f ;  //추가 <input type=file name=uplaod_f


	//페이징,검색
	private int start, end;  
	private String skey, sval;
	private int  rcnt;
	private int  rn;
	
	
	
	
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getExam() {
		return exam;
	}
	public void setExam(String exam) {
		this.exam = exam;
	}
	public int getWrn() {
		return wrn;
	}
	public void setWrn(int wrn) {
		this.wrn = wrn;
	}
	public String getFword() {
		return fword;
	}
	public void setFword(String fword) {
		this.fword = fword;
	}
	public String getKword() {
		return kword;
	}
	public void setKword(String kword) {
		this.kword = kword;
	}
	public String getWlevel() {
		return wlevel;
	}
	public void setWlevel(String wlevel) {
		this.wlevel = wlevel;
	}
	public int getHeart_idx() {
		return heart_idx;
	}
	public void setHeart_idx(int heart_idx) {
		this.heart_idx = heart_idx;
	}
	public String getHwriter() {
		return hwriter;
	}
	public void setHwriter(String hwriter) {
		this.hwriter = hwriter;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getBlike() {
		return blike;
	}
	public void setBlike(int blike) {
		this.blike = blike;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
