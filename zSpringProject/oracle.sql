<<<<<<< HEAD
create table user1(
    userId varchar(30) PRIMARY KEY,
    userPasswd varchar(20) not null,
    userName varchar(20) not null, 
    userEmail varchar(30) not null,
    userEmailHash varchar(80) not null,
    userEmailCheck int default 0,
    userphone varchar(15) not null,
    useraddress varchar(60) not null,
    userscore number
);

create table webnote(
    messageno number primary key,
    writer varchar(20) not null,
    receiver varchar(20) not null,
    messagecontent varchar(200) not null,
    regDate Date not null 
);

insert into reply values(2,38,'aaa',0,0,0,'2020-04-16 14:32:06.0','2020-04-16 14:32:06.0','괄호 체크하세요');
insert into reply values(3,38,'aaa',0,0,0,'2020-04-16 14:35:51.0','2020-04-16 14:35:51.0','11111');
insert into reply values(4,38,'aaa',0,0,0,'2020-04-16 15:15:58.0','2020-04-16 15:15:58.0','2222');
insert into reply values(5,38,'aaa',0,0,0,'2020-04-16 15:46:53.0','2020-04-16 15:46:53.0','유림몬 TEST!!');
insert into reply values(6,38,'aaa',0,0,0,'2020-04-17 13:21:56.0','2020-04-17 13:22:03.0','sdfsdfsdf ');

select * from reply

select * from USER1;

delete from USER1;

	SELECT count(userid)
		FROM user1
		WHERE userid ='aaa' and userpasswd ='aaa'
		
		
		select * from USER1
		
SELECT substr(useraddress, 0, instr(useraddress, ' ', 1, 2))
FROM user1


		

=======
select * from USER1;

delete from USER1;

	SELECT count(userid)
		FROM user1
		WHERE userid ='aaa' and userpasswd ='aaa'
		
		
		select * from USER1
		
