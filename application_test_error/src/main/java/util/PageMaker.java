package util;

public class PageMaker {
	
	private int totalCount;			// 전체 게시물의 개수
	private int startPage;			// 게시판의 화면에 보여질 시작 페이지 번호
	private int endPage;			// 게시판의 화면에 보여질 마지막 페이지 번호
	private boolean first;			// 첫 페이지 버튼 활성화 여부
	private boolean last;			// 마지막 페이지 버튼 활성화 여부
	private boolean prev;			// 이전 페이지 버튼 활성화 여부
	private boolean next;			// 다음 페이지 버튼 활성화 여부
	private int displayPageNum=5;	// 한번에 보여줄 페이지 개수
	private int maxPage;
	
	private Criteria cri;			// 게시물 검색 정보
	
	public PageMaker() {
		this(0);
	}
	
	public PageMaker(int totalCount) {
		this(new Criteria(),totalCount);
	}
	
	public PageMaker(Criteria cri , int totalCount) {
		setCri(cri);
		setTotalCount(totalCount);
	}
	
	public void calcPaging() {
		
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum;
		
		startPage = (endPage - displayPageNum)+1;
		
		maxPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage > maxPage)endPage = maxPage;
		
		first = startPage > 1 ? true : false;
		
		last = (cri.getPage() < maxPage) ? true : false;

		prev = (endPage - displayPageNum <= 0) ? false : true;
		
		next = (endPage == maxPage) ? false : true;
		
	}
	
	public int getMaxPage() {
		return maxPage;
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

	public int getEndPage() {
		return endPage;
	}
	
	public boolean isFirst() {
		return first;
	}

	public boolean isLast() {
		return last;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		if(cri == null){
			setCri(new Criteria());
		}
		this.displayPageNum = displayPageNum;
		calcPaging();
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", first="
				+ first + ", last=" + last + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", maxPage=" + maxPage + ", cri=" + cri + "]";
	}
	
}
