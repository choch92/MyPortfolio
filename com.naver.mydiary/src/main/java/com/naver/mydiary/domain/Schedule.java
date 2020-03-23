package com.naver.mydiary.domain;

public class Schedule {

	private int num;
	private String startDate;
	private String endDate;
	private String loc;
	private String detail;
	private String category;
	private String email;


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Schedule [num=" + num + ", startDate=" + startDate + ", endDate=" + endDate + ", loc=" + loc
				+ ", detail=" + detail + ", category=" + category + ", email=" + email + "]";
	}


	
}
