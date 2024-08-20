package util;

// 게시물 페이징 전용 클래스
public class Criteria {
	
	private int page;		// 현재 페이지
	private int perPageNum; // 한 페이지에 보여줄 게시글의 개수
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		System.out.println("setPage 호출");
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
		System.out.println("setPerPageNum 호출");
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	// 게시물 검색시 limit 시작 번호 
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
