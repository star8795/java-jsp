package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @WebServlet("*.do")
public class NoticeControllerBackup extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextPage = null;

		boolean isSuccess = false;

		// 요청 처리 성공시 보여줄 화면
		String suc = "/board/notice/notice_success.jsp";
		// 요청 처리 실패 시 보여줄 화면
		String fail = "/board/notice/notice_fail.jsp";

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
