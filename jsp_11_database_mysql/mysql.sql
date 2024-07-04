CREATE SCHEMA `digital_jsp`;
CREATE DATABASE `digital_jsp`;

/*
	INSERT SELECT UPDATE DELETE
    Create Read Update Delete
    CRUD
*/

CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY AUTO_INCREMENT,		-- 회원번호
	id VARCHAR(300) NOT NULL UNIQUE,		-- 회원 아이디
    pass VARCHAR(300) NOT NULL,				-- 회원 비밀번호
    name VARCHAR(50),						-- 이름
    addr VARCHAR(300)						-- 주소
);