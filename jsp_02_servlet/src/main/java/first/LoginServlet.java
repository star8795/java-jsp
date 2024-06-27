package first;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 98928625159857421L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET방식으로 요청이 왔을 때 호출
		System.out.println("doGet 요청 처리!");
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		
		PrintWriter out = resp.getWriter();
		out.println("<h1>uid : " + uid +"<h1>");
		out.println("<h1>upw : " + upw +"<h1>");
		
	} // end doGET

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식으로 요청이 왔을 때 호출
		System.out.println("doPost 요청 처리!");

		// 현재 로그인 요펑을 한 클라이언트에서 출력된 데이터를 입력받을 스트림
		// request 요청 본문에 전달된 데이터를 입력받아 출력
		/*
		 * InputStream is = req.getInputStream(); BufferedReader reader = new
		 * BufferedReader(new InputStreamReader(is));
		 * 
		 * String data = ""; while((data = reader.readLine()) != null) {
		 * System.out.println(data); String[] parameters = data.split("&");
		 * System.out.println(Arrays.toString(parameters)); } // end read
		 * System.out.println("===================");
		 */

		// request 사용자 요청 객체로 전달된 데이터 읽기
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		System.out.println("uid : " + uid);
		System.out.println("upw : " + upw);

		// 요청 처리 응답
		// Response
		// - 요청을 전달한 클라이언트에게 처리된 결과를 출력해주기 위한 정보를 저장하는 객체
		// 지금부터 출력될 데이터는 html 형식의 문서임을 명시
		resp.setContentType("text/html");
		// resp.setContentType("text/plain");
		/*
		 * MIME Type(대분류/확장자) : Multipurpose Internet Mail Extensions -> 다목적의 인터넷 메일
		 * 확장자들
		 */
		resp.setCharacterEncoding("UTF-8");
		// ctrl + shift + o
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8' />");
		out.println("<title>로그인 요청 처리 결과</title>");
		out.println("</head>");
		out.println("<body>");

		String id = "id001";
		String pass = "pw001";

		if (id.equals(uid) && pass.equals(upw)) {
			// 임의로 지정한 id pass와 일치하는 정보를 제공한 사용자
			out.println("<h1>로그인이 완료되었습니다.</h1>");
			out.println("<a href='/jsp_02_servlet/'>메인으로</a>");
		} else {
			// 일치하지 않는 사용자
			out.println("<script>");
			out.println("alert('로그인 실패! 아이디와 비밀번호를 확인하세요.');");
			out.println("history.back();");
			out.println("</script>");
		}

		out.println("</body>");
		out.println("</html>");

	} // end do Post

}