select * from all_users; -- 주석

create table person(
    num number,
    name VARCHAR2(10),
    birth VARCHAR2(10),
    tel varchar2(20),
    primary key( num )
);
desc person;

select * from person; -- R
-- C
insert into person values(1001 , '김개똥', '900514', '010xx');
-- U
update person set name = '고고고';
-- D
delete from person;
insert into person values(1001 , '김개똥', '900514', '010xx');
insert into person(name,num,birth,tel) 
                    values('고길동',1002,'910501','010-xxx');
insert into person(num) values( 1003 );
desc person;
insert into person values(1011 , '1111', '1111', '1111');
select * from person;
select num, name from person;
select * from person where num = 1001;
select * from person where name = '고길동';

update person set name='1111', tel='1234';
update person set name='고길동' where num=1001;
delete from persons where num = 1011;
select * from person;

commit; -- db에 완벽히 저장. 

select * from person; --cmd에서는 삭제했는데 결과보임. commit을 안했기때문에 임시저장소에 있는 데이터만 삭제된 것.

insert into person values(1000, 'aaa', '101010', '010xxxx');
rollback; --commit한 순간까지로 되돌림
delete from person;


create table student(
    id VARCHAR2(10) primary key,
    name VARCHAR2(20) not null,
    kor VARCHAR2(5),
    eng VARCHAR2(5),
    math VARCHAR2(5)
);

insert into student values('2401', '김가나',	'24', '48', '58');
insert into student values('2402', '이다라',	'54', '87', '20');
insert into student values('2403', '양라라',	'95', '45', '54');

update student set kor='25', eng='85', math='57' where id='2401';

commit;
delete from student;
select * from student;
rollback;


----------------다음진도(alter)
create table test_table(num number);
desc test_table;
alter table test_table add(name varchar(20));
alter table test_table modify(name number);
alter table test_table drop column name; --column 삭제
alter table test_table rename column num to num_to;
drop table test_table; --table 삭제
