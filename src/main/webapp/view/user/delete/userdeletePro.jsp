<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
</head>
<script
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.js"></script>
<script>

$(function(){
	$("#pass").click(function(){
		
}
)

</script>
<body>

if(check==1){
%>	  <meta http-equiv="Refresh"   content="0;url=list.jsp" >
<% }else{%>
     <script language="JavaScript">      
       alert("비밀번호가 맞지 않습니다");
       history.go(-1);
     </script><%    } %>
</body>
</body>
</html>