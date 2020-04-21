<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>userPasswdCheck</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.js"></script>

<body>

	<script>
	
	if(${check == 1}){
		alert("탈퇴되었습니다.\n그동안 도토리마켓을 이용해주셔서 감사합니다.");	
		location.href="${pageContext.request.contextPath}/main/main";
	}else if(${check != 1}){
		alert("비밀번호가 맞지 않습니다\n다시 입력해주세요.");
		history.go(-1);
	} 
	
	</script>
	
</body>
</html>