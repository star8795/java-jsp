package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RedirectServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Redirect Servlet Service 호출");
		// 요청 전송 방식
		String method = request.getMethod();
		System.out.println("요청 전송 방식 : " + method);  // GET, POST
		// 대소문자 상관없이 알파벳 비교
		if(method.equalsIgnoreCase("get")) {
			doGet(request,response);
		}else {
			doPost(request,response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RedirectServlet doGet 호출");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RedirectServlet doPost 호출");
		String id = request.getParameter("id");
		System.out.println("param : " + id);
		// request 속성 추가 
		request.setAttribute("attrID", id);
		
		// 응답 객체를 통해 직접 출력할 페이지를 구성하지 않고 
		// 만들어진 페이지를 출력하도록 브라우저에 재요청 전달.
		
		// 응답 코드 설정
		// response.setStatus(302); 
		// 302 Location으로 전달된 페이지로 재요청
		// 헤더 부가 정보 추가
		// response.setHeader("Location", "response.jsp");
		response.sendRedirect("response.jsp");
	}

}