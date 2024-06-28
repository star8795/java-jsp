package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

public class MemberRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public MemberRegisterServlet() {
		System.out.println("=========================");
		System.out.println("MemberRegisterServlet 생성");
		System.out.println("=========================");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("MemberRegisterServlet doPost 호출");
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String mobile = request.getParameter("mobile");

		String[] hobbies = request.getParameterValues("hobbies");

		System.out.println("name : " + name);
		System.out.println("addr : " + addr);
		System.out.println("mobile : " + mobile);
		System.out.println("hobbies : " + Arrays.toString(hobbies));

		// MIME type, Media type
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		// images/png, images/gif
		// video/mp4...

		// 요청 처리 응답
		PrintWriter out = response.getWriter();
		out.println("이름 : " + name + "<br/>");
		out.println("주소 : " + addr + "<br/>");
		out.println("전환번호 : " + mobile + "<br/>");
		out.println("선택한 취미 : " + Arrays.toString(hobbies) + "<br/>");
		out.println("<a href='index.html'>메인으로</a>");

	} // end doPost()

}