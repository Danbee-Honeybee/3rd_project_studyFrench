drop table customer;
drop table vocabulary;
drop table board;
drop table board_reply;
drop table support;
drop table support_reply;

create  sequence customer_seq; 
create  sequence board_seq; 
create  sequence board_reply_seq; 
create  sequence board_heart_seq; 
drop sequence board_reply_seq;
commit;

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

/*===================================================================*/

drop table vocabulary;
create table vocabulary(
Fword VARCHAR2(30),
Kword VARCHAR2(30),
wlevel VARCHAR2(5),
 PRIMARY KEY(Fword)
);
commit;
select * from vocabulary;
delete from vocabulary;


insert into vocabulary values('antivirus','�׹��̷���','B1');
insert into vocabulary values('anti-spam','��Ƽ����','B1');
insert into vocabulary values('antit?rroriste','�׷�����','B1');
insert into vocabulary values('antirides','�ָ�����','B1');
insert into vocabulary values('auto-d?fendre','�ڱ� ����ϴ�','B1');
insert into vocabulary values('une offre','����, ����, ����','B1');
insert into vocabulary values('la promotion','����','B1');

insert into vocabulary values('une destination','���� ������, ������','B1');
insert into vocabulary values('un budget','����','B1');
insert into vocabulary values('des frais','���','B1');
insert into vocabulary values('?tre limit? ?','~�� ���ѵȴ�, ~�� �����ȴ�','B1');
insert into vocabulary values('un vol','�װ���','B1');
insert into vocabulary values('un h?bergement','����','B1');
insert into vocabulary values('une r?servation','����','B1');

insert into vocabulary values('le d?part','���','B1');
insert into vocabulary values('l''arriv?e','����','B1');
insert into vocabulary values('la dur?e du voyage','����Ⱓ','B1');
insert into vocabulary values('un voyageur','������','B1');
insert into vocabulary values('un voyagiste','���� ��ǰ�� �Ĵ� ���','B1');

commit;

insert into vocabulary values('manquer','��ġ��, �Ҿ������','B1');
insert into vocabulary values('une soir?e-t?l?','�ڷ������� ��û�ϴ� �������','B1');
insert into vocabulary values('ad?quat','�˸���, ������','B1');
insert into vocabulary values('une s?rie','�ø���','B1');
insert into vocabulary values('le suspens','�����潺','B1');
insert into vocabulary values('r?put?','������, ���� ����','B1');
insert into vocabulary values('l''internat','���� ��Ȱ, ���� �Ⱓ','B1');
insert into vocabulary values('un interne','�����, ����','B1');
insert into vocabulary values('immerg?','���� ���','B1');
insert into vocabulary values('la tension','����, ����','B1');

insert into vocabulary values('ex-femme','������','B1');
insert into vocabulary values('ex-mari','������','B1');

insert into vocabulary values('ex-copine','������ģ��','B1');
insert into vocabulary values('ex-copin','������ģ��','B1');
insert into vocabulary values('une fronti?re','����','B1');
insert into vocabulary values('?clater','������, �߹��ϴ�','B1');
insert into vocabulary values('mettre un ferme ?','~�� �����θ� ���','B1');

/*A1*/
insert into vocabulary values('l''endroit','���','A1');
insert into vocabulary values('le lieu','���, ����','A1');
insert into vocabulary values('la campagne','�ð�, ����','A1');
insert into vocabulary values('la ville','����, ����','A1');
insert into vocabulary values('la cit?','����','A1');
insert into vocabulary values('la m?tropole','�뵵��, ����','A1');

insert into vocabulary values('le quartier','����, ����','A1');
insert into vocabulary values('le centre-ville','����','A1');
insert into vocabulary values('le parc','����','A1');
insert into vocabulary values('le gare','��','A1');
insert into vocabulary values('la station de m?tro','����ö��','A1');

insert into vocabulary values('l''arr?t de bus','���� ������','A1');
insert into vocabulary values('la rue','�Ÿ�, ��','A1');
insert into vocabulary values('le boulevard','���, ū ��','A1');
insert into vocabulary values('la route','����','A1');
insert into vocabulary values('l''autoroute','��ӵ���','A1');

insert into vocabulary values('le chemin','��, ����','A1');
insert into vocabulary values('la voie','����, ��','A1');
insert into vocabulary values('le march?','����','A1');
insert into vocabulary values('les halles','�߾� ����','A1');
insert into vocabulary values('le supermarch?','���۸���, ��Ʈ','A1');


insert into vocabulary values('','','A1');
insert into vocabulary values('','','B1');

select * from vocabulary;
select * from (select rownum rn, v.* from vocabulary v) where rn=1;
select count(*) from vocabulary;
where wlevel='%%';
commit;
/*===================================================================*/
desc board;
drop table board;
commit;
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
desc board;
alter table board add hit NUMBER default 0;
alter table board add blike NUMBER default 0;
update board set blike = blike + 1 where board_idx=4;
select  board_idx, custid, topic, title, bcontent, to_char(wdate,'YYYY.MM.DD') as wdate, hit, blike
from board where topic like '%%'
order by board_idx desc;
/*===================================================================*/
select * from board_reply;
select  rwriter, rcontent, to_char(rdate,'YYYY.MM.DD') as rdate
from board_reply where board_idx=7 order by rdate;
delete from board_reply;
commit;

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
/*�� ����� ���� ��õ�� �������� Ȯ��*/
select count(*) from board_heart where hwriter='user1' and board_idx=6;
select count(*) from board_heart where hwriter='user1';

select * from board_heart;
insert into board_heart values(board_heart_seq.nextVal, 'user1', 6);
commit;
select * from board;
update board set blike=0;
/*��õ�� �������� ���ٸ� update*/
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
 
