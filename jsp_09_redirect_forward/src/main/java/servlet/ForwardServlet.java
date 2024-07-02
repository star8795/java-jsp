package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forward")
public class ForwardServlet extends HttpServlet {

	private static final long serialVersionUID = 7396539970228569232L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("forward doGET 호출");
		String queryString = request.getQueryString();
		System.out.println("queryString : " + queryString);
		String id = request.getParameter("id");
		System.out.println("forward param id : " + id);

		request.setAttribute("attrID", id);

		// forward 방식으로 화면 전환
		RequestDispatcher rd = request.getRequestDispatcher("response.jsp");
		rd.forward(request, response);
	}

}