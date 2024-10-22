-------연산자
select * from student;
select * from student where eng > 90;
select * from student where eng != 100;
select * from student where eng = 100; -- 관계연산자

select math from student where name='김가나';
select math/2 from student where name='김가나'; --수학점수/2한 결과값을 가져온다
select math+2 from student where name='김가나'; 
select math*2 from student where name='김가나';
select math/2 from student where name='김가나';
select math*2 AS 곱하기 from student where name='김가나'; --AS. 출력되는 column이름 변경
select math*2 곱하기 from student where name='김가나'; --생략가능

select * from student;
select * from student where kor >= 50  and eng > 30;
select * from student where kor >= 50  or eng > 30;
select * from student where kor >= 50  or eng > 30;
select * from student where kor BETWEEN 50 AND 90;
select * from student where not kor >= 50;


---------자료형
create table test_number(
    numps number(5,2), --5:전체 자리수(소수점 포함), 2:소수점 2자리
    nump number(3), --3:정수 3자리
    num number --자릿수 신경쓰지 않고 입력하는 만큼 저장
);

insert into test_number values(1.12345, 1.12345, 1.12345);
insert into test_number values(1234.12345, 1.12345, 1.12345); --error. 첫번째 값이 자료형의 범위를 벗어남
insert into test_number values(123.12345, 1.12345, 1.12345);
select * from test_number;


-----------date(날짜)
create table test_date(my_date date);
insert into test_date values(sysdate); --system날짜를 저장. 시분초까지 저장. 출력될때만 안보이는 것-> format
insert into test_date values('2000/12/12'); --시분초는 12:00이 기본으로 저장
insert into test_date values('2000/12/12 12:34:52');
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
select * from test_date;
select * from test_date where my_date > '2000/12/12'; --비교도 가능

create table test_char(
    ch char(5), --고정크기
    vch varchar2(20) --가변크기
);

insert into test_char values('1', '1');
select lengthb(ch), lengthb(vch) from test_char;

---Quiz
create table employee (
    name varchar2(15),
    salary NUMBER,
    job varchar2(20),
    join_company date
);

alter session set nls_date_format = 'YYYY/MM/DD';
insert into employee values('홍길동', 2000000, '컴퓨터', '2222/12/24');
select * from employee;
delete employee;

insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');

insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현',  2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');

select * from employee where salary * 12 > 100000000;
select name, join_company from employee where join_company < '2015/01/01';
select * from employee where salary BETWEEN 2800000 AND 3000000;

select * from employee where join_company > '2015/01/01' AND salary * 12 >= 60000000;
select * from employee where (job = '삼성' or job = '엘지') and salary * 12 >= 50000000;

---------------------
select * from employee where name like '김%'; 
select * from employee where name like '%똥';
select * from employee where name like '%이%';

---asc : 오름차순, desc : 내림차순
select * from employee order by join_company desc;
select * from employee order by join_company asc;
select * from employee order by join_company asc, name desc;

select * from employee where name like '%김%' and salary * 12 >= 30000000 order by job asc, salary desc; 


--------------함수
create table test_func(
    id number,
    num varchar2(20)
);

insert into test_func values(1, '34.5678');
select * from test_func;
select round(num, 2) from test_func where id=1; --소수점자리 잘라줌. 반올림이 일어남
select round(num/2, 2) from test_func where id=1;

select trunc(num, 2) from test_func where id=1; --소수점자리 잘라줌. 반올림 x
insert into test_func values(2, '55');
select num from test_func where id=2;
select mod(num,2) from test_func where id=2; --2로 나눈 나머지값 출력

insert into test_func values(3,'77');
insert into test_func values(4,'67.123');
insert into test_func values(5,'123.123');
insert into test_func values(6,'99');
insert into test_func values(7,'99.456');
insert into test_func values(8,'128');
insert into test_func values(9,'123.777');
insert into test_func values(10,'101.44');

