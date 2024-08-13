DESC test_mvc;

CREATE TABLE test_mvc(
	num int primary key auto_increment,		-- 회원 번호
	id VARCHAR(50) UNIQUE NOT NULL,			-- 회원 아이디
	pass VARCHAR(100) NOT NULL,				-- 회원 비밀번호
	name VARCHAR(50)						-- 회원 이름
);