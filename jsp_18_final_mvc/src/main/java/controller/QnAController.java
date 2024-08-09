package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.QnABoardService;
import util.FactoryUtil;
import vo.BoardVO;

// Question And Answer Board Controller
@WebServlet("*.qna")
public class QnAController extends HttpServlet{

	private static final long serialVersionUID = -1837555412460714904L;
	
	QnABoardService service = new QnABoardService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = FactoryUtil.getCommand(request);
		System.out.println("QnAController 요청 처리 : " + command);
		
		String nextPage = null;
		
		if(command.equals("boardListPage.qna")) {
			ArrayList<BoardVO> boardList = service.boardPageList(request);
			request.setAttribute("boardList", boardList);
			nextPage = "/board/qna/qna_list.jsp";
		}
		
		if(command.equals("boardList.qna")) {
			ArrayList<BoardVO> boardList = service.boardAllList();
			request.setAttribute("boardList", boardList);
			nextPage = "/board/qna/qna_list.jsp";
		}
		
		if(command.equals("boardWrite.qna")) {
			nextPage = "/board/qna/qna_write.jsp";
		}
		
		if(command.equals("boardWriteSubmit.qna")) {
			// 게시글 등록 요청 처리
			boolean isSuccess = service.boardWrite(request);
			if(isSuccess) {
				response.sendRedirect("boardList.qna");
				return;
			}else {
				request.setAttribute("msg", "게시글 등록 실패");	
				nextPage = "/board/qna/qna_write.jsp";
			}
		}
		
		// 상세보기 페이지 요청
		if(command.equals("boardDetail.qna")) {
			BoardVO board = service.getBoardByNum(request);
			request.setAttribute("board", board);
			nextPage = "/board/qna/qna_detail.jsp";
		}
		
		// 조회수 증가
		if(command.equals("boardRead.qna")) {
			int qnaNum = service.updateReadCount(request);
			response.sendRedirect("boardDetail.qna?qnaNum="+qnaNum);
			return;
		}
		
		// 게시글 작성자가 게시글 수정 페이지 요청
		if(command.equals("boardUpdateForm.qna")) {
			BoardVO board = service.getBoardByNum(request);
			request.setAttribute("board", board);
			nextPage = "/board/qna/qna_update.jsp";
		}
		
		// 게시글 수정 요청 처리
		if(command.equals("boardUpdate.qna")) {
			// 게시글 수정 완료 후 상세보기 페이지로 이동 
			int qnaNum = service.boardUpdate(request);
			if(qnaNum > 0) {
				response.sendRedirect("boardDetail.qna?qnaNum="+qnaNum);
			}else {
				response.sendError(403,"처리할 수 없는 사용자입니다.");
			}
			return;
		}
		
		// 게시글 삭제 요청 처리
		if(command.equals("boardDelete.qna")) {
			int qnaNum = service.boardDelete(request);
			if(qnaNum > 0) {
				response.sendRedirect("boardDetail.qna?qnaNum="+qnaNum);
			}else {
				response.sendRedirect("boardList.qna");
			}
			return;
		}
		
		// 답변글 작성 페이지 요청
		if(command.equals("boardReply.qna")) {
			BoardVO board = service.getBoardByNum(request);
			request.setAttribute("board", board); // 원본 글 정보
			nextPage = "/board/qna/qna_reply.jsp";
		}
		
		// 답변글 작성 요청 처리
		if(command.equals("boardReplySubmit.qna")) {
			service.boardReply(request);
			response.sendRedirect("boardList.qna");
			return;
		}
		
		if(nextPage != null) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			response.sendError(404, "처리 할 수 없는 요청 입니다.");
		}
	}
	
	

}
















