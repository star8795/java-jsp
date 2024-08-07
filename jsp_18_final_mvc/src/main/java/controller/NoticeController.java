package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.NoticeService;
import service.NoticeServiceImplement;
import util.FactoryUtil;
import vo.NoticeVO;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	NoticeService service = new NoticeServiceImplement();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// *.do pattern에서 어떤 요청이 들어왔는지 분류
		// contextPath를 포함한 전체 요청 경로
		/*
		String requestURI = request.getRequestURI();
		// 변경 가능한 프로젝트별 요청 경로(path)
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 1);
		*/
		String command = FactoryUtil.getCommand(request); 
		System.out.println("공지 Controller 요청 정보 : " + command);
		
		String nextPage = null;

		boolean isSuccess = false;

		// 요청 처리 성공시 보여줄 화면
		String suc = "/board/notice/notice_success.jsp";
		// 요청 처리 실패 시 보여줄 화면
		String fail = "/board/notice/notice_fail.jsp";
		
		if(command.equals("notice.do")) {
			// List<NoticeVO> noticeList = service.noticeAllList();
			// 페이징 처리된 게시글 목록
			List<NoticeVO> noticeList = service.noticeList(request);
			request.setAttribute("noticeList", noticeList);		
			nextPage = "/board/notice/notice_list.jsp";
		}
		
		// 게시글 작성 페이지 요청 - noticeWriteForm.do
		if(command.equals("noticeWriteForm.do")) {
			nextPage = "/board/notice/notice_write.jsp";
		}
		
		// 작성된 공지 게시글 등록 요청  - noticeWrite.do
		if(command.equals("noticeWrite.do")) {
			isSuccess = service.noticeWrite(request);
			// 정상적으로 게시글 등록이 완료 되었으면 성공 페이지 , 등록이 실패 하면 실패 페이지
			nextPage = isSuccess ? suc : fail;
		}
		
		// 상세보기 페이지 요청 처리 - noticeDetail.do
		if(command.equals("noticeDetail.do")) {
			NoticeVO notice = service.noticeDetail(request);
			request.setAttribute("notice", notice);
			nextPage = "/board/notice/notice_detail.jsp";
		}
		
		// notice_num 번호가 일치하는 게시글 정보 수정 페이지 요청 - noticeUpdateForm.do
		if(command.equals("noticeUpdateForm.do")) {
			NoticeVO notice = service.noticeDetail(request);
			request.setAttribute("notice", notice);
			nextPage = "/board/notice/notice_update.jsp";
		}
		
		// 게시글 수정 요청 처리 - noticeUpdate.do
		if(command.equals("noticeUpdate.do")) {
			isSuccess = service.noticeUpdate(request);
			if(isSuccess) {
				nextPage = suc;
			}else {
				nextPage = fail;
			}
		}
		
		// 게시글 삭제 요청 처리 - noticeDelete.do
		if(command.equals("noticeDelete.do")) {
			nextPage = service.noticeDelete(request) ? suc : fail;
		}
		
		//  검색된 게시글 목록 - noticeSearch.do
		if(command.equals("noticeSearch.do")) {
			// 검색된 게시글 목록
			ArrayList<NoticeVO> noticeList = service.search(request);
			request.setAttribute("noticeList", noticeList);
			nextPage = "/board/notice/notice_list.jsp";
		}
		
		if(nextPage != null) {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}else {
			request.getRequestDispatcher(fail).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}











