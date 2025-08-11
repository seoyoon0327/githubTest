-- 고객 테이블
CREATE TABLE customer (
  customer_id   VARCHAR2(50) PRIMARY KEY,
  password      VARCHAR2(255) NOT NULL,
  name          VARCHAR2(100) NOT NULL,
  birth_date    DATE NOT NULL,
  gender        CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
  phone         VARCHAR2(20) NOT NULL,
  email         VARCHAR2(100),
  address       VARCHAR2(255),
  role          VARCHAR2(20) DEFAULT 'ROLE_USER',
  reg_date      DATE DEFAULT SYSDATE
);

--  피보험자 테이블
CREATE TABLE insured_person (
  insured_id     VARCHAR2(50) PRIMARY KEY,
  customer_id    VARCHAR2(50) NOT NULL,
  name           VARCHAR2(100) NOT NULL,
  birth_date     DATE NOT NULL,
  gender         CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),
  relationship   VARCHAR2(50),
  reg_date       DATE DEFAULT SYSDATE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 계약 테이블
CREATE TABLE contract (
  contract_id   NUMBER PRIMARY KEY,
  customer_id   VARCHAR2(50) NOT NULL,
  insured_id    VARCHAR2(50) NOT NULL,
  product_name  VARCHAR2(100) NOT NULL,
  start_date    DATE NOT NULL,
  end_date      DATE,
  status        VARCHAR2(20) DEFAULT 'ACTIVE',
  reg_date      DATE DEFAULT SYSDATE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (insured_id) REFERENCES insured_person(insured_id)
);

-- 공지사항 테이블
CREATE TABLE notice (
  notice_id     NUMBER PRIMARY KEY,
  title         VARCHAR2(200) NOT NULL,
  content       VARCHAR2(1000) NOT NULL,
  writer        VARCHAR2(100) DEFAULT '관리자',
  reg_date      DATE DEFAULT SYSDATE,
  update_date   DATE
);
-- 공지사항 content 글자 수 제한 변경
ALTER TABLE notice MODIFY content VARCHAR2(4000);
commit;

-- 공지사항 댓글 테이블(7/24 추가)
CREATE TABLE notice_reply (
  rno           NUMBER(10,0),                        -- 댓글 ID
  notice_id     NUMBER(10,0) NOT NULL,               -- 공지사항 ID (FK)
  reply         VARCHAR2(1000) NOT NULL,             -- 댓글 내용
  replyer       VARCHAR2(50) NOT NULL,               -- 작성자
  replyDate     DATE DEFAULT SYSDATE,                -- 작성일
  updateDate    DATE DEFAULT SYSDATE,                -- 수정일
  CONSTRAINT pk_notice_reply PRIMARY KEY (rno),
  CONSTRAINT fk_notice_reply_notice FOREIGN KEY (notice_id)
    REFERENCES notice (notice_id)
);

-- 댓글 인덱스 (페이징 최적화)
CREATE INDEX idx_notice_reply ON notice_reply(notice_id DESC, rno ASC);

--  contract_id용 시퀀스
DROP SEQUENCE contract_seq;
CREATE SEQUENCE contract_seq
  START WITH 101
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- contract_id 자동 채번용 트리거
CREATE OR REPLACE TRIGGER trg_contract_id
BEFORE INSERT ON contract
FOR EACH ROW
BEGIN
  SELECT contract_seq.NEXTVAL
  INTO :NEW.contract_id
  FROM dual;
END;
/

-- 댓글 번호 시퀀스
DROP SEQUENCE seq_notice_reply;
CREATE SEQUENCE seq_notice_reply;

-- 완료
COMMIT;

-- 확인용 쿼리
SELECT * FROM customer;
SELECT * FROM insured_person;
SELECT * FROM contract;
SELECT * FROM notice;
SELECT * FROM notice_reply;
 
-- security(7/24 추가)
drop table alegria_member;

create table alegria_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) not null,
      username varchar2(100) not null,
      regdate date default sysdate, 
      updatedate date default sysdate,
      enabled char(1) default '1');

drop table alegria_member_auth;

create table alegria_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) not null,
     constraint fk_alegria_member_auth foreign key(userid) references alegria_member(userid)
);
commit;

select * from alegria_member;
select * from alegria_member_auth;

commit;

-- 최신뉴스 테이블 (08/07 추가)
drop table news;
CREATE TABLE news (
    news_id         NUMBER PRIMARY KEY,                          -- 뉴스 기사 고유 ID (PK)
    title           VARCHAR2(200) NOT NULL,                      -- 뉴스 기사 제목
    content         VARCHAR2(4000) NOT NULL,                     -- 뉴스 기사 내용
    published_date  DATE,                                        -- 뉴스 기사 날짜
    writer          VARCHAR2(100) DEFAULT '관리자',               -- 작성자 (기본값 : 관리자)
    reg_date        DATE DEFAULT SYSDATE,                        -- 등록 일시 (자동등록)
    view_count      NUMBER(10) DEFAULT 0,                        -- 뉴스 기사 조회수
    important       CHAR(1) DEFAULT 'N'                          -- 뉴스 기사 중요 여부
);

-- PK용 SEQUENCE 생성 (NEWS_ID 자동 증가용)
CREATE SEQUENCE news_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

commit;
