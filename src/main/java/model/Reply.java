package model;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Reply implements Serializable {

	private int replynum;
	private int boardnum;
	private String userid;
	private int ref;
	private int re_step;
	private int re_level;
	private Timestamp regdate;
	private Timestamp update_date;
	private String comments;
	
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", userid=" + userid + ", ref=" + ref
				+ ", re_step=" + re_step + ", re_level=" + re_level + ", regdate=" + regdate + ", update_date="
				+ update_date + ", comments=" + comments + "]";
	}
}
