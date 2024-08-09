package filters;

import java.io.IOException;
import java.util.Base64;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.MemberDTO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class CheckCookieFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = -6746943554017516750L;
	
	MemberDAO dao = new MemberDAOImpl();
	// 자동 로그인에 사용할 쿠키 이름 저장
    String cookieName;
    // 인코딩 사용 여부 저장
    boolean encoding;

	public CheckCookieFilter() {
    	System.out.println("CheckCookieFilter 생성");
    }

	/**
	 * Filter 객체 생성 후 웹 서비스 구동전 최초에 한번 호출
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter init() 호출");
		cookieName = fConfig.getInitParameter("cookieName");
		System.out.println("cookieName : " + cookieName);
		// "true" , "false" ==> boolean type으로 변환
		encoding = Boolean.parseBoolean(fConfig.getInitParameter("encoding"));
		System.out.println("encoding : " + encoding);
	}
	
	/**
	 * url-pattern 에 지정된 형식에 맞는 요청 마다 호출되는 method
	 */
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {
		System.out.println("CheckCookieFilter - 전처리");
		HttpServletRequest req = (HttpServletRequest)request;
		
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null) {
			/*
			for(int i = 0; i < cookies.length; i++) {
				cookies[i];
			*/
			for(Cookie c : cookies) {
				if(c.getName().equals(cookieName)) {
					String id = c.getValue();
					
					if(encoding){
						// encoding 사용으로 지정되었을 경우
						byte[] bytes = Base64.getDecoder().decode(id.getBytes());
						id = new String(bytes);
						System.out.println("Filter decoding id - " + id);
					}
					
					// aWQwMDE=
					System.out.println("filter - id : " + id);
					MemberDTO member = dao.getMemberById(id);
					if(member != null) {
						HttpSession session = req.getSession();
						session.setAttribute("member", member);
					}
					break;
				}
			} // 쿠키 정보가 등록된 배열 순회
		} // 쿠키목록이 존재할때
		
		
		chain.doFilter(request, response);
		System.out.println("CheckCookieFilter - 후처리");
		String msg = (String)request.getAttribute("msg");
		System.out.println("filter - msg : " + msg);
		request.setAttribute("test", "Filter Message");
	}
	
	/**
	 * Filter instance 제거 될때 마지막에 한번 호출
	 */
	public void destroy() {
		System.out.println("Filter destroy() 호출");
	}

}
