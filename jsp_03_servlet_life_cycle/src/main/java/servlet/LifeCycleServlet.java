package servlet;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LifeCycleServlet extends HttpServlet {

	private static final long serialVersionUID = 2117214983822497285L;

	public LifeCycleServlet() {

		System.out.println("LifeCycleServlet 생성");
		/*
		Class<LifeCycleServlet> servlet = Class.forName("servlet.LifeCycleServlet");
		LifeCycleServlet clazz = servlet.newInstance();
		*/
	}

	// Servlet Class의 인스턴스가 생성되고 요청 처리할 준비가 완료되면 최초에 한번 호출되는 메소드
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("LifeCycleServlet init() 호출");
		String servletName = config.getServletName();
		System.out.println("Servlet Name : " + servletName);
		// servlet이 등록된 전체 애플리케이션 정보
		// 생성된 프로젝트 별로 한개의 컨택스트 객체 생성하여 공유
		ServletContext application = config.getServletContext();
		String contextPath = application.getContextPath();
		System.out.println("context path : " + contextPath);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LifeCycleServlet service 호출");
		// super.service(request, response);
		// 요청 전송 방식 - GET, POST
		String method = request.getMethod();
		System.out.println("요청 전송 방식 : " + method);
		if(method.equalsIgnoreCase("GET")) {
			doGet(request, response);
		}else {
			doPost(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LifeCycleServlet doGet 호출");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LifeCycleServlet doPost 호출");
	}

	@Override
	public void destroy() {
		System.out.println("LifeCycleServlet destory 호출");
	}

}