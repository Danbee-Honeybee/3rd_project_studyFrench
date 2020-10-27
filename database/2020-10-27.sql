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


insert into vocabulary values('antivirus','항바이러스','B1');
insert into vocabulary values('anti-spam','안티스팸','B1');
insert into vocabulary values('antit?rroriste','테러방지','B1');
insert into vocabulary values('antirides','주름방지','B1');
insert into vocabulary values('auto-d?fendre','자기 방어하다','B1');
insert into vocabulary values('une offre','제공, 공급, 공고','B1');
insert into vocabulary values('la promotion','할인','B1');

insert into vocabulary values('une destination','도착 예정지, 여행지','B1');
insert into vocabulary values('un budget','예산','B1');
insert into vocabulary values('des frais','비용','B1');
insert into vocabulary values('?tre limit? ?','~로 제한된다, ~로 한정된다','B1');
insert into vocabulary values('un vol','항공편','B1');
insert into vocabulary values('un h?bergement','숙소','B1');
insert into vocabulary values('une r?servation','예약','B1');

insert into vocabulary values('le d?part','출발','B1');
insert into vocabulary values('l''arriv?e','도착','B1');
insert into vocabulary values('la dur?e du voyage','여행기간','B1');
insert into vocabulary values('un voyageur','여행자','B1');
insert into vocabulary values('un voyagiste','여행 상품을 파는 사람','B1');

commit;

insert into vocabulary values('manquer','놓치다, 잃어버리다','B1');
insert into vocabulary values('une soir?e-t?l?','텔레비전을 시청하는 저녁모임','B1');
insert into vocabulary values('ad?quat','알맞은, 적당한','B1');
insert into vocabulary values('une s?rie','시리즈','B1');
insert into vocabulary values('le suspens','서스펜스','B1');
insert into vocabulary values('r?put?','저명한, 명성이 높은','B1');
insert into vocabulary values('l''internat','인턴 생활, 인턴 기간','B1');
insert into vocabulary values('un interne','기숙생, 인턴','B1');
insert into vocabulary values('immerg?','물에 잠긴','B1');
insert into vocabulary values('la tension','갈등, 긴장','B1');

insert into vocabulary values('ex-femme','전부인','B1');
insert into vocabulary values('ex-mari','전남편','B1');

insert into vocabulary values('ex-copine','전여자친구','B1');
insert into vocabulary values('ex-copin','전남자친구','B1');
insert into vocabulary values('une fronti?re','국경','B1');
insert into vocabulary values('?clater','터지다, 발발하다','B1');
insert into vocabulary values('mettre un ferme ?','~에 종지부를 찍다','B1');

/*A1*/
insert into vocabulary values('l''endroit','장소','A1');
insert into vocabulary values('le lieu','장소, 지역','A1');
insert into vocabulary values('la campagne','시골, 농촌','A1');
insert into vocabulary values('la ville','마을, 동네','A1');
insert into vocabulary values('la cit?','도시','A1');
insert into vocabulary values('la m?tropole','대도시, 수도','A1');

insert into vocabulary values('le quartier','지역, 구역','A1');
insert into vocabulary values('le centre-ville','도시','A1');
insert into vocabulary values('le parc','공원','A1');
insert into vocabulary values('le gare','역','A1');
insert into vocabulary values('la station de m?tro','지하철역','A1');

insert into vocabulary values('l''arr?t de bus','버스 정류장','A1');
insert into vocabulary values('la rue','거리, 길','A1');
insert into vocabulary values('le boulevard','대로, 큰 길','A1');
insert into vocabulary values('la route','도로','A1');
insert into vocabulary values('l''autoroute','고속도로','A1');

insert into vocabulary values('le chemin','길, 방향','A1');
insert into vocabulary values('la voie','선로, 길','A1');
insert into vocabulary values('le march?','시장','A1');
insert into vocabulary values('les halles','중앙 시장','A1');
insert into vocabulary values('le supermarch?','슈퍼마켓, 마트','A1');


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
 
