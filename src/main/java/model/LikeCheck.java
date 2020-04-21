package model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LikeCheck implements Serializable {

	private int likenum;
	private int boardnum;
	private int likecheck;
	private String userid;
	
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
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
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
	@Override
	public String toString() {
		return "Likecheck [likenum=" + likenum + ", boardnum=" + boardnum + ", likecheck=" + likecheck + ", userid="
				+ userid + "]";
	}
}
