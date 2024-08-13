package dao;

import vo.MemberVO;

public interface MemberDAO {

	/**
	 * @implNote - 회원 정보 등록 test_mvc
	 * @param member - 회원 등록에 필요한 정보를 저장한 객체 
	 * @return boolean - 테이블에 회원정보 삽입 성공 여부, true : 등록 성공, false : 등록 실패
	 */
	boolean memberJoin(MemberVO member);
	
	/**
	 * @implNote - 로그인 요청 처리
	 * @param id - 인증할 사용자 아이디
	 * @param pass - 인증할 사용자 비밀번호
	 * @return MemberVO - 인증이 완료된 사용자 정보를 저장하는 객체,
	 * @return null - 인증된 사용자 정보가 존재하지 않음을 의미
	 */
	MemberVO memberLogin(String id, String pass);
	
	/**
	 * @implNote - 자동 로그인용 사용자 id 로 정보 검색
	 * 
	 * @param id - id 값으로 사용자 정보 확인 - cookie 자동 로그인
	 * @return MemberVO - id가 일치하는 사용자 정보
	 * @return null - id가 일치하는 사용자 정보가 존재하지 않음을 의미
	 */
	MemberVO getMemberById(String id);
	
}