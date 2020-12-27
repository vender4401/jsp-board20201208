DROP TABLE member;
CREATE TABLE member (
    memberid VARCHAR2(50) PRIMARY KEY,  
    name VARCHAR2(50) NOT NULL, 
    password VARCHAR2(10) NOT NULL, 
    regdate DATE NOT NULL
    );
    
CREATE TABLE article (
    article_no NUMBER GENERATED AS IDENTITY, 
    writer_id VARCHAR(50) NOT NULL, 
    writer_name VARCHAR2(50) NOT NULL, 
    title VARCHAR2(255) NOT NULL, 
    regdate DATE NOT NULL, 
    moddate DATE NOT NULL, 
    read_cnt NUMBER, 
    PRIMARY KEY (article_no) 
    );
    
SELECT * FROM member;

SELECT * FROM article;
DESC article;

-- 댓글
-- 11g

-- 12c
CREATE TABLE reply (
    replyid NUMBER GENERATED AS IDENTITY, 
    memberid VARCHAR2(50) NOT NULL,   
    article_no NUMBER NOT NULL, 
    body VARCHAR2(1000) NOT NULL, 
    regdate DATE NOT NULL 
);

DESC reply;

SELECT * FROM reply;

SELECT replyid, memberid, article_no, body, regdate 
    FROM reply 
    WHERE article_no=110    
    ORDER BY replyid DESC;
    
    commit;