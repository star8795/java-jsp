select * from member;
select * from post_list;
create database `login`;

use login;

create table member(
	num int primary key auto_increment, 	-- 회원번호
    id varchar(300) not null unique,		-- 회원 아이디
    pass varchar(300) not null, 			-- 비밀번호
    name varchar(50) not null,				-- 이름
    nickName varchar(50) not null			-- 닉네임
);
CREATE TABLE IF NOT EXISTS post_list(
	user_num int, 								-- 회원번호 (외래키)
	post_num int PRIMARY KEY AUTO_INCREMENT,	-- 게시글 번호    
    view_count int NOT NULL,					-- 조회수
    category varchar(300), 						-- 카테고리
    title VARCHAR(300) NOT NULL,				-- 제목
    nickname VARCHAR(300) NOT NULL,				-- 닉네임
    link VARCHAR(50),							-- 유튜브 링크
    main text,									-- 본문
    file varchar(300),							-- 파일 링크
    post_date varchar(300) not null,			-- 날짜
    foreign key(user_num) references member(num)	
);

CREATE TABLE IF NOT EXISTS comment(
	post_num int, 							-- 게시물 번호 (외래키)
    title VARCHAR(300) NOT NULL,			-- 제목
    nickname VARCHAR(300) NOT NULL,			-- 닉네임
    main VARCHAR(1000),						-- 본문
    post_date varchar(300) not null,		-- 날짜
    foreign key(post_num) references post_list(post_num)
);
