package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class MarketDataBean implements Serializable {
	
	private int num;
	private String category;
	private String subject;
	private String region;
	private String sdate;
	private String edate;
	private String writer;
	private String stime;
	private String etime;
	private String address;
	private String detailaddress;
	private String content;
	private String passwd;
	private String regdate;
	private int readcount;
	private String ip;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "MarketDataBean [num=" + num + ", category=" + category + ", subject=" + subject + ", region=" + region
				+ ", sdate=" + sdate + ", edate=" + edate + ", writer=" + writer + ", stime=" + stime + ", etime="
				+ etime + ", address=" + address + ", detailaddress=" + detailaddress + ", content=" + content
				+ ", passwd=" + passwd + ", regdate=" + regdate + ", readcount=" + readcount + ", ip=" + ip + "]";
	}
	
	
}
