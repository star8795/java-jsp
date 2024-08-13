package filters;

import java.io.IOException;

import dao.MemberDAO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;

public class CheckCookieFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = -6746943554017516750L;
	
	MemberDAO dao;
	
	/**
	 * url-pattern 에 지정된 형식에 맞는 요청 마다 호출되는 method
	 */
	public void doFilter(
			ServletRequest req, 
			ServletResponse res, 
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		
		chain.doFilter(req, res);
		
	}
	
}
