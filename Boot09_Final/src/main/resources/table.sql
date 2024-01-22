DROP TABLE user_tbl;

CREATE TABLE user_tbl(
	id NUMBER PRIMARY KEY,
	userName VARCHAR2(20) UNIQUE,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) UNIQUE,
	role VARCHAR2(10) NOT NULL,
	profile VARCHAR2(100),
	regdate DATE
);

DROP SEQUENCE user_seq;

CREATE SEQUENCE user_seq;

SELECT * FROM user_tbl;

--이미지 갤러리를 만들기 위한 테이블
CREATE TABLE board_gallery(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100), -- 로그인된 userName 을 넣을예정
	caption VARCHAR2(100), -- 이미지에 대한 설명
	saveFileName VARCHAR2(100), -- 업로드된 이미지의 이름
	regdate DATE --	이미지 업로드 날짜
);

CREATE SEQUENCE board_gallery_seq;

SELECT * FROM board_gallery;

-- LAG (칼럼명, 칸 수, 존재하지 않을 시 기본값) OVER (정렬 조건)
SELECT num, writer, caption, -- 실행 순서 2
	LAG(num, 1, 0) OVER (ORDER BY num DESC) as PrevNum,
	LEAD(num, 1, 0) OVER (ORDER BY num DESC) as NextNum
FROM board_gallery -- 실행 순서 1
ORDER BY num DESC; -- 실행 순서 3


SELECT * FROM
	(
		SELECT num, writer, caption,
			LAG(num, 1, 0) OVER (ORDER BY num DESC) as PrevNum,
			LEAD(num, 1, 0) OVER (ORDER BY num DESC) as NextNum
		FROM board_gallery
		ORDER BY num DESC
	)
WHERE num = 5;

SELECT * FROM board_cafe;


CREATE TABLE file_list(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100), -- 로그인된 userName 을 넣을예정
	title VARCHAR2(100), -- 이미지 제목
	orgFileName VARCHAR2(100),
	saveFileName VARCHAR2(100), -- 업로드된 이미지의 이름
	fileSize VARCHAR2(100),
	regdate DATE
);

DROP TABLE file_list;
CREATE SEQUENCE file_list_seq;

SELECT * FROM file_list;

DELETE file_list WHERE num=4;

select * from board_cafe order by num desc

-- 댓글을 저장할 테이블
CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY, --댓글의 글 번호
	writer VARCHAR2(100), --댓글 작성자의 아이디
	content VARCHAR2(500), --댓글 내용
	target_id VARCHAR2(100), --댓글 대상자 아이디
	ref_group NUMBER, --원글의 글 번호
	comment_group NUMBER, --댓글의 그룹번호
	deleted CHAR(3) DEFAULT 'no', --삭제된 댓글인지 여부 'yes' or 'no'
	regdate DATE
);

-- 댓글의 글 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_comment_seq;

SELECT * FROM BOARD_CAFE_COMMENT;