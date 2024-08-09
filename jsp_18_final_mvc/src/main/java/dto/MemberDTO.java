package dto;

import java.util.Date;

/**
 * Data Transfer Object
 * 계층간 데이터를 전달하기 위해 설계된 객체
 */
public class MemberDTO {
	
	private int num;			// 회원 번호
	private String id;			// 회원 아이디
	private String pass;		// 회원 비밀번호
	private String name;		// 회원 이름
	private int age;			// 나이
	private String gender;		// 성별
	private Date regdate;		// 회원 등록일
	private Date updatedate;	// 회원 정보 수정 시간
	
	public MemberDTO() {}

	// 로그인에 필요한 정보를 저장하는 생성자
	public MemberDTO(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}

	// 회원가입에 필요한 정보를 저장하는 생성자
	public MemberDTO(String id, String pass, String name, int age, String gender) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

	// 회원 전체 정보를 저장하는 생성자
	public MemberDTO(int num, String id, String pass, String name, int age, String gender, Date regdate,
			Date updatedate) {
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.regdate = regdate;
		this.updatedate = updatedate;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "MemberDTO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", age=" + age
				+ ", gender=" + gender + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
}









