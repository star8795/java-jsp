package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;
import util.FactoryUtil;

/**
 * 회원 관련 요청 처리
 */
@WebServlet("*.mc")
public class MemberController extends HttpServlet{

	private static final long serialVersionUID = 7807099506362753862L;
	
	MemberService ms = new MemberServiceImpl();

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
		
		if(command.equals("/logOut.mc")) {
			System.out.println(" 로그아웃 요청 처리 ");
			ms.logOut(req, resp);
			resp.sendRedirect(contextPath+"/login.mc");
		}
		
		if(command.equals("/info.mc")) {
			// 회원 정보 페이지 요청
			nextPage = "/member/info.jsp";
		}
		
		if(command.equals("/update.mc")) {
			// 회원정보 수정 페이지 요청
			nextPage = "/member/update.jsp";
		}
		
		if(command.equals("/withdraw.mc")) {
			// 회원 탈퇴 요청
			nextPage = "/member/withdraw.jsp";
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
			
			boolean isJoin = ms.memberJoin(req);
			
			if(isJoin) {
				req.setAttribute("msg", "회원가입 성공!");
				nextPage = "/member/login.jsp";
			}else {
				req.setAttribute("msg", "회원가입 실패!");
				nextPage = "/member/join.jsp";
			}
		}
		
		if(command.equals("login.mc")) {
			// 로그인 처리요청
			boolean isLogin = ms.memberLogin(req, resp);
			if(isLogin) {
				// 메인 페이지로 이동
				resp.sendRedirect(req.getContextPath());
			}else {
				req.setAttribute("msg", "로그인 실패");
				nextPage = "/member/login.jsp";
			}
		} // login.mc
		
		if(command.equals("update.mc")) {
			// 작성된 내용으로 회원 정보 수정 요청 처리
			ms.memberUpdate(req, resp);
		}
		
		if(command.equals("withdrawSubmit.mc")) {
			// 회원 탈퇴 요청 처리
			ms.withdraw(req, resp);
		}
		
		if(nextPage != null) {
			req.getRequestDispatcher(nextPage).forward(req, resp);
		}
		
		
	} // end doPost
	
}

















