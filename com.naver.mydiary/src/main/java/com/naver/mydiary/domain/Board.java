package com.naver.mydiary.domain;

import java.util.Date;

public class Board {
	// 테이블에 존재하는 컬럼
	private int boardnum; 
	private String boardtitle;
	private String boardcontent;
	private int boardreadcnt;
	private Date boarddate;
	private String boardip;
	private Date updatedate;
	private String email;
	// 테이블에 없지만 출력할 때 사용할 컬럼
	private String nickname;
	private String dispdate;
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public int getBoardreadcnt() {
		return boardreadcnt;
	}
	public void setBoardreadcnt(int boardreadcnt) {
		this.boardreadcnt = boardreadcnt;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	public String getBoarddip() {
		return boardip;
	}
	public void setBoarddip(String boarddip) {
		this.boardip = boarddip;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDispdate() {
		return dispdate;
	}
	public void setDispdate(String dispdate) {
		this.dispdate = dispdate;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", boardtitle=" + boardtitle + ", boardcontent=" + boardcontent
				+ ", boardreadcnt=" + boardreadcnt + ", boarddate=" + boarddate + ", boarddip=" + boardip
				+ ", updatedate=" + updatedate + ", email=" + email + ", nickname=" + nickname + ", dispdate="
				+ dispdate + "]";
	}
	
}
