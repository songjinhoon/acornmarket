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




select * from USER1;

delete from USER1;

	SELECT count(userid)
		FROM user1
		WHERE userid ='aaa' and userpasswd ='aaa'
		
		
		select * from USER1
		
SELECT substr(useraddress, 0, instr(useraddress, ' ', 1, 2))
FROM user1


		
SELECT substr(useraddress, 0, instr(useraddress, ' ', 1, 4))
FROM user1
where substr(useraddress, 0, instr(useraddress, ' ', 1, 2)) =substr(useraddress, 0, instr(useraddress, ' ', 1, 2)) and useraddress not in('서울 강남구 테헤란로 132 8층') 

<<<<<<< HEAD


update board set soldout = 1 where boardnum = 0
=======
=======
select * from USER1;

delete from USER1;

	SELECT count(userid)
		FROM user1
		WHERE userid ='aaa' and userpasswd ='aaa'
		
		
		select * from USER1
		
SELECT substr(useraddress, 0, instr(useraddress, ' ', 1, 2))
FROM user1

update USER1 set useraddress='서울 성동구 용답3길 2 2' where userid='aaa'
update USER1 set useremailcheck=1


SELECT substr(useraddress, 0, instr(useraddress, ' ', 1, 4))
FROM user1
where substr(useraddress, 0, instr(useraddress, ' ', 1, 2)) =substr(useraddress, 0, instr(useraddress, ' ', 1, 2)) and useraddress not in('서울 강남구 테헤란로 132 8층') 
>>>>>>> 799cc39d22c5937a5b33a9c661b36d0721fb4398


select count (*) from reply where replynum = 1 and userid = 'safa'
