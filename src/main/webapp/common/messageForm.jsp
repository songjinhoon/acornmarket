<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
     <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
     <style>
        * { font-family: 'Noto Sans KR', sans-serif; }
     </style>
</head>
<body>
   <div class="container-fluid" style="background-color: #212529; height: 30px;">
   </div>
   <div class="container" style="border: 5px solid #745d46; width: 70%; margin-top: 40px;">
      <form method="post" action="${pageContext.request.contextPath}/chat/messagePro">
         <input type="hidden" value="${userName}" name="writer">
         <div class="form-group pt-3">
            <input type="text" name="receiver" id="exception" placeholder="받는사람아이디 입력" style="width: 100%;">
         </div>
         <div class="form-group pt-1" style="width: 100%; margin: 0 auto; ">
            <textarea class="form-control" rows="5" name="messagecontent" placeholder="내용"></textarea>
         </div>      
         <div class="form-group pt-3"><input type="submit" class="btn form-control" value="보내기 " style="background-color: #745d46;"></div>
      </form>
   </div>
</body>
</html>