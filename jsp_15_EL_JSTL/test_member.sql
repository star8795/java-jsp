create table test_member(
	num INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(50) UNIQUE NOT NULL,
	pass VARCHAR(200) NOT NULL,
	addr TEXT,
	phone VARCHAR(20),
	gender VARCHAR(10),
	age INT(3)
);

INSERT INTO test_member
VALUES(null,'admin','admin','부산','01011111111','남성',26);

SELECT * FROM test_member;