package com.naver.mydiary.domain;

public class Criteria {

	private int page;
	private int perPageNum;
	
	// 시작 페이지 설정 : page = 1
	// 페이지 당 출력할 게시글 갯수 : perPageNum = 5
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}
	
	public int getPage() {
		return page;
	}
	
	// 시작 페이지가 0이면 1로 변경해주는 셋팅
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 50) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	// 현재 페이지의 시작 게시글 번호 = (현재 페이지 번호 - 1) * 페이지 당 출력할 게시글의 갯수
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
