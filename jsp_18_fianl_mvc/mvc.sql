CREATE TABLE IF NOT EXISTS mvc_member(
	num INT PRIMARY KEY AUTO_INCREMENT,		-- 회원번호
	id VARCHAR(30) UNIQUE,					-- 회원 id
	pass VARCHAR(30) NOT NULL,				-- 비밀번호
	name VARCHAR(20),						-- 이름
	age INT(3),								-- 나이
	gender enum('male', 'female'),			-- 성별
	regdate TIMESTAMP default now(),		-- 회원가입일자
	updatedate TIMESTAMP default now()		-- 정보 수정 시간
);