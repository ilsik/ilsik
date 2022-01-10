create database Movie;
use Movie;

create table member(
	member_no int primary key not null auto_increment,#회원번호
	member_id varchar(20),# 아이디
    member_pw varchar(20),# 비밀번호
    member_name varchar(20),# 이름
    member_gender varchar(20),# 성별
    member_point int,# 포인트
    member_reg_date datetime,# 가입일자
    member_age date,#생년월일
    member_grade varchar(5)#회원등급
);

create table cinema(
	cinema_title varchar(20),#제목
	cinema_time time,#상영시간
    cinema_type varchar(2),#조조,심야,일반
    cinema_theater int,#상영관
    cinema_price int#영화가격
);
create table movie(
	movie_title varchar(20),#제목
    movie_total_audience int,#누적관객수
    movie_grade double,#평점
    movie_start date,#개봉일
    movie_runningTime int,#영화러닝타임
    movie_age int,#시청연령
    movie_genre varchar(20)#장르
);
create table ticket(

	ticket_memberid varchar(20),# 구매 회원아이디
    ticket_buy_type varchar(20),# 포인트,현금
    ticket_date datetime,#구매일시
    ticket_cinema_title varchar(20),#구매한 영화제목
    ticket_cinema_time time,#구매한 영화상영시간
    ticket_theater int,# 상영관 ex)1
    ticket_seat1 varchar(20),#좌석번호 ex)G
    ticket_seat2 int(20)# 좌석번호 ex)7
);
insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values("qwer","1q2w3e","성일식","남자",20000,now(),"1997-01-05","vip");
insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values("qwer1","1q2w31","김일식","여자",0,now(),"1998-01-05","일반");
insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values("qwer2","1q2w32","박일식","남자",400,'2020-10-16 06:45:27',"1999-01-05","vvip");
insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values("qwer3","1q2w33","최일","여자",87000,now(),"1991-01-05","vip");
insert into member(member_id,member_pw,member_name,member_gender,member_point,member_reg_date,member_age,member_grade) values("qwer4","1q2w34","이일식","여자",30000,now(),"1992-01-05","일반");
select * from member where member_id='qwer3';
select * from member;
insert into cinema values("유체이탈자","08:40","조조",1,8000);
insert into cinema values("이터널스","11:00","일반",1,12000);
insert into cinema values("킬링카인드","15:00","일반",1,12000);
insert into cinema values("킬링카인드","18:20","일반",1,12000);
insert into cinema values("유체이탈자","21:00","심야",1,8000);
insert into cinema values("고스트버스터즈라이즈","08:20","조조",2,8000);
insert into cinema values("유체이탈자","11:30","일반",2,12000);
insert into cinema values("킬링카인드","14:00","일반",2,12000);
insert into cinema values("고스트버스터즈라이즈","17:20","일반",2,12000);
insert into cinema values("듄","23:30","심야",2,8000);
insert into cinema values("유체이탈자","08:00","조조",3,8000);
insert into cinema values("연애빠진로맨스","11:00","일반",3,12000);
insert into cinema values("유체이탈자","16:10","일반",3,12000);
insert into cinema values("킬링카인드","19:50","일반",3,12000);
insert into cinema values("고스트버스터즈라이즈","24:10","심야",3,8000);

select * from cinema;

insert into movie values("킬링카인드",1598,7.6,"2021-12-01",108,15,"범죄,스릴러,액션");
insert into movie values("고스트버스터즈라이즈",20609,7.6,"2021-12-01",124,12,"미스터리,액션,어드벤처");
insert into movie values("유체이탈자",468237,8.3,"2021-11-24",108,15,"액션,판타지");
insert into movie values("연애빠진로맨스",275774,8.3,"2021-11-24",95,15,"로맨스,코미디");
insert into movie values("이터널스",3003282,7.8,"2021-11-03",155,12,"드라마,액션,어드벤처");
insert into movie values("듄",1443340,9.0,"2021-10-20",155,12,"SF");

select * from movie;

insert into ticket values("qwer","현금",now(),"이터널스","11:00",1,"G",7);
insert into ticket values("qwer2","현금",now(),"유체이탈자","16:10",3,"E",3);
insert into ticket values("qwer3","포인트",now(),"연애빠진로맨스","11:00",3,"C",1);

select * from ticket;

select movie_title from movie order by movie_grade;

select * from cinema where cinema_title ="킬링카인드" order by cinema_theater;
select ticket_seat1,ticket_seat2 from ticket where ticket_theater=1 and ticket_cinema_time="11:00:00";