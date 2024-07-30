package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FactoryUtil;

/**
 * 회원 관련 요청 처리
 */
@WebServlet("*.mc")
public class MemberController extends HttpServlet{

	private static final long serialVersionUID = 7807099506362753862L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberController GET 요청");
		
		String requestURI = req.getRequestURI();		// 전체 요청 경로
		String contextPath = req.getContextPath();		// 프로젝트(context) 경로
		String command = requestURI.substring(contextPath.length());
		System.out.println("요청 : " + command);

		String nextPage = null;
		
		if(command.equals("/login.mc")) {
			nextPage = "/member/login.jsp";
		}
		
		if(command.equals("/join.mc")) {
			nextPage = "/member/join.jsp";
		}
		
		
		if(nextPage != null) {
			RequestDispatcher rd = req.getRequestDispatcher(nextPage);
			rd.forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberController POST 요청");
		
		String command = FactoryUtil.getCommand(req);
		
		String nextPage = null;
		
		if(command.equals("join.mc")) {
			
		}
	}
	
}