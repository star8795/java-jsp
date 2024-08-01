-- mvc.sql
-- use digital_jsp
CREATE TABLE IF NOT EXISTS mvc_member(
	num INT PRIMARY KEY AUTO_INCREMENT,		-- 회원번호
	id VARCHAR(30) UNIQUE,					-- 회원아이디
	pass VARCHAR(30) NOT NULL,				-- 비밀번호
	name VARCHAR(20),						-- 이름
	age int(3),								-- 나이
	gender enum('male', 'female'),			-- 성별
	regdate TIMESTAMP default now(),		-- 회원 가입일
	updatedate TIMESTAMP default now()		-- 회원정보 수정 시간
);

SELECT * FROM mvc_member;

INSERT INTO mvc_member 
VALUES(null,'admin','admin','MASTER',23,'male',now(),sysdate());

DROP TABLE mvc_member_backup;

SELECT * FROM mvc_member_backup;

DESC mvc_member_backup;

CREATE TABLE mvc_member_backup (SELECT * FROM mvc_member WHERE 1 = 0);

CREATE TABLE mvc_member_backup LIKE mvc_member;

SELECT * FROM mvc_member WHERE id = 'id002'
UNION 
SELECT * FROM mvc_member_backup where id = 'id002';

--  mvc_member 에서 DELETE 된 행정보를 mvc_member_back table에 추가하는 TRIGGER 
DELIMITER //
	CREATE TRIGGER after_delete_member 
    AFTER DELETE ON mvc_member 
    FOR EACH ROW 
    BEGIN
    -- NEW 새로 작성된 행정보
    -- OLD 기존 행정보
		INSERT INTO mvc_member_backup 
        VALUES(OLD.num, OLD.id, OLD.pass, OLD.name, OLD.age, OLD.gender,OLD.regdate, now());
	END //
DELIMITER ;

SELECT * FROM mvc_member;

DELETE FROM mvc_member WHERE num = 5; 