create database camping;
use camping;

create table camp(
	camp_No int primary key not null auto_increment,
    camp_name varchar(50),
	camp_address varchar(100),
    camp_type varchar(20),
    camp_price int,
    camp_introduction varchar(10000),
    camp_img varchar(100),
    camp_like int,
    camp_scope double
);

insert into camp(camp_name,camp_address, camp_type, camp_price,camp_introduction, camp_img,camp_like,camp_scope) value('시흥캠핑장','경기 시흥시 어쩌고','오토캠핑',50000,'우리캠핑장은 어쩌고 저쩌고','시흥캠핑장.jpg',0,0);
insert into camp(camp_name,camp_address, camp_type, camp_price,camp_introduction, camp_img,camp_like,camp_scope) value('시흥캠핑장','경기 시흥시 어쩌고','오토캠핑',50000,'우리캠핑장은 어쩌고 저쩌고','시흥캠핑장.jpg',0,0);
insert into camp(camp_name,camp_address, camp_type, camp_price,camp_introduction, camp_img,camp_like,camp_scope) value('안산캠핑장','경기 시흥시 어쩌고','오토캠핑',50000,'우리캠핑장은 어쩌고 저쩌고','시흥캠핑장.jpg',0,0);
select * from camp where camp_name like '%시흥%';
select * from camp;

create table review(
	camp_no int,
    comment varchar(1000),
    scope int,
    camp_date date,
    nickname varchar(20)
);
create table img(	
	camp_No int,
    img varchar(100)
);

select * from img 
where camp_No in (select camp_No from camp where camp_name like '%시흥%');

select * from img;

insert into img values(1,'시흥캠핑장.jpg');
insert into img values(1,'시흥캠핑장2.jpg');
insert into img values(3,'안산캠핑장.jpg');

