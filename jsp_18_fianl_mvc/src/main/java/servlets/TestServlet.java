package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test test1 GET 요청");
		
		String requestPath = request.getRequestURI();
		System.out.println("전체 요청 경로 : " + requestPath);
		
		String contextPath = request.getContextPath();
		System.out.println("요청 프로젝트 경로 : " + contextPath);
		
		String command = requestPath.substring(contextPath.length() + 1);
		System.out.println("요청 URL : " + command);
		
		if(requestPath.equals("/jsp_18_fianl_mvc/test")) {
			request.setAttribute("test", "Test Param");
		}else {
			String test = request.getParameter("test");
			request.setAttribute("test", test);
		}
		
		String test = request.getParameter("test");
		
		request.setAttribute("test", test);
		
		RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
		rd.forward(request, response);
		/*
		PrintWriter out = response.getWriter();
		out.println("<h1>Hello Everyone</h1>");
		*/
	}

}
