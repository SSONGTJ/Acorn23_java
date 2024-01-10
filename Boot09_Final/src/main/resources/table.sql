CREATE TABLE user_tbl(
	id NUMBER PRIMARY KEY,
	userName VARCHAR2(20) UNIQUE,
	password VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) UNIQUE,
	role VARCHAR2(10) NOT NULL
);

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