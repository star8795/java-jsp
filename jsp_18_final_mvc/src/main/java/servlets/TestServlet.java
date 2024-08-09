package servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test test1 GET 요청");
		
		String requestPath = request.getRequestURI();
		// /jsp_18_final_mvc/test1?test=hello
		System.out.println("전체 요청 경로 : " + requestPath);
		
		// /jsp_18_final_mvc
		String contextPath = request.getContextPath();
		System.out.println("요청 프로젝트 경로 : " + contextPath);
		
		String command = requestPath.substring(contextPath.length() + 1);
		System.out.println("요청 URL : " + command);
		
		if(command.equals("test")) {
			request.setAttribute("test", "Test Param");
		}else {
			String test = request.getParameter("test");
			request.setAttribute("test", test);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
		rd.forward(request,response);
		
		/*
		PrintWriter out = response.getWriter();
		out.println("<h1>Hello Everyone</h1>");
		*/
		
	}

}











