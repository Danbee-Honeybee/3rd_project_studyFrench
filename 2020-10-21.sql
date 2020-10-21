drop table customer;
drop table vocabulary;
drop table board;
drop table board_reply;
drop table support;
drop table support_reply;

create  sequence customer_seq; 
create  sequence board_reply_seq; 
create  sequence board_heart_seq; 
 
desc customer;
desc vocabulary;
desc board;
desc board_reply;
desc support;
desc support_reply;

commit;


select * from customer;
select to_char(wdate,'YYYY.MM.DD') as wdate from board;
select  board_idx, custid, topic, title, bcontent, (select to_char(wdate,'YYYY.MM.DD') as wdate from board)
from board order by board_idx desc;
delete from board where Board_idx=2;

select  board_idx, custid, topic, title, bcontent, to_char(wdate,'YYYY.MM.DD') as wdate
from board where board_idx=9;0

create table customer (
custcode VARCHAR2(10),
custname VARCHAR2(20),
custid VARCHAR2(15),
custpassword VARCHAR2(20),
clevel VARCHAR2(5),
cpoint NUMBER default 0,
 PRIMARY KEY(Custcode, custid)
);



create table vocabulary(
Fword VARCHAR2(30),
Kword VARCHAR2(30),
wlevel VARCHAR2(5),
 PRIMARY KEY(Fword)
);

desc board;
drop table board;
select * from board;

create table board(
Board_idx NUMBER,
custid VARCHAR2(15),
topic VARCHAR2(20),
title VARCHAR2(100),
bcontent VARCHAR2(500),
wdate DATE,
hit NUMBER default 0,
blike NUMBER default 0,
 PRIMARY KEY(Board_idx)
);
commit;
alter table board add hit NUMBER default 0;
alter table board add blike NUMBER default 0;
commit;
update board set blike = blike + 1 where board_idx=4;


create table board_reply(
rBoard_idx NUMBER,
rwriter VARCHAR2(20),
rcontent VARCHAR2(500),
rdate DATE,
Board_idx NUMBER,
 PRIMARY KEY(rBoard_idx)
);

/*===================================================*/
create table board_heart(
hwriter VARCHAR2(20),
Board_idx NUMBER
);
commit;
drop table board_heart;
/*이 사람이 전에 추천을 눌렀는지 확인*/
select count(*) from board_heart where hwriter='user1' and board_idx=6;
select count(*) from board_heart where hwriter='user1';

select * from board_heart;
insert into board_heart values(board_heart_seq.nextVal, 'user1', 6);
commit;
select * from board;
update board set blike=0;
/*추천을 누른적이 없다면 update*/
update board set blike = blike + 1 where board_idx=8;

create  sequence board_heart_seq; 
delete from board_heart;
select * from board_heart;
commit;
/*===================================================*/
update board set blike=0;
commit;

create table support(
Support_idx NUMBER,
topic VARCHAR2(20),
title VARCHAR2(100),
sname VARCHAR2(20),
scontent VARCHAR2(500),
wdate DATE,
 PRIMARY KEY(Support_idx)
);


create table support_reply(
rsupport_idx NUMBER,
rwriter VARCHAR2(20),
rcontent VARCHAR2(500),
rdate DATE,
Support_idx NUMBER,
 PRIMARY KEY(Support_idx)
);

 select count(*) cnt from customer  where custid='user1';
 update customer set custid='user2' where custcode='4';
 commit;
 select * from customer;
 
/*1021*/ 
create table user1(
    name varchar2(10) primary key,
    age number,
    hobby varchar2(16)
);
 
 