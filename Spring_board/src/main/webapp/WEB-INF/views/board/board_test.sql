create database board_test;
use board_test;
	create table board(
		board_no int primary key  auto_increment not null,
		board_title varchar(20),
		board_type varchar(20),
		board_content varchar(1000),
		board_name varchar(20),
		board_pw varchar(20),
        board_regdate datetime
	);  
    create table comment(
		comment_name varchar(20),
		comment_content varchar(1000),
		ref INT,#글그룹
		reStep INT,#글 깊이
		reLevel INT,# 글 그룹내 출력순서
		comment_regdate datetime
    );
    insert into comment value("철수",'나도 놀고 싶어',2,2,2,'2021-07-11 23:43:59');
    insert into comment value("영희",'싸움이야? 나도 끼어야지', 2, 2, 4,now());
    insert into comment value("민수",'너뭐해', 2, 3, 3,now());
    insert into comment value("브랜드",'세상을 불태울 준비는 되었나?', 8, 2, 2,now());
    insert into comment value("가렌",'정의의 이름으로', 8, 3, 3,now());
    insert into comment value("케넨",'그래그래!', 7, 2, 3,now());
    insert into comment value("람머스",'그래', 7, 2, 2,now());
    insert into comment value("렝가",'ㅡㅡ', 6, 2, 2,now());
    insert into comment value("고양이",'야옹야옹', 6, 3, 3,now());
    insert into comment value("강아지",'ㄹㅇ', 6, 4, 4,now());
    insert into comment value("루시안",'뭐래', 5, 2, 2,now());
    insert into comment value("승현",'아니요',1, 2, 3,now());
    insert into comment value("오리아나",'재밌겠네요',1, 2, 2,now());
    
    select * from comment;

insert into board values(1,"가나다","일반","위 내용은 테스트입니다1","성일식","1234",now());
insert into board values(2,"가나다라","익명","위 내용은 테스트입니다2","성이식","2345",now());
insert into board values(3,"가나다라마","Q&A","위 내용은 테스트입니다3","성삼식","3456",now());
insert into board values(4,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(5,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(6,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(7,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(8,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(9,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(10,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(11,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(12,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(13,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(14,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(15,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(16,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(17,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board values(18,"가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());
insert into board (board_title,board_type,board_content,board_name,board_pw,board_regdate)value("가나다라마바","자유","위 내용은 테스트입니다4","성사식","4567",now());





select * from board where board_no='131';
select * from board;
select * from board where board_type='익명' order by board_no desc limit 0,10 ;
select * from board order by board_no desc;

create table member(
	member_no int not null auto_increment primary key,
	member_id varchar(20),
    member_pw varchar(20),
    member_name varchar(20),
    member_gender varchar(3),
    member_age date
);


insert into member(member_id,member_pw,member_name,member_gender,member_age) values("admin","admin","관리자","남자","1997-01-05");
insert into member(member_id,member_pw,member_name,member_gender,member_age) values("aaa","111","가가가","남자","1997-01-05");
insert into member(member_id,member_pw,member_name,member_gender,member_age) values("bbb","222","나나나","여자","1997-01-05");
insert into member(member_id,member_pw,member_name,member_gender,member_age) values("ccc","333","다다다","남자","1997-01-05");

select * from member;