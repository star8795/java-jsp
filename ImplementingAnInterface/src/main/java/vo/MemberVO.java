package vo;

public class MemberVO {
	
	private int num;					// 회원 번호
	private String id;					// 회원 아이디
	private String pass;				// 회원 비밀번호
	private String name;				// 회원 이름
	
	public MemberVO() {}

	/**
	 * 회원정보 등록 용 생성자
	 */
	public MemberVO(String id, String pass, String name) {
		this.id = id;
		this.pass = pass;
		this.name = name;
	}

	/**
	 * 인증된 사용자 정보를 저장 시 사용할 생성자
	 */
	public MemberVO(int num, String id, String pass, String name) {
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name+"]";
	}
	
}









