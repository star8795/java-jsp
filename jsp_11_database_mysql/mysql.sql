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

-- SELECT * FROM digital_jsp.member;
SELECT * FROM member;

-- table에 값 삽입, INSERT INTO table VALUES(값...);
-- num, id, pass, name, addr
INSERT INTO member VALUES(null,'id001','pw001','김동찬','부산');

INSERT INTO member(id,pass,name,addr)
VALUES('id002','pw002','TONY STARK','CALIFORNIA');

COMMIT;

SELECT * FROM member ORDER BY num DESC;

SELECT num, id, name, addr FROM member ORDER BY num DESC;

DELETE FROM member WHERE id = id001;

DELETE FROM member WHERE num = 2;

ROLLBACK;

SELECT @@autocommit;

SET autocommit = TRUE;