package service;

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
				byte[] bytes = Base64.getEncoder().encode(id.getBytes());
				System.out.println("원본 아이디 : " + id);
				id = new String(bytes);
				System.out.println("encoding id : " + id);
				Cookie cookie = new Cookie("id", member.getId());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			return true;
		}
		
		return false;
	}

	@Override
	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void withdraw(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
