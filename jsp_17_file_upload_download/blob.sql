CREATE TABLE test_image(
	id VARCHAR(300) NOT NULL,
	imageName VARCHAR(50) NOT NULL, 		-- 업로드된 이미지 이름
	imageType VARCHAR(50) NOT NULL,			-- 업로드 파일 형식
	imageFile MEDIUMBLOB NOT NULL			-- 파일 이진 데이터
);
/*
	TINYBLOB  	2^8 - 1 [256bytes]
	BLOB	  	2^16-1  [64KB]
	MEDIUMBLOB 	2^24 -1 [8MB]
	LONGBLOB	2^32 -1 [4GB]
*/

SELECT * FROM test_image;