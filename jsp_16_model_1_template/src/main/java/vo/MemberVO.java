package vo;

import java.util.Date;

/**
 * digital_member 
 * table의 행정보를 저장할 Value Object
u_no INT PRIMARY KEY AUTO_INCREMENT,			-- 회원 번호
u_id VARCHAR(200) NOT NULL UNIQUE,				-- 회원 아이디(email)
u_pw VARCHAR(100) NOT NULL,						-- 비밀번호
u_name VARCHAR(50) NOT NULL,					-- 이름 
u_profile VARCHAR(300) NULL,					-- 프로필 이미지
u_phone VARCHAR(20) NOT NULL,					-- 전화번호
u_birth VARCHAR(20) NOT NULL,					-- 생년월일(19820607)
u_addr VARCHAR(20),								-- 주소
u_addr_detail VARCHAR(200),						-- 상세주소
u_addr_post VARCHAR(50),						-- 우편번호
u_point INT DEFAULT 0,							-- 포인트
u_date TIMESTAMP NOT NULL DEFAULT now(),		-- 계정 생성일
u_visit_date TIMESTAMP NOT NULL DEFAULT now(),	-- 최종 방문일(마지막 로그인)
u_withdraw char(1) DEFAULT 'n'
 */
public class MemberVO {
	
	private  int u_no;
	private String u_id;
	private String 	u_pw;
	private String u_name; 
	private String u_profile;
	private String u_phone;
	private String u_birth;
	private String u_addr;
	private String u_addr_detail;
	private String u_addr_post;
	private int u_point;
	private Date u_date;
	private Date u_visit_date;
	private String u_withdraw;
	
	public MemberVO() {
		super();
	}
	public MemberVO(int u_no, String u_id, String u_pw, String u_name, String u_profile, String u_phone, String u_birth,
			String u_addr, String u_addr_detail, String u_addr_post, int u_point, Date u_date, Date u_visit_date,
			String u_withdraw) {
		super();
		this.u_no = u_no;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_profile = u_profile;
		this.u_phone = u_phone;
		this.u_birth = u_birth;
		this.u_addr = u_addr;
		this.u_addr_detail = u_addr_detail;
		this.u_addr_post = u_addr_post;
		this.u_point = u_point;
		this.u_date = u_date;
		this.u_visit_date = u_visit_date;
		this.u_withdraw = u_withdraw;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_profile() {
		return u_profile;
	}
	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_birth() {
		return u_birth;
	}
	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public String getU_addr_detail() {
		return u_addr_detail;
	}
	public void setU_addr_detail(String u_addr_detail) {
		this.u_addr_detail = u_addr_detail;
	}
	public String getU_addr_post() {
		return u_addr_post;
	}
	public void setU_addr_post(String u_addr_post) {
		this.u_addr_post = u_addr_post;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public Date getU_date() {
		return u_date;
	}
	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}
	public Date getU_visit_date() {
		return u_visit_date;
	}
	public void setU_visit_date(Date u_visit_date) {
		this.u_visit_date = u_visit_date;
	}
	public String getU_withdraw() {
		return u_withdraw;
	}
	public void setU_withdraw(String u_withdraw) {
		this.u_withdraw = u_withdraw;
	}
	@Override
	public String toString() {
		return "MemberVO [u_no=" + u_no + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_profile="
				+ u_profile + ", u_phone=" + u_phone + ", u_birth=" + u_birth + ", u_addr=" + u_addr
				+ ", u_addr_detail=" + u_addr_detail + ", u_addr_post=" + u_addr_post + ", u_point=" + u_point
				+ ", u_date=" + u_date + ", u_visit_date=" + u_visit_date + ", u_withdraw=" + u_withdraw + "]";
	}
	
}










