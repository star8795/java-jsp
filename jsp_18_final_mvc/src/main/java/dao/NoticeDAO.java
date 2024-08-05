package dao;

import java.util.ArrayList;

import util.PageMaker;
import vo.NoticeVO;

/**
 * notice_board table 관련 요청 처리
 * notice_board DataBase Access Object
 */
public interface NoticeDAO {
	
	/**
	 * @return ArrayList<NoticeVO> notice_board table에 
	 * 	       저장된 모든 행정보를 List에 저장하여 반환
	 */
	ArrayList<NoticeVO> getAllList();

	/**
	 * @param noticeVO - 등록할 공지형 게시글 정보
	 * @return boolean - 작성 성공 여부 반환
	 */
	boolean noticeWrite(NoticeVO noticeVO);

	/**
	 * @param notice_num - 상세보기할 게시글 번호
	 * @return NoticeVO - 게시글 번호가 일치하는 게시글 정보
	 */
	NoticeVO getNoticeVO(int notice_num);

	/**
	 * @param noticeVO - 수정할 게시글 정보
	 * @return boolean - 게시글 수정 성공 여부를 boolean 으로 반환
	 */
	boolean noticeUpdate(NoticeVO noticeVO);

	/**
	 * @param notice_num - 삭제할 게시글 번호
	 * @return boolean - 게시글 삭제 여부를 boolean 값으로 반환
	 */
	boolean noticeDelete(int notice_num);

	/**
	 * @param startRow - notice_board table에서 검색할 시작 인덱스 번호
	 * @param perPaageNum - 한번에 보여줄 게시글 개수
	 * @return ArrayList<NoticeVO> - 페이징 처리된 게시글 목록
	 */
	ArrayList<NoticeVO> getNoticeList(int startRow, int perPageNum);

	/**
	 * @return int - notice_board 테이블에 저장된 전체 게시물 개수를 정수값으로 반환
	 */
	int getListCount();

	/**
	 * @param searchName - 검색할 column
	 * @param searchValue - 검색 키워드
	 * @return - 검색 결과내의 전체 게시물 수
	 */
	int getSearchListCount(String searchName, String searchValue);

	/**
	 * 페이징 처리된 검색 목록 - PageMaker
	 * @param pageMaker - 게시글 검색에 필요한 정보를 저장
	 * @return - ArrayList<NoticeVO> 검색된 게시글 목록을 리스트에 저장하여 반환
	 */
	ArrayList<NoticeVO> getSearchNoticeList(PageMaker pageMaker);

}
