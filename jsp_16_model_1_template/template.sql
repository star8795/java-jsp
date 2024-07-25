
INSERT INTO digital_member(u_id,u_pw,u_name,u_phone,u_birth) 
VALUES('admin','admin','MASTER','01000000000','20240308');

INSERT INTO digital_member(u_id,u_pw,u_name,u_phone,u_birth) 
VALUES('hap0p9y@nate.com','12345','최기근','01094867166','20020308');

SELECT * FROM digital_member;

CREATE TABLE IF NOT EXISTS digital_member(
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
	u_withdraw char(1) DEFAULT 'n'					-- 회원 탈퇴 여부(회원정보 숨김)   
);

SELECT * FROM digital_member;


SELECT TIMESTAMPDIFF(SECOND, u_visit_date, now()) AS diff FROM digital_member 
WHERE u_no = 1;

SELECT TIME_FORMAT(
(TIMESTAMPDIFF(SECOND, u_visit_date, now())), '%H:%m:%s'
) AS diff FROM digital_member 
WHERE u_no = 1;

SELECT (SELECT TIMESTAMPDIFF(SECOND, u_visit_date, now()) AS diff FROM digital_member 
WHERE u_no = 1) / 60 / 60 / 24;






