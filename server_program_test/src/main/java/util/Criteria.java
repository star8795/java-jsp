package util;
// 기준!!
// DB에서 검색 할 행의 정보를 처리할 class
// 정렬 기준을 잡기 위한 현재 page정보를 저장
public class Criteria {

	private int page;		//요청이 들어온 현재 페이지 번호
	private int perPageNum; // 한페이지에 보여줄 게시물 수
	
	public Criteria() {
		this(1,5);
	}

	public Criteria(int page, int perPageNum) {
		setPage(page);
		setPerPageNum(perPageNum);
	}
	
	public int getPage() {
		return page;
	}
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
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	// 시작 row index 번호 // limit getStartRow, perPageNum
	public int getStartRow() {
		return (this.page-1) * perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}










