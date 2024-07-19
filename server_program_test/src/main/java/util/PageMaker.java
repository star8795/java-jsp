package util;

// 페이징 처리 정보
public class PageMaker {
	private int totalCount; 	// 전체 게시물의 수
	private int startPage;		// 시작 페이지 블럭 번호
	private int endPage;		// 마지막 페이지 블럭 번호
	private int displayPageNum;	// 한번에 보여줄 블럭 수
	private int maxPage;		// 전체 페이지 블럭 수
	private boolean prev;		// 이전 페이지 존재 유무
	private boolean next;		// 다음 페이지 존재 유무
	
	Criteria cri;				// 정렬기준과 현재페이지에 대한 정보 저장
	
	public PageMaker() {
		this.cri = new Criteria();
	}
	
	// [1][2][3][4][5]
	public void calcPaging() {
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum)
				* displayPageNum;
		startPage = (endPage - displayPageNum)+1;
		
		maxPage = (int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		prev = (endPage - displayPageNum <= 0) ? false : true;
		next = (endPage == maxPage) ? false : true;
	}
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}
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
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calcPaging();
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", displayPageNum=" + displayPageNum + ", maxPage=" + maxPage + ", prev=" + prev + ", next=" + next
				+ ", cri=" + cri + "]";
	}
	
}













