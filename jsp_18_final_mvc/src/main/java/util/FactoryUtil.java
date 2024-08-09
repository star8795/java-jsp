package util;

import jakarta.servlet.http.HttpServletRequest;

public interface FactoryUtil {

	/**
	 * @param request - 요청 정보
	 * @return - 전체 요청 정보에서 특정 요청에 대한 구분 문자열만 반환
	 */
	public static String getCommand(HttpServletRequest request) {
		return request.getRequestURI().substring(request.getContextPath().length() + 1);
	}
	
}










