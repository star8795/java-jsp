package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.MemberDTO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * MemberService interface 구현 객체
 */
public class MemberServiceImpl implements MemberService{
	
	MemberDAO dao = new MemberDAOImpl();

	@Override
	public boolean memberJoin(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String ageParam = request.getParameter("age");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(ageParam);
		
		MemberDTO dto = new MemberDTO(id,pass,name,age,gender);
		
		boolean isSuccess = dao.memberJoin(dto);
		return isSuccess;
	}

	@Override
	public boolean memberLogin(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");
		
		MemberDTO member = dao.memberLogin(id, pass);
		
		if(member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
			if(login != null) {
				// login checkbox 체크! - 자동 로그인 수락
				byte[] bytes = Base64.getEncoder().encode(id.getBytes());
				System.out.println("원본 아이디 : " + id);
				id = new String(bytes);
				System.out.println("encoding id : " + id);
				Cookie cookie = new Cookie("id", id);
				cookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
				cookie.setPath("/"); // 현재 서버에서 쿠키를 어떤 경로에서 사용 허용 할것인지 지정
				response.addCookie(cookie);
			}
			return true;
		}
		
		return false;
	}

	@Override
	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDTO member = new MemberDTO(
			request.getParameter("id"),
			request.getParameter("pass"),
			request.getParameter("name"),
			Integer.parseInt(request.getParameter("age")),
			request.getParameter("gender")
		);
		System.out.println("update member : " + member);
		
		boolean isUpdate = dao.memberUpdate(member);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(isUpdate) {
				MemberDTO m = dao.getMemberById(member.getId());
				// 수정된 정보로 갱신
				request.getSession().setAttribute("member", m);
				
				// 수정 완료
				out.println("alert('수정 성공');");
				out.println("location.href='info.mc';");
			}else {
				// 수정 실패
				out.println("alert('수정 실패');");
				out.println("history.go(-1);");
			}
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} // end memberUpdate

	@Override
	public void withdraw(HttpServletRequest request, HttpServletResponse response) {
		// 탈퇴를 요청 한 사용자가 로그인한 사용자인지 확인하기 위한 비밀번호
		String tempPass = request.getParameter("tempPass");
		System.out.println("tempPass : " + tempPass);
		
		HttpSession session = request.getSession();
		// session에 저장된 로그인된 사용자 정보
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		try {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter print = response.getWriter();
			
			print.println("<script>");
			if(member != null && member.getPass().equals(tempPass)) {
				// 회원 탈퇴 요청 처리
				boolean isDeleted = dao.deleteMember(member.getNum());
				if(isDeleted) {
					logOut(request, response);
					print.println("alert('회원탈퇴 성공! 빠이~');");
					print.println("location.href='test';");
				}else {
					print.println("alert('정상적으로 처리못했습니다. 다시 요청해주세요.');");
					print.println("history.back();");
				}
			}else {
				// 로그인 되어 있지 않거나 비밀번호가 일치하지 않음.
				print.println("alert('회원탈퇴 실패! 정보가 일치하지 않습니다.');");
				print.println("history.go(-1);");
			}
			print.println("</script>");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		// pageContext(Servlet에는 존재하지 않음) < request < session < application		
		HttpSession session = request.getSession();
		// session.removeAttribute("member"); // 세션에 등록된 인증된 회원정보 제거
		session.invalidate(); // session 무효화
		
		// 자동로그인이 등록되어 있다면 쿠키 정보도 제거
		Cookie cookie = new Cookie("id" , "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

}




