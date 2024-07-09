USE digital_jsp;

-- 방명록 작성자 이름
-- 작성자 확인 비밀번호
-- 방명록 메시지

CREATE TABLE IF NOT EXISTS guestBook(
	num INT PRIMARY KEY AUTO_INCREMENT COMMENT '방명록 글번호',
	guestName VARCHAR(20) NOT NULL COMMENT '방명록 작성자',
	password VARCHAR(30) NOT NULL COMMENT '방명록 비밀번호',
	message TEXT COMMENT '방명록 메시지'
);

-- table 정보 확인
-- 실행 할 쿼리 블럭 지정 후 alt + x, alt + c
DESCRIBE guestBook;

SELECT * FROM guestBook;

INSERT INTO guestBook(guestName, password, message)
SELECT guestName, password, message FROM guestBook;