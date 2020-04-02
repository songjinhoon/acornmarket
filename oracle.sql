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

