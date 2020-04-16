package model;

import java.io.Serializable;
import java.util.Date;

public class CmtDataBean implements Serializable{
	
	private int num;
	private int cmt_num; 
	private String cmt_writer;
	private int cmt_star;
	private String cmt_content;
	private Date cmt_regdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_writer() {
		return cmt_writer;
	}
	public void setCmt_writer(String cmt_writer) {
		this.cmt_writer = cmt_writer;
	}
	public int getCmt_star() {
		return cmt_star;
	}
	public void setCmt_star(int cmt_star) {
		this.cmt_star = cmt_star;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public Date getCmt_regdate() {
		return cmt_regdate;
	}
	public void setCmt_regdate(Date cmt_regdate) {
		this.cmt_regdate = cmt_regdate;
	}
	
	@Override
	public String toString() {
		return "CmtDataBean [num=" + num + ", cmt_num=" + cmt_num + ", cmt_writer=" + cmt_writer + ", cmt_star="
				+ cmt_star + ", cmt_content=" + cmt_content + ", cmt_regdate=" + cmt_regdate + "]";
	}
	
	
	
}
