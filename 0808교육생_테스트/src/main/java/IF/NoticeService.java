package IF;

import java.util.List;

import VO.NoticeVO;
import jakarta.servlet.http.HttpServletRequest;

public interface NoticeService {

    /**
     * 전체 게시글 목록을 반환합니다.
     * 
     * @return ArrayList<NoticeVO> - 페이징 처리 없는 전체 게시글 목록을 List로 반환
     */
    List<NoticeVO> noticeAllList();

    /**
     * 게시글을 등록합니다.
     * 
     * @param request - 게시글 작성에 필요한 데이터 전달
     * @return boolean - 게시글 작성 성공 여부 : true 성공, false 실패
     */
    boolean noticeWrite(HttpServletRequest request);

    /**
     * 페이징 처리된 게시글 목록을 반환합니다.
     * 
     * @param request - 게시글 목록을 호출하기 위한 List 정보 전달, 페이징 처리를 위한 pageMaker 정보 저장 - key name : pageMaker
     * @return List<NoticeVO> - 페이징 처리된 게시글 목록을 List로 반환
     */
    List<NoticeVO> noticeList(HttpServletRequest request);

    /**
     * 한 개의 게시글 상세 정보를 반환합니다.
     * 
     * @param request - 한 개의 게시글 상세보기를 위한 정보를 전달, 게시물 번호 - 목록 검색 후 request에 게시글 정보를 저장하는 NoticeVO 객체 저장 - key name : notice
     * @return NoticeVO - 검색된 한 행의 게시글 정보
     */
    NoticeVO noticeDetail(HttpServletRequest request);

    /**
     * 게시글을 수정합니다.
     * 
     * @param request - 게시글 수정에 필요한 데이터 전달
     * @return boolean - 게시글 수정 여부 : true 성공, false 실패
     */
    boolean noticeUpdate(HttpServletRequest request);

    /**
     * 게시글을 삭제합니다.
     * 
     * @param request - 게시글 삭제에 필요한 데이터 전달 - 게시글 번호
     * @return boolean - 게시글 삭제 여부 : true 성공, false 실패
     */
    boolean noticeDelete(HttpServletRequest request);

    /**
     * 검색된 게시글 목록을 반환합니다.
     * 
     * @param request - 검색에 필요한 파라미터 전달, searchName, searchValue, page, perPageNum
     * @return List<NoticeVO> - 검색된 게시글 목록을 List로 반환
     */
    List<NoticeVO> search(HttpServletRequest request);
}
