package model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@SuppressWarnings("serial")
public class WebNote implements Serializable{
	
	private int messageno;
	private String writer;
	private String receiver;
	private String messagecontent;
	private LocalDateTime regdate;
	
	public int getMessageno() {
		return messageno;
	}
	public void setMessageno(int messageno) {
		this.messageno = messageno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMessagecontent() {
		return messagecontent;
	}
	public void setMessagecontent(String messagecontent) {
		this.messagecontent = messagecontent;
	}
	public LocalDateTime getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "WebNote [messageno=" + messageno + ", writer=" + writer + ", receiver=" + receiver + ", messagecontent="
				+ messagecontent + ", regdate=" + regdate + "]";
	}
}
