CREATE TABLE membership --회원계정
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR(50)    NOT NULL, 
    m_name    VARCHAR(50)    NOT NULL, 
    m_addr    VARCHAR(50)    NOT NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE board --게시글
(
    b_num       INT             NOT NULL, 
    b_id        VARCHAR2(20)    NULL, 
    b_title     VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date      DATE            NULL, 
     PRIMARY KEY (b_num)
)
-- Auto Increment를 위한 Sequence 추가 SQL - board.b_num;

CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - board(b_id) -> membership(m_id)
-- 회원이 아닌 id는 게시글을 작성할 수 없음
ALTER TABLE board ADD CONSTRAINT fk_test FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
        
insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', '홍길동', '산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date) 
            values(board_SEQ.nextval, 'bbb', '제목','내용', sysdate); --error. fk로 인해 bbb는 게시글 작성 못함
insert into board(b_num, b_id, b_title, b_content, b_date) 
            values(board_SEQ.nextval, 'aaa', '제목','내용', sysdate);
insert into board(b_num, b_id, b_title, b_content, b_date) 
            values((select max(b_num) from board) + 1 , 'aaa', '제목2','내용2', sysdate); -- 게시글번호 증가 또다른방법

select * from board;
select * from membership;
delete from membership where m_id = 'aaa'; --fk와 연결되어 있어 삭제안됨. fk를 먼저 삭제해 준 후 삭제가능
delete from board where b_id='aaa';
select * from user_sequences;
select * from all_sequences;
select * from all_sequences where sequence_owner='c##choi';
drop sequence board_seq;

select * from all_constraints;
select * from all_constraints where owner='c##choi';
select * from user_constraints ;
alter table board drop constraint fk_test;

insert into membership values('aaa', 'aaa', '홍길동', '산골짜기');
insert into board values(1, 'ccc', '제목', '내용', sysdate); --fk가 없어져서 추가 가능
insert into board values(2, 'aaa', '제목', '내용', sysdate);
insert into board values(3, 'aaa', '제목', '내용', sysdate);
delete from membership where m_id='aaa';
delete from board;

alter table board add constraint fk_test foreign key(b_id)
        references membership(m_id) on delete cascade; -- 부모를 삭제하면 자식도 같이 삭제
select * from membership M inner join board B on M.m_id=B.b_id;
delete from membership where m_id='aaa'; --자식(board) 내용까지 삭제됨


------------------------------------------
CREATE TABLE member
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_goods_g_id_member_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;

insert into member values('aaa', 'aaa', '홍길동', '산골짜기');
insert into member values('bbb', 'bbb', '김개똥', '개똥별');
insert into member values('ccc', 'ccc', '고길동', '마포구');
insert into member values('ddd', 'ddd', '김말이', '분식집');

insert into goods values(goods_seq.nextval, 'aaa', '운동화', 75000, 2, 150000, sysdate); 
insert into goods values(goods_seq.nextval, 'aaa', '티셔츠', 15000, 5, 75000, sysdate); 
insert into goods values(goods_seq.nextval, 'bbb', '가방', 450000, 1, 450000, sysdate); 
insert into goods values(goods_seq.nextval, 'bbb', '책', 35000, 2, 70000, sysdate); 

select * from member;
select * from goods;

select * from member inner join goods on member.m_id = goods.g_id;
select m_id, m_name, g_name, g_price_sum from member inner join goods on member.m_id = goods.g_id;
select m_id, m_name, m_addr, sum(g_price_sum) from member inner join goods on member.m_id = goods.g_id
            group by m_id, m_name, m_addr;
            
---------------------------view
create view view_test as select * from member where m_id = 'aaa';
select * from view_test;
create view view_test3 as select m_id, m_name, m_addr, sum(g_price_sum) as 총액 from member inner join goods on member.m_id = goods.g_id
            group by m_id, m_name, m_addr;
select * from view_test3;

create or replace view view_test as select * from member where m_id='bbb';
drop view view_test;

create view m_g_join as select * from member inner join goods on member.m_id = goods.g_id;
select * from m_g_join;
select m_id, m_name, m_addr, g_count from m_g_join where g_count >= 2;
select m_id, m_name, m_addr, g_price * g_count as 총가격 from m_g_join;
select m_id, m_name, m_addr, sum(g_price_sum) from m_g_join group by m_id, m_name, m_addr;