select * from test_func where mod(id, 2) != 0;
select id, round(num/2, 2) from test_func where mod(id, 2) = 0;

insert into test_func values(11, 'welcome to oracle');
select upper(num) from test_func where id=11; --대문자로 출력
select lower(num) from test_func where id=11; --소문자로 출력
select initcap(num) from test_func where id=11; --첫문자만 대문자
select * from test_func where id=11;

create table test_company(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

select * from test_company where lower(class) like 'manager';
select * from test_company where lower(class) like 'employee' and 연봉 >= '2800';
select initcap(name), trunc(연봉/12, 0) from test_company;

---------------group

create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select * from test_class;
select sum(score) from test_class;
select avg(score) from test_class;
select max(score), min(score) from test_class;
select count(class) from test_class;
select count(*) from test_class;

select class, sum(score) from test_class group by class;
select class, sum(score) from test_class group by class having sum(score) > 60;

select class, count(*) from test_class group by class;
select class, avg(score) from test_class group by class order by avg(score) desc;
select class, max(score), min(score) from test_class group by class;

--------------------------join
create table test_class1( 
id varchar(20) , 
pwd varchar(100), 
name varchar(100),
lesson varchar(20), 
teacher varchar(20) 
);
insert into test_class1 values('aaa','aaa','홍길동','java','홍강사');
insert into test_class1 values('bbb','bbb','김개똥','java', '강강사');
insert into test_class1 values('ccc','ccc','고길똥','java','홍강사');
insert into test_class1 values('aaa','aaa','홍길동','python','김강사');
insert into test_class1 values('bbb','bbb','김개똥','html','고강사');
insert into test_class1 values('ccc','ccc','고길똥','html','고강사');
select * from test_class1;


create table test_member(id varchar(20) primary key, pwd varchar(100), name varchar(100) );
insert into test_member values('aaa','aaa','홍길동');
insert into test_member values('bbb','bbb','김개똥');
insert into test_member values('ccc','ccc','고길똥');

create table test_tc(name varchar(20),lesson varchar(20), st_id varchar(20));
insert into test_tc values('홍강사','java','aaa');
insert into test_tc values('홍강사','java','bbb');
insert into test_tc values('홍강사','java','ccc');
insert into test_tc values('김강사','python','aaa');
insert into test_tc values('고강사','html','bbb');
insert into test_tc values('고강사','html','ccc');

select * from test_member;
select * from test_tc;
select * from test_member inner join test_tc on test_member.id = test_tc.st_id;
insert into test_member values('ddd', 'ddd', '고도리');
select * from test_member left join test_tc on test_member.id = test_tc.st_id;
select * from test_member;
select * from test_tc;


---quiz
create table test_student(id varchar(20), name varchar(20), class varchar(20));
Insert into test_student values('aaa','홍길동','A반');
insert into test_student values('bbb','김개똥','B반');
insert into test_student values('ccc','고길동','C반');
insert into test_student values('ddd', '심순이', 'B반');

create table test_lesson(id varchar(20), lesson varchar(20), score int);
insert into test_lesson values('aaa','python',80);
insert into test_lesson values('aaa','java',90);
insert into test_lesson values('aaa','c언어',70);
insert into test_lesson values('bbb','server2012',70);
insert into test_lesson values('bbb','linux',90);
insert into test_lesson values('ccc','jsp',100);

select * from test_student inner join test_lesson on test_student.id = test_lesson.id;
select * from test_student left join test_lesson on test_student.id = test_lesson.id order by score desc;
select * from test_student inner join test_lesson on test_student.id = test_lesson.id where name like '홍길동';
select test_student.id, test_student.name from test_student inner join test_lesson on test_student.id = test_lesson.id;
select S.*, L.lesson, L.score from test_student S left join test_lesson L on S.id = L.id where L.lesson is null;
select s.name, s.class, sum(l.score) 합, avg(l.score) 평균 from test_student s left join test_lesson l on s.id = l.id
group by s.name, s.class;