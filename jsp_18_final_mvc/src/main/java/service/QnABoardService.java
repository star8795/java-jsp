package service;

import java.util.ArrayList;

import dao.QnABoardDAO;
import jakarta.servlet.http.HttpServletRequest;
import util.Criteria;
import util.PageMaker;
import vo.BoardVO;

public class QnABoardService {
	
	private QnABoardDAO dao = new QnABoardDAO();
	
	/**
	 * @param request - qna_board table 등록할 파라미터 정보
	 * @return boolean - 게시글 등록 성공 여부를 boolean type으로 반환 
	 */
	public boolean boardWrite(HttpServletRequest request) {
		String num = request.getParameter("qna_writer_num");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		
		int qna_writer_num = Integer.parseInt(num);
		return dao.boardWrite(qna_title, qna_content, qna_writer_num);
	}

	/**
	 * @return - ArrayList<BoardVO> qna_board table의 전체 게시글 목록 반환
	 */
	public ArrayList<BoardVO> boardAllList() {
		return dao.getBoardAllList();
	}

	/**
	 * @param request - 검색할 게시글 번호 : qnaNum
	 * @return BoardVO - 검색된 게시글 정보
	 */
	public BoardVO getBoardByNum(HttpServletRequest request) {
		String paramNum = request.getParameter("qnaNum");
		int qnaNum = Integer.parseInt(paramNum);
		return dao.getBoardVO(qnaNum);
	}

	/**
	 * @param request - 게시글 수정에 필요한 파라미터 
	 *                  qnaNum, qnaTitle, qnaContent, qnaWriterNum
	 * @return int - 수정한 게시글 번호
	 */
	public int boardUpdate(HttpServletRequest request) {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		int qnaWriterNum = Integer.parseInt(request.getParameter("qnaWriterNum"));
		
		BoardVO board = new BoardVO();
		board.setQnaNum(qnaNum);
		board.setQnaTitle(qnaTitle);
		board.setQnaContent(qnaContent);
		board.setQnaWriterNum(qnaWriterNum);
		
		boolean isUpdate = dao.boardUpdate(board);
		
		return isUpdate ? qnaNum : 0;
	}

	/**
	 * @param request - 삭제할 게시글 번호
	 * @return int - 삭제 요청 처리 실패 한 게시글 번호 or 0(삭제 성공 시) 
	 */
	public int boardDelete(HttpServletRequest request) {
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		boolean isDeleted = dao.boardDelete(qnaNum);
		return isDeleted ? 0 : qnaNum;
	}

	/**
	 * @param request - 답변글 작성에 필요한 파라미터 정보 전달
	 */
	public void boardReply(HttpServletRequest request) {
		int qnaReRef = Integer.parseInt(request.getParameter("qnaReRef"));
		int qnaReSeq = Integer.parseInt(request.getParameter("qnaReSeq"));
		int qnaReLev = Integer.parseInt(request.getParameter("qnaReLev"));
		int qnaWriterNum = Integer.parseInt(request.getParameter("qnaWriterNum"));
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		BoardVO vo = new BoardVO();
		vo.setQnaWriterNum(qnaWriterNum);
		vo.setQnaTitle(qnaTitle);
		vo.setQnaContent(qnaContent);
		vo.setQnaReRef(qnaReRef);
		vo.setQnaReSeq(qnaReSeq);
		vo.setQnaReLev(qnaReLev);
		
		dao.boardReply(vo);
	}

	/**
	 * @param request - 페이징 처리에 필요한 페이지 번호
	 * @return ArrayList<BoardVO> - 페이징 처리된 게시글 목록
	 */
	public ArrayList<BoardVO> boardPageList(HttpServletRequest request) {
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Criteria cri = new Criteria(page, 10);
		
		ArrayList<BoardVO> boardList = dao.getBoardList(cri);
		
		// 전체 게시물 개수 
		int listCount = dao.getListCount();
		
		PageMaker pm = new PageMaker();
		pm.setDisplayPageNum(5);
		pm.setCri(cri);
		pm.setTotalCount(listCount);
		
		request.setAttribute("pm", pm);
		
		return boardList;
	}

	/**
	 * @param request - 조회수를 증가 시킬 게시글 번호
	 * @return int - 게시글 번호
	 */
	public int updateReadCount(HttpServletRequest request) {
		
		int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
		
		dao.updateReadCount(qnaNum);
		
		return qnaNum;
	}
	
}












