package com.naver.mydiary.domain;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	// 하단 페이지 번호의 갯수를 의미
	private int displayPageNum = 5;	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	// 페이징 처리 클래스를 호출
	private Criteria criteria;
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	// 게시글 전체 갯수
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// 게시글의 전체 갯수가 설정되는 시점에 calcData() 메서드를 호출하여 필요한 데이터들을 계산
		calcData();
	}
	
	private void calcData() {
		// 끝 페이지 번호의 계산
		// 끝 페이지 번호 = Math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이지 번호의 갯수
		endPage = (int)(Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);
		
		// 시작 페이지 설정
		startPage = (endPage - displayPageNum) + 1;
		
		// 끝 페이지 번호 보정 계산식
		// 끝 페이지 번호 = Math.ceil(전체 게시글 갯수 / 페이지 당 출력할 게시글 갯수)
		int tempEndPage = (int)(Math.ceil(totalCount / (double)criteria.getPerPageNum()));
		
		// 이전의 결과 값과 보정된 결과 값을 비교 후 , 보정한 결과 값을 페이지 끝 번호 변수에 저장
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// 이전 링크의 경우 시작 페이지 번호가 1인지 아닌지 검사하는 것
		// 삼항 연사자를 통해 1이면 false값, 아니면 true값을 가지도록 함.
		prev = startPage == 1 ? false : true;
	
		// 다음 링크 = 끝페이지 * 페이지 당 출력할 게시글의 갯수 >= 전체 게시글의 갯수 ? false : true;
		next = endPage * criteria.getPerPageNum() >= totalCount ? false :  true;

	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + "]";
	}
}
