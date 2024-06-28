package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

public class MemberRegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public MemberRegisterServlet() {
		System.out.println("=========================");
		System.out.println("MemberRegisterServlet 생성");
		System.out.println("=========================");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("MemberRegisterServlet doPost 호출");
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String mobile = request.getParameter("mobile");
		
		String[] hobbies = request.getParameterValues("hobbies");
		
		System.out.println("name : " + name);
		System.out.println("addr : " + addr);
		System.out.println("mobile : " + mobile);
		System.out.println("hobbies : " + Arrays.toString(hobbies));
		
	}

}