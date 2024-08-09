package dao;

import dto.MemberDTO;

/**
 * DataBase Access Object
 * Repository - 데이터 저장소와 연결된 작업을 처리하는 class
 */
public interface MemberDAO {
	
	/**
	 * @param member - table 에 삽입 하기 위한 회원 행 정보
	 * @return boolean - 회원정보를 테이블에 등록하였는지 성공 여부
	 */
	boolean memberJoin(MemberDTO member);
	
	/**
	 * @param id - 회원 정보 검색에 필요한 사용자가 작성한 id 문자열
	 * @param pass - 회원정보 검색에 필요한 사용자가 작성한 비밀번호 문자열
	 * @return MemberDTO - param id, param pass 가 일치하는 회원정보를 저장하는 객체
	 * @return null - 일치하는 사용자 정보가 없음.
	 */
	MemberDTO memberLogin(String id, String pass);
	
	/**
	 * @param member - 수정할 회원정보 
	 * @return boolean - 회원정보 수정 성공 여부
	 */
	boolean memberUpdate(MemberDTO member);
	
	/**
	 * @param num - 탈퇴 요청한 회원 번호
	 * @return - 회원 정보 삭제 성공 여부
	 */
	boolean deleteMember(int num);
	
	/**
	 * id로 회원 정보 검색 - 자동 로그인
	 * @param id - 테이블에서 검색할 회원 id
	 * @return MemberDTO - id 가 일치하는 회원의 행정보를 저장할 객체
	 * @return null - 일치하는 회원정보 없음        
	 */
	MemberDTO getMemberById(String id);
}












