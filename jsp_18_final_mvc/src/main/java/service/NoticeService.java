package service;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import vo.NoticeVO;

public interface NoticeService {
	
	/**
	 * @return - 페이징 처리 없는 전체 게시글 목록을 List로 반환
	 */
	ArrayList<NoticeVO> noticeAllList();

	// 게시글 등록
	/**
	 * @param request - 게시글 작성 에 필요한 데이터 전달
	 * @return 게시글 작성 여부 true 성공, false 실패
	 */
	boolean noticeWrite(HttpServletRequest request);

	// 게시글 목록
	/**
	 * @param request - 게시글 목록을 호출 하기 위한 정보 전달 
	 * 				  - page - 목록 검색 후 request에 리스트 정보 저장 - key name : noticeList
	 * 				  - 페이징 처리를 위한 pageMaker 정보 저장 - key name : pm
	 */
	ArrayList<NoticeVO> noticeList(HttpServletRequest request);

	// 게시글 상세보기
	/**
	 * @param request - 한개의 게시글 상세보기를 위한 정보를 전달 - 게시물 번호 - 목록 검색 후 request에 리스트 정보
	 *                저장 - key name : notice
	 */
	NoticeVO noticeDetail(HttpServletRequest request);

	// 게시글 수정
	/**
	 * @param request - 게시글 수정 에 필요한 데이터 전달
	 * @return 게시글 수정 여부 true 성공, false 실패
	 */
	boolean noticeUpdate(HttpServletRequest request);

	// 게시글 등록
	/**
	 * @param request - 게시글 삭제에 필요한 데이터 전달 - 게시글 번호
	 * @return 게시글 삭제 여부 true 성공, false 실패
	 */
	boolean noticeDelete(HttpServletRequest request);
	
	/**
	 * @param request - 검색에 필요한 파라미터 전달, searchName, searchValue, page, perPageNum
	 * @return  - 검색된 게시글 목록을 List로 반환
	 */
	ArrayList<NoticeVO> search(HttpServletRequest request);
	
}
