package service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 데이터 처리에 필요한 알맞은 정보를 가공하는 과정을 처리할 클래스
 * == 비즈니스 로직을 수행한다.
 * Service
 */
public interface MemberService {

	/**
	 * 회원가입 요청 처리
	 * @param - request - 회원가입에 필요한 정보를 저장
	 * @return boolean - 참 : 회원가입 성공, 거짓 : 회원가입 실패
	 */
	boolean memberJoin(HttpServletRequest request);
	
	/**
	 * 로그인 처리
	 * @param - 리퀘스트 로그인 요청 처리에 필요한 파라미터 정보
	 * @param - 리스폰 로그인 요청 처리에 필요한 응답 정보 - 쿠키 처리
	 * @return -  로그인 성공 여부
	 */
	boolean memberLogin(HttpServletRequest request, HttpServletResponse response);
	
}