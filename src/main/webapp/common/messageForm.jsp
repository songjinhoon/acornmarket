<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container" style="border: 1px solid black; width: 70%; margin-top: 30px; margin-bottom: 1qpx solid black; ">
		<form method="post" action="${pageContext.request.contextPath}/chat/messagePro">
			<input type="hidden" value="보내는사람이름" name="writer">
			<input type="hidden" value="받는사람이름" name="receiver">
			<div class="row form-group pt-1">
				<div class="col-6">보내는사람: </div>
				<div class="col-6">DATA PUSH</div>
			</div>
			<div class="row form-group pt-1">
				<div class="col-6">받는 사람: </div>
				<div class="col-6">DATA PUSH</div>
			</div>
			<div class="row form-group pt-1" style="width: 80%; margin: 0 auto; ">
				<textarea class="form-control" rows="5" name="messageContent"></textarea>
			</div>		
			<div class="form-group pt-3"><input type="submit" class="btn btn-primary form-control" value="보내기 "></div>
		</form>
	</div>
</body>
</html>