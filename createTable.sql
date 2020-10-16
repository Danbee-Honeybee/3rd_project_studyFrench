drop table customer;
drop table vocabulary;
drop table board;
drop table board_reply;
drop table support;
drop table support_reply;

create table customer(
custcode varchar2(10),
name VARCHAR2(20),
email VARCHAR2(20),
level VARCHAR2(5),
Point NUMBER,
 PRIMARY KEY(custcode)
);

create table vocabulary(
fword VARCHAR2(30),
kword VARCHAR2(30),
level VARCHAR2(5),
 PRIMARY KEY(fword)
);

create table board(
board_idx NUMBER,
topic VARCHAR2(20),
title VARCHAR2(100),
name VARCHAR2(20),
content VARCHAR2(500),
wdate DATE,
 PRIMARY KEY(board_idx)
);

create table board_reply(
rBoard_idx NUMBER,
rwriter VARCHAR2(20),
rcontent VARCHAR2(500),
rdate DATE,
  PRIMARY KEY(rBoard_idx),
  FOREIGN KEY (board_idx) REFERENCES board (board_idx)
);

create table support(
support_idx NUMBER,
topic VARCHAR2(20),
title VARCHAR2(100),
name VARCHAR2(20),
content VARCHAR2(500),
wdate DATE,
 PRIMARY KEY(board_idx)
);

create table support_reply(
rsupport_idx NUMBER,
rwriter VARCHAR2(20),
rcontent VARCHAR2(500),
rdate DATE,
  PRIMARY KEY(rsupport_idx),
  FOREIGN KEY (support_idx) REFERENCES support (support_idx)
);

