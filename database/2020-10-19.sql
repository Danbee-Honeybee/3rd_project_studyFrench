drop table customer;
drop table vocabulary;
drop table board;
drop table board_reply;
drop table support;
drop table support_reply;

create  sequence customer_seq; 
create  sequence board_reply_seq; 
 
desc customer;
desc vocabulary;
desc board;
desc board_reply;
desc support;
desc support_reply;

commit;

select * from customer;


create table customer (
custcode VARCHAR2(10),
custname VARCHAR2(20),
custid VARCHAR2(15),
custpassword VARCHAR2(20),
clevel VARCHAR2(5),
cpoint NUMBER default 0,
 PRIMARY KEY(Custcode)
);



create table vocabulary(
Fword VARCHAR2(30),
Kword VARCHAR2(30),
wlevel VARCHAR2(5),
 PRIMARY KEY(Fword)
);


create table board(
Board_idx NUMBER,
topic VARCHAR2(20),
title VARCHAR2(100),
bname VARCHAR2(20),
bcontent VARCHAR2(500),
wdate DATE,
 PRIMARY KEY(Board_idx)
);




create table board_reply(
rBoard_idx NUMBER,
rwriter VARCHAR2(20),
rcontent VARCHAR2(500),
rdate DATE,
Board_idx NUMBER,
 PRIMARY KEY(rBoard_idx)
);



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

