package service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 데이터 처리에 필요한 알맞은 정보를 가공하는 과정을 처리할 class
 * == 비지니스 로직을 수행한다.
 * Service
 * @since 2024-07-30
 */
public interface MemberService {
	
	/**
	 * 회원 가입 요청 처리
	 * @param - request - 회원 가입에 필요한 정보를 저장
	 * @return boolean - true : 회원가입 성공, false : 회원가입 실패
	 */
	boolean memberJoin(HttpServletRequest request);
	
	/**
	 * 로그인 처리
	 * @param - request 로그인 요청 처리에 필요한 parameter 정보
	 * @param - response 로그인 요청 처리에 필요한 응답 정보 - 쿠키 처리
	 * @return - 로그인 성공 여부
	 */
	boolean memberLogin(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * @param request - 회원 정보 수정 처리에 필요한 파라미터 정보 
	 * @param response - 요청 처리 결과에 따른 응답
	 */
	void memberUpdate(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * @param request - 회원 탈퇴 시 사용자가 입력한 비밀번호 일치여부 판단
	 * @param response - 회원탈퇴 요청 처리에 따른 응답.
	 */
	void withdraw(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * @param request - 로그아웃 요청 처리에 필요한 Session 정보
	 * @param response - 쿠키 정보 삭제를 위한 정보
	 */
	void logOut(HttpServletRequest request, HttpServletResponse response);

}















